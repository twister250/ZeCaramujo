package br.com.zecaramujo.hostel

import grails.transaction.Transactional
import grails.util.Holders;
import java.awt.image.BufferedImage
import javax.imageio.ImageIO;
import javax.servlet.ServletRequest;
import org.imgscalr.Scalr;

@Transactional
class ImageService {
	def grailsApplication = Holders.getGrailsApplication()
	def imagePath	= grailsApplication.metadata.get("image.path")
	def thumbPath	= grailsApplication.metadata.get("thumb.path")
	def customPath	= grailsApplication.metadata.get("custom.path")

	/*
	 * Salva a imagem do request no disco,
	 * cria um thumbnail e uma imagem com tamanho customizável para ser utilizada na capa.
	 */
	def upload(imageRequest, imageInstance){
		def fileName = imageInstance.id
		def extension = imageInstance.extension
		def imageFolder = new File(imagePath)
		def thumbFolder = new File(thumbPath)
		def customFolder = new File(customPath)
		def image = new File(imageFolder,fileName+"."+extension)		
		
		if(!imageRequest.empty){
			/* Verifica a existência dos diretórios das imagens e os cria se necessário */
			if(!imageFolder.exists()) imageFolder.mkdir()
			if(!thumbFolder.exists()) thumbFolder.mkdir()			
			if(!customFolder.exists()) customFolder.mkdir()
			
			/* Salva a imagem no disco */
			imageRequest.transferTo(image)
			
			/* Cria thumbnail e imagem customizada a ser utilizada na capa, e salva no disco */			
			BufferedImage bufferedImage = ImageIO.read(image)
			createCustomImage(image, bufferedImage, imageInstance, ['path':thumbPath])
			createCustomImage(image, bufferedImage, imageInstance, ['path':customPath, 'width': 960, 'height': 480])
		}else{
			flash.message = "Erro ao carregar imagem ${imageInstance}"
		}
	}
	
	/*
	 * Deleta a imagem do disco
	 */
	def clearCache(imageInstance){
		def fileName = imageInstance.id
		def extension = imageInstance.extension
		def imageFolder		= new File(imagePath)
		def thumbFolder		= new File(thumbPath)
		def customFolder	= new File(customPath)
		def image = new File(imageFolder,fileName+"."+extension)
		def thumb = new File(thumbFolder,fileName+"."+extension)
		def custom = new File(customFolder,fileName+"."+extension)
		
		if(image.exists() && image.isFile()){
			image.delete()
		}
		if(thumb.exists() && thumb.isFile()){
			thumb.delete()
		}
		if(custom.exists() && custom.isFile()){
			custom.delete()
		}
	}
	
	/*
	 * Cria as imagens customizadas (thumbnail e imagem da capa)
	 */
	def createCustomImage(File imageFile, BufferedImage bufferedImage, Image imageInstance, Map properties){
		def fileName = imageInstance.id+"."+imageInstance.extension
		File custom = new File(properties.get("path"), fileName)		
		try{
			if(properties.size() > 1){
				bufferedImage = Scalr.resize(ImageIO.read(imageFile), Scalr.Method.QUALITY, properties.get("width"), properties.get("height"))
			}else{
				bufferedImage = Scalr.resize(ImageIO.read(imageFile), Scalr.Method.QUALITY, 150)
			}
			ImageIO.write(bufferedImage, imageInstance.extension, custom)
		}catch(Exception e){
			e.printStackTrace()
		}
	}
	
	/*
	 * Retorna os caminhos dos diretórios de imagens
	 */
	def getPath(){
		def path = [imagePath: imagePath, thumbPath: thumbPath, customPath: customPath]
		return path
	}
}