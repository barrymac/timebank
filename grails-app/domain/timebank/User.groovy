package timebank

import org.joda.time.DateTime
import org.joda.time.contrib.hibernate.PersistentLocalDate

class User {

    static hasMany = [openIds: OpenID, jobsDone: Job, createRequests: Request]
    transient springSecurityService

    String firstName
    String secondName
    DateTime dob

    String username
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static constraints = {
        username blank: false, unique: true
        password blank: true
        firstName blank: true, nullable: true
        secondName blank: true, nullable: true
        dob blank: true, nullable: true
    }

    static mapping = {
        password column: '`password`'
        dob type: PersistentLocalDate
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

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
}
