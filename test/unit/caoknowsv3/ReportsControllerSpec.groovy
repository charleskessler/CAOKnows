package caoknowsv3

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ReportsController)
@Mock([OrderBook, Item, ItemCapacity,ItemInventory, ItemLocation, OrderHistory, User])
class ReportsControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Unit Test 7.1-1"() {

        when: "The module is called"
            controller.noLocation()

        then: "it returns a list to the reports view"
            controller == 'list'

    }

    void "Unit Test 7.2-1"() {

        when: "The module is called"
            controller.backroomPull()

        then: "it returns a list to the reports view"
        response.redirectedUrl == '/reports/list'
    }

    void "Unit Test 7.3-1"() {

        when: "The module is called"
            controller.negativeInventory()

        then: "it returns a list to the reports view"
            response.redirectedUrl == '/reports/list'
    }

    void "Unit Test 7.4-1"() {

        when: "The module is called"
            controller.backroomInventory()

        then: "it returns a list to the reports view"
            response.redirectedUrl == '/reports/list'
    }

    void "Unit Test 7.5-1"() {

        when: "The module is called"
            controller.discontinuedItems()

        then: "it returns a list to the reports view"
            response.redirectedUrl == '/reports/list'
    }
}
