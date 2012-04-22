package timebank

import org.joda.time.Duration
import org.joda.time.LocalDate
import org.joda.time.contrib.hibernate.PersistentDuration

class User {

//    static mappedBy = [exchangesProvided: 'provider', exchangesReceived: 'receiver']
//    static hasMany = [openIds: OpenID, exchangesProvided: Exchange, exchangesReceived: Exchange, skills: UserSkill, createdRequests: Request, referees: Referee]
    static hasMany = [openIds: OpenID, skills: Skill, userSkills: UserSkill]
    static mappedBy = [skills: "user"]


    String firstName
    String secondName
    String address1
    String address2
    String postcode
    LocalDate dob
    String userType = "individual"
    String phoneNumber
    String email
//    SortedSet<Exchange> exchangesProvided
//    SortedSet<Exchange> exchangesReceived
//    SortedSet<Request> createdRequests
//    SortedSet<Skill> skills
    Duration balance

    String username
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static constraints = {
        username blank: false, unique: true
        firstName blank: true, nullable: true
        secondName blank: true, nullable: true
        address1 nullable: true
        address2 nullable: true
        postcode nullable: true
        balance nullable: true
        dob blank: true, nullable: true
        password blank: true
        userType inList: ["individual", "organisation", "group"]
        phoneNumber length: 1..12, unique: true, matches: /[0-9]/, blank: true, nullable: true
        email blank: true, nullable: true, email: true
//        skills unique: true
    }

    static mapping = {
        balance nullable: true, blank: true, type: PersistentDuration
        password column: '`password`'
    }

//    def getBalance() {
//        int i = 1
//        i = 1
//        if (balance) {
//            println("balance: ${balance.toStandardHours().hours}")
//            return balance.toStandardHours().hours
//        } else {
//            balance = new Duration(0)
//            return balance.toStandardHours().hours
//        }
//    }

    List skills() {
        return userSkills.collect {
            int i = 1
            i = 1
            it.skill
        }
    }

    List addToSkills(Skill skill) {
        int i = 1
        i = 1
        UserSkill.link(this, skill)
        return skills()
    }

    List removeFromSkills(Skill skill) {
        UserSkill.unlink(this, skill)
        return skills()
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    static searchable = [
            only: ['firstName', 'secondName', 'username'],
            spellCheck: ['firstName', 'secondName', 'username']
    ]

//    static searchable = {
//        spellCheck "include"
//    }

    transient springSecurityService
//    transient balance = getBalance()

//    def getBalance() {
////        todo calculate balance based on exchanges provided and received
//        Period balance = new Period(0)
//        int i = 0
//        i = 0
//
//        println("${balance.toString()} formate")
//
//        exchangesProvided.each {
//            println(it.timeTaken)
////            balance = balance.withFields(it.timeTaken.toPeriod())
//        }
//
//        exchangesReceived.each {
////            balance = balance.withFields(it.timeTaken.toPeriod())
//        }
//
////        println("${balance.toStandardHours()} hours")
//
//        return "${balance.toStandardHours()} hours"
//    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }

    @Override
    public String toString() {
        if (firstName && secondName) {
            return "$firstName $secondName";
        } else if (username) {
            return "$username";
        } else {
            return "who?"
        }
    }

}
