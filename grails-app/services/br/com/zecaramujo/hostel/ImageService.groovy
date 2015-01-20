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
	def imagePath = grailsApplication.metadata.get("image.path")
	def thumbPath = grailsApplication.metadata.get("thumb.path")

	def upload(imageRequest, imageInstance){
		def fileName = imageInstance.id
		def extension = imageInstance.extension
		def imageFolder = new File(imagePath)
		def thumbFolder = new File(thumbPath)
		def image = new File(imageFolder,fileName+"."+extension)
		def thumb = new File(thumbFolder,fileName+"_thumb."+extension)
		
		if(!imageRequest.empty){
			/* Verifica se existem os diretórios de imagem e thumbnail */
			if(!imageFolder.exists()){
				imageFolder.mkdir()
			}
			if(!thumbFolder.exists()){
				thumbFolder.mkdir()
			}
			
			/* Salva a imagem no disco */
			imageRequest.transferTo(image)
			
			/* Cria thumbnail da imagem e salva no disco */
			BufferedImage thumbnail = Scalr.resize(ImageIO.read(image), Scalr.Method.QUALITY, 150)
			ImageIO.write(thumbnail, extension, thumb)
		}else{
			flash.message = "Erro ao carregar imagem ${imageInstance}"
		}
	}
	
	def clearCache(imageInstance){
		def fileName = imageInstance.id
		def extension = imageInstance.extension
		def imageFolder = new File(imagePath)
		def thumbFolder = new File(thumbPath)
		def image = new File(imageFolder,fileName+"."+extension)
		def thumb = new File(thumbFolder,fileName+"_thumb."+extension)
		if(image.exists() && image.isFile()){
			image.delete()
		}
		if(thumb.exists() && thumb.isFile()){
			thumb.delete()
		}
	}
	
	def getPath(){
		def path = [imagePath: imagePath, thumbPath: thumbPath]
		return path
	}
}