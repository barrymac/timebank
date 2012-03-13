package timebank

import org.joda.time.Period

class Exchange {

    Person provider
    Person receiver
    Period timeTaken
    Activity activity

    static constraints = {
    }
}
