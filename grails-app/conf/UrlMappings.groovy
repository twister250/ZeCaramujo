class UrlMappings {

	static mappings = {
				
		/* Mapeamento do Admin */
        "/hostel/system/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }		
		
        "/"(controller:"home")
        
		"500"(view:"/error")
		
		"/test"(controller: "test")
		
	}
}