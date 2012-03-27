package timebank

import org.joda.time.LocalDate
import org.joda.time.Period
import org.joda.time.contrib.hibernate.PersistentLocalDate

class User {

    static hasMany = [openIds: OpenID, exchangesProvided: Exchange, exchangesReceived: Exchange,
            offeredSkills: Skill, createdRequests: Request]
    static mappedBy = [exchangesProvided: 'provider', exchangesReceived: 'receiver']

    String firstName
    String secondName
    LocalDate dob
    SortedSet<Exchange> exchangesProvided
    SortedSet<Exchange> exchangesReceived
    SortedSet<Request> createdRequests
//    SortedSet<Skill> offeredSkills

    String username
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static constraints = {
        firstName blank: true, nullable: true
        secondName blank: true, nullable: true
        dob blank: true, nullable: true

        username blank: false, unique: true
        password blank: true
    }

    static mapping = {
        dob type: PersistentLocalDate
        password column: '`password`'
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

    transient springSecurityService
    transient balance = getBalance()

    def getBalance() {
//        todo calculate balance based on exchanges provided and received
        Period balance = new Period(0)
        int i = 0
        i = 0

        println("${balance.toString()} formate")

        exchangesProvided.each {
            println(it.timeTaken)
//            balance = balance.withFields(it.timeTaken.toPeriod())
        }

        exchangesReceived.each {
//            balance = balance.withFields(it.timeTaken.toPeriod())
        }

//        println("${balance.toStandardHours()} hours")

        return "${balance.toStandardHours()} hours"
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }

    @Override
    public String toString() {
        return "$firstName $secondName";
    }


}
