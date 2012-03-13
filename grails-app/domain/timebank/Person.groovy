package timebank

import org.joda.time.DateTime
import org.joda.time.contrib.hibernate.PersistentLocalDate

class Person extends User {

    static hasMany = [jobs: Job, requests: Request, exchangesProvided: Exchange, exchangesReceived: Exchange, skills: Skill, offeredSkills: Offer]

    String firstName
    String secondName
    DateTime dob
    SortedSet exchangesProvided
    SortedSet exchangesReceived

    static constraints = {
        firstName blank: true, nullable: true
        secondName blank: true, nullable: true
        dob blank: true, nullable: true
    }

    static mapping = {
        dob type: PersistentLocalDate
    }

}
