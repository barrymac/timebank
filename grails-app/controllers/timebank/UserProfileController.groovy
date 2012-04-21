package timebank

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import grails.plugins.springsecurity.ui.UserController
import org.joda.time.Duration
import org.joda.time.LocalDate

@Secured(['IS_AUTHENTICATED_REMEMBERED'])
class UserProfileController extends UserController {

    def index = { }

    @Secured(['ROLE_ADMIN'])
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def editProfile = {
        User userInstance = springSecurityService.currentUser
        int i = 1
        i = 1

        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            render(view: "editProfile", model: [userInstance: userInstance])
        }
        else {
            return [userInstance: userInstance]
        }
    }

    @Secured(['ROLE_ADMIN'])
    def editUserProfile = {
        User userInstance = User.get(params.id)
        int i = 1
        i = 1

        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            render(view: "editUserProfile", model: [userInstance: userInstance])
        }
        else {
            render(view: "editUserProfile", model: [userInstance: userInstance])
        }
    }

    @Secured(['ROLE_ADMIN'])
    def updateUserProfile = {
        User userInstance = User.get(params.id)
        int i = 1
        i = 1

        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this Profile while you were editing")
                    render(view: "editUserProfile", model: [userInstance: userInstance])
                }
            }
            userInstance.firstName = params.firstName
            userInstance.secondName = params.secondName
            userInstance.dob = new LocalDate(params.dob_year as int, params.dob_month as int, params.dob_day as int)

            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.profile.message')}"
                userCache.removeUserFromCache userInstance.username
                render(view: "list", model: [userInstanceList: User.list(params), userInstanceTotal: User.count()])
            }
            else {
                render(view: "editUserProfile", model: [userInstance: userInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            render(view: "list", model: [userInstanceList: User.list(params), userInstanceTotal: User.count()])
        }
    }

    def updateProfile = {
        User userInstance = springSecurityService.currentUser

        int i = 1
        i = 1

        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this Profile while you were editing")
                    render(view: "editProfile", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.firstName = params.firstName
            userInstance.secondName = params.secondName
            userInstance.dob = new LocalDate(params.dob_year as int, params.dob_month as int, params.dob_day as int)
//            userInstance.dob = params.dob

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

    def addSkill = {
        def userInstance = User.get(params.id)

        Skill newSkill = Skill.findByName(params.txtSkill)
        if (!newSkill) {
            newSkill = new Skill(name: params.txtSkill, description: ' ').save(flush: true)
        }
        UserSkill userSkill = new UserSkill(user: userInstance, skill: newSkill)

        if (!userSkill.hasErrors() && userSkill.save(flush: true)) {
            flash.message = "${message(code: 'default.updated.profile.message')}"
            render(view: "editProfile", model: [userInstance: userInstance])
        }
        else {
            render(view: "editProfile", model: [userInstance: userInstance])
        }
    }

    @Secured(['ROLE_ADMIN'])
    def updateBalance = {
        def userInstance = User.get(params.id)
        println(params)
        userInstance.balance = new Duration((Long.parseLong(params.balance) * 1000 * 60 * 60))
        if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.updated.profile.message')}"
            userCache.removeUserFromCache userInstance.username
            int i = 1
            i = 1

            render(view: "updateBalance", model: [userInstance: userInstance])
//            render(view: "list", model: [userInstance: userInstance])
        }
        else {
            redirect(action: "showBalance", model: [userInstance: userInstance])
        }

    }

    @Secured(['ROLE_ADMIN'])
    def showBalance = {
        def userInstance = User.get(params.id)

        render(view: "updateBalance", model: [userInstance: userInstance])
    }

    def suggestSkill = {
        def userInstance = User.get(params.id)


    }

    def ajaxSkillSearch = {
        String query = params.remove('term');
        List skills = Skill.findAllByNameIlike(query + '%').collect() {
            return [
                    id: it.id,
                    label: it.name,
                    value: it.name
            ]
        }
        render skills as JSON
    }

}
