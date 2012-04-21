package timebank

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

}
