package timebank

import org.joda.time.DateTime

class Person {

    String firstName
    String secondName
    DateTime dob

    static constraints = {
    }
    static hasMany = [jobs: Job]
}
