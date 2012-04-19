import timebank.Role
import timebank.User
import timebank.UserRole

class BootStrap {

    def springSecurityService
    OpenIdController openIdController = new OpenIdController()

    def init = { servletContext -> // encode the password only if you're using an older version of the // spring-security-core plugin and you don't have encoding logic in // your "User" domain class: // String password = springSecurityService.encodePassword('password') String password = 'password'

        def roleAdmin = new Role(authority: 'ROLE_ADMIN').save()
        def roleUser = new Role(authority: 'ROLE_USER').save()
        def roleFb = new Role(authority: 'ROLE_FACEBOOK').save()
        def roleDeveloper = new Role(authority: 'ROLE_DEVELOPMENT').save()

        try {
            openIdController.createNewAccount('barry', '', 'https://www.google.com/accounts/o8/id?id=AItOawmBRx2IM-VMyGpzz8IxvO23zBXGuvWxG-M')
            openIdController.createNewAccount('stravick', '', 'https://www.google.com/accounts/o8/id?id=AItOawmrOgRF7m7YcQacfvwX0PE3e2HVvBpOkD4')
            openIdController.createNewAccount('chris', '', 'https://www.google.com/accounts/o8/id?id=AItOawmYzLFFZshIPUuP2Y9bhln1jfV1HHL-ows')
            openIdController.createNewAccount('localbarry', '', 'https://www.google.com/accounts/o8/id?id=AItOawmQ9zbV5SweUFATl46-ixAP7wxIaj_c590')
        } catch (e) {
            println(e.cause)
            println('user probably already existed')
        }

        def thisuser = User.findByUsername("barry")
        UserRole.create thisuser, roleDeveloper
        UserRole.create thisuser, roleAdmin
        thisuser = User.findByUsername("localbarry")
        UserRole.create thisuser, roleDeveloper
        UserRole.create thisuser, roleAdmin
        thisuser = User.findByUsername("chris")
        UserRole.create thisuser, roleAdmin
        thisuser = User.findByUsername("stravick")
        UserRole.create thisuser, roleAdmin

    }

    def destroy = {
    }
}
