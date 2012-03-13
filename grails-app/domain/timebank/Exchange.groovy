package timebank

import org.joda.time.Period

class Exchange {

    User provider
    User receiver
    Period timeTaken
    Activity activity

    static constraints = {
    }
}
