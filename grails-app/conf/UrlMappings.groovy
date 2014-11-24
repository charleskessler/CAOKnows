class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:'Dashboard', action:'index')
        "500"(view:'/error')
        "/index.gsp"(view:"/dashboard/index")
	}
}
