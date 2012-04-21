package timebank

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class UserController extends grails.plugins.springsecurity.ui.UserController {

    def create = {
        def userInstance = lookupUserClass().newInstance(params)
        [userInstance: userInstance, authorityList: sortedRoles()]
    }

    def save = {
        def user = lookupUserClass().newInstance(params)
        user.password = 'changeme'
        if (!user.save(flush: true)) {
            render view: 'create', model: [user: user, authorityList: sortedRoles()]
            return
        }

        addRoles(user)
        flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])}"
        redirect(controller: "userProfile", action: "list")
    }

    def show = {
        redirect(controller: "userProfile", action: "showBalance", params: [id: params.id])
    }

}