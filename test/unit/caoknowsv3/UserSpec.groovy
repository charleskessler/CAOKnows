package caoknowsv3

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test toString"() {
        when: "a User has a user name"
            def testUser = new User(userName:'testUserName')

        then: "the toString method will return that user name."
            testUser.toString() == 'testUserName'
    }
}
