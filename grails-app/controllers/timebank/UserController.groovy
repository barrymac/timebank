package timebank

class UserController extends grails.plugins.springsecurity.ui.UserController {

    def create = {
        def user = lookupUserClass().newInstance(params)
        user.enabled = true
        [user: user, authorityList: sortedRoles()]
    }

    def save = {
        def user = lookupUserClass().newInstance(params)
        user.password = 'none'
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