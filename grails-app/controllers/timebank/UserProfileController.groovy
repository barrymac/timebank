package timebank

import grails.plugins.springsecurity.Secured
import grails.plugins.springsecurity.ui.UserController

class UserProfileController extends UserController {

    def index = { }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def editProfile = {
        def userInstance
        userInstance = springSecurityService.currentUser

        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            render(view: "editProfile", model: [userInstance: userInstance])
        }
        else {
            return [userInstance: userInstance]
        }
    }

    def updateProfile = {
        def userInstance = User.get(params.id)

        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'exchange.label', default: 'Exchange')] as Object[], "Another user has updated this Profile while you were editing")
                    render(view: "editProfile", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.profile.message')}"
                userCache.removeUserFromCache userInstance.username
                render(view: "editProfile", model: [userInstance: userInstance])
//                redirect(action: "editProfile", id: userInstance.id)
            }
            else {
                render(view: "editProfile", model: [userInstance: userInstance])
            }
        }
    }


}
