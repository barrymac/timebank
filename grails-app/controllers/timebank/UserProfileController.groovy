package timebank

import grails.plugins.springsecurity.Secured
import grails.plugins.springsecurity.ui.UserController

class UserProfileController extends UserController {

    def index = { }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def editProfile = {
        def personInstance

        personInstance = springSecurityService.currentUser

        if (!personInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userInstance: personInstance]
        }
    }

    def updateProfile = {
        def userInstance = User.get(params.id)

        int i = 1
        int j = 1

        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'exchange.label', default: 'Exchange')] as Object[], "Another user has updated this Profile while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'Profile'), userInstance.id])}"
                userCache.removeUserFromCache userInstance.username
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "editProfile", model: [userInstance: userInstance])
            }
        }
    }


}
