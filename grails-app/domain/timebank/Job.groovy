package timebank

import org.joda.time.LocalDate
import org.joda.time.contrib.hibernate.PersistentLocalDate

class Job {

    def User user1
    static belongsTo = [User]
    LocalDate endTime
    LocalDate startTime
    LocalDate dateCreated
    LocalDate lastUpdated

    static mapping = {
        startTime type: PersistentLocalDate
        endTime type: PersistentLocalDate
        dateCreated type: PersistentLocalDate
        lastUpdated type: PersistentLocalDate
    }

    static constraints = {
    }
}
