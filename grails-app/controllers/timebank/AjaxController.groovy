package timebank

import grails.converters.JSON
import org.joda.time.Duration

class AjaxController {

    def addHour = {
        log.debug(params)
        def userInstance = User.get(params.id as long)
        if (userInstance.balance) {
            userInstance.balance = userInstance.balance.toStandardHours().plus(1).toStandardDuration() as Duration
        } else {
            userInstance.balance = new Duration(0)
            userInstance.balance = userInstance.balance.toStandardHours().plus(1).toStandardDuration() as Duration
        }

        userInstance.save(failOnError: true)
        render(contentType: "text/json") {
            newBalance = userInstance.balance.standardHours
        }
    }

    def subtractHour = {
        log.debug(params)
        def userInstance = User.get(params.id)
        if (userInstance.balance) {
            userInstance.balance = userInstance.balance.toStandardHours().minus(1).toStandardDuration() as Duration
        } else {
            userInstance.balance = new Duration(0)
            userInstance.balance = userInstance.balance.toStandardHours().minus(1).toStandardDuration() as Duration
        }
        userInstance.save(failOnError: true)
        render(contentType: "text/json") {
            newBalance = userInstance.balance.standardHours
        }
    }

    def addUserSkill = {
        log.debug(params)
        def userInstance = User.get(params.id)

        Skill newSkill = Skill.findByName(params.txtSkill)
        if (!newSkill) {
            newSkill = new Skill(name: params.txtSkill, description: ' ').save()
        }
        userInstance.addToSkills(newSkill)

        render(contentType: "text/json") {
            skillList = userInstance.skills()
        }
    }

    private void handleJsonResult(def result) {
        if (params.callback) {
            render(contentType: 'text/javascript', text: "${params.callback}(${result});")
        }
        else {
            render result
        }
    }

    private void handleResult(def result) {
        if (params.callback) {
            render(contentType: 'text/javascript', text: "${params.callback}(${result as JSON});")
        }
        else {
            render result as JSON
        }
    }


    private void handleError(def code, def message) {
//        response.status = Integer.parseInt(code)

        handleMessage(message, false)
    }

    private void handleMessage(def message) {
        handleMessage(message, true)
    }

    private void handleMessage(def message, def success) {
        def data = [message: message, success: success]
        if (params.callback) {
            render(contentType: 'text/javascript', text: "${params.callback}(${data as JSON});")
        }
        else {
            render message
        }
    }
}
