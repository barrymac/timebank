package timebank

import org.joda.time.DateTime
import org.joda.time.contrib.hibernate.PersistentLocalDate

class Person extends User {

    String firstName
    String secondName
    DateTime dob

    static constraints = {
        firstName blank: true, nullable: true
        secondName blank: true, nullable: true
        dob blank: true, nullable: true
    }

    static mapping = {
        dob type: PersistentLocalDate
    }

    static hasMany = [jobs: Job]
}
