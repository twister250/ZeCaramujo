package br.com.zecaramujo.web

import org.grails.datastore.mapping.query.Projections;

import br.com.zecaramujo.hostel.Image;

class HomeController {

    def index() {
		def images = Image.findAllWhere(published: true)	
		render (view: "home", model: [images: images, imageCount: images.size()])
	}
}