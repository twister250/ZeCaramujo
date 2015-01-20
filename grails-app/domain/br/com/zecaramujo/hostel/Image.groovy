package br.com.zecaramujo.hostel

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import javax.imageio.ImageIO;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

class Image {

	long id
	byte[] image
	String originalFilename
	String extension
	String description
	int width
	int height
	boolean published
	
	static constraints = {
		image blank: false
		image maxSize: 1024 * 1024 * 3 // limite máximo da imagem 3MB (3145728 bytes)
		originalFilename nullable: false
		description nullable: true
		published nullable: true
	}
	
	static transients = ["image"]
	
	Image(){}
	
	Image(Image imageInstance){
		this.image = imageInstance.image
		this.originalFilename = imageInstance.originalFilename
		this.extension = imageInstance.originalFilename.substring(imageInstance.originalFilename.indexOf(".")+1)
		this.description = imageInstance.description
		InputStream inputStream = new ByteArrayInputStream(this.image);
		BufferedImage buffer = ImageIO.read(inputStream);
		this.width = buffer.getWidth()
		this.height= buffer.getHeight()
		this.published = imageInstance.published
	}
	
}