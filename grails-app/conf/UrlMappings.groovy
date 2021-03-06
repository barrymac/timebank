class UrlMappings {

    static mappings = {

        "/login/auth" {
            controller = 'openId'
            action = 'auth'
        }

        "/login/openIdCreateAccount" {
            controller = 'openId'
            action = 'createAccount'
        }

        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(view: "/index")
//        "/"(controller: "home")
        "500"(view: '/error')
        "404"(view: '/construction')
    }
}
