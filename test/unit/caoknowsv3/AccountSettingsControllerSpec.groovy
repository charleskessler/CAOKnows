package caoknowsv3

import grails.test.mixin.*
import spock.lang.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(AccountSettingsController)
@Mock(User)
class AccountSettingsControllerSpec extends Specification {

    def setup() {
        params["userName"] = 'someUserName'
        params["password"] = 'somePassword'
        params["rights"] = 'Manager'
    }

    def cleanup() {
    }

    void "24.3-1 -- Password changes successfully"() {

        when: "user enters correct old password"
            User testUser = new User(params)
            session.user = testUser
            params.oldPassword = 'somePassword'
            params.newPassword = 'newPassword'
            controller.changePassword()
        then: "the password is changed"
            session.user.password == 'newPassword'
            controller.flash.message == 'Password Successfully Changed'
    }

    void "24.3-2 -- Password changes unsuccessfully"() {

        when: "user enters incorrect old password"
            User testUser = new User(params)
            session.user = testUser
            params.oldPassword = 'someWrongPassword'
            params.newPassword = 'newPassword'
            controller.changePassword()
        then: "the password is not changed"
            session.user.password != 'newPassword'
            controller.flash.message == 'Incorrect Password'
    }
}
