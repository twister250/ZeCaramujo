package br.com.zecaramujo.hostel

import grails.transaction.Transactional
import grails.util.Holders;
import java.awt.image.BufferedImage
import javax.imageio.ImageIO;
import org.imgscalr.Scalr;
import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class ImageController {

	def imageService
    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]
	
	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Image.list(params), model:[imageInstanceCount: Image.count()]
    }
	
    def show(Image imageInstance) {
        respond imageInstance		
    }
	
	/*
	 * Exibe a imagem.
	 */
	def displayImage(Image imageInstance){
		File imageFile
		def fileName = imageInstance.id
		def extension = "."+imageInstance.extension
		def path = imageService.path
		if(params.type.equals("thumb")){			
			imageFile = new File(path["thumbPath"],fileName+extension)
		}else{
			if(params.type.equals("image")){
				imageFile = new File(path["imagePath"],fileName+extension)
			}else{
				imageFile = new File(path["customPath"],fileName+extension)
			}
		}
		render file: imageFile, contentType: imageInstance.extension
	}
	
	/*
	 * Publica/Despublica a imagem na capa.
	 * Este método somente altera a propriedade "published" no banco de dados, sem alterar a imagem. 	
	 */
	@Transactional
	def publish(Image imageInstance){
		boolean published = imageInstance.published
		if(published){
			imageInstance.published = false
		}else{
			imageInstance.published = true			
		}
		imageInstance.save(flush: true)
		respond Image.list(params)
	}
	
    def create() {
        respond new Image(params)
    }

	/*
	 * Cria um objeto CommonsMultipartFile a partir do arquivo carregado no request.
	 * Cria um novo objeto Image a partir dos parâmetros do request.
	 * Salva o objeto Image no banco de dados e salva a imagem no disco.
	 * Caso ocorra algum erro no save do banco de dados, é feito rollback.
	 */
	@Transactional
	def save(Image imageInstance) {
		
		def imageRequest = request.getFile("image")
		imageInstance.image = params.image.bytes
		imageInstance.originalFilename = params.image.originalFilename
		imageInstance.description = params.description
		boolean published = params.published
		imageInstance.published = published
		def image = new Image(imageInstance)		
		
		if (image.save(flush: true)){			
			imageService.upload(imageRequest, image)
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'image.label', default: 'Image'), image.id])}"
			redirect(action: "show", id: image.id)
		} else {
			render(view: "create", model: [imageInstance: image])
		}
	}

    def edit(Image imageInstance) {
        respond imageInstance
    }
	
	/*
	 * Cria um objeto CommonsMultipartFile a partir do arquivo carregado no request.
	 * Busca a instância no banco de dados.
	 * Deleta as imagens antigas do disco (imagem e thumb).
	 * Popula o objeto image, atualiza no banco de dados e salva a nova imagem no disco.
	 */	
    @Transactional
    def update(Image imageInstance) {
        if (imageInstance == null) {
            notFound()
            return
        }

        if (imageInstance.hasErrors()) {
            respond imageInstance.errors, view:'edit'
            return
        }
		
		def imageRequest = request.getFile("image")
		
		def image = Image.get(imageInstance.id)
		
		imageService.clearCache(image)
		
		image.image = params.image.bytes
		image.originalFilename = params.image.originalFilename
		image.extension = image.originalFilename.substring(image.originalFilename.indexOf(".")+1)
		image.description = params.description
		boolean published = params.published
		InputStream inputStream = new ByteArrayInputStream(image.image)
		BufferedImage buffer = ImageIO.read(inputStream)
		image.width = buffer.getWidth()
		image.height= buffer.getHeight()
		image.published = published
        
		if(image.save(flush:true)){			
			imageService.upload(imageRequest, image)
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'image.label', default: 'Image'), image.id])}"
			redirect(action: "show", id: image.id)
		} else {
			render(view: "create", model: [imageInstance: image])
		}
    }

    @Transactional
    def delete(Image imageInstance) {

        if (imageInstance == null) {
            notFound()
            return
        }

        try{
			imageInstance.delete(flush:true, failOnError: true)
			imageService.clearCache(imageInstance)
		}catch(Exception e){
			e.printStackTrace()
		}		

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Image.label', default: 'Image'), imageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }	
}
