import timebank.Role
import timebank.User
import timebank.UserRole

class BootStrap {

    def springSecurityService

    def init = { servletContext -> // encode the password only if you're using an older version of the // spring-security-core plugin and you don't have encoding logic in // your "User" domain class: // String password = springSecurityService.encodePassword('password') String password = 'password'

        def roleAdmin = new Role(authority: 'ROLE_ADMIN').save()
        def roleUser = new Role(authority: 'ROLE_USER').save()
        def roleDeveloper = new Role(authority: 'ROLE_DEVELOPMENT').save()

        def user = new User(username: 'user', password: 'password', enabled: true).save()
        def admin = new User(username: 'admin', password: 'password', enabled: true).save()

        UserRole.create user, roleUser
        UserRole.create admin, roleUser
        UserRole.create admin, roleAdmin, true

        def me = User.findByUsername("barry")
//        me.exchangesProvided.add(new Exchange(startTime: new DateTime(new Date()), endTime: new DateTime(new Date()), provider: me, receiver: user ))

    }

    def destroy = {
    }
}
