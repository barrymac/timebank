package timebank

import org.joda.time.DateTime
import org.joda.time.Period
import org.joda.time.contrib.hibernate.PersistentDateTime
import org.joda.time.contrib.hibernate.PersistentPeriod

class Request {

    def User creator
    static belongsTo = [User]
    String title
    String description
    Period timeEstimate
    DateTime lastUpdated
    DateTime dateCreated
    boolean complete

    static mapping = {
        timeEstimate type: PersistentPeriod
        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }

    static constraints = {
    }
}
