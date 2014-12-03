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

    void "Unit Test 7.1-1 -- No Location Report Type"() {

        when: "The module is called"
            controller.noLocation()

        then: "it returns the correct report type"
            controller.params.type == "Items With No Location"
    }

    void "Unit Test 7.2-1 -- Backroom Pull Report Type"() {

        when: "The module is called"
            def response = controller.backroomPull()

        then: "it returns the correct report type"
            controller.params.type == "Backroom Pull"
    }

    void "Unit Test 7.3-1 -- Negative Inventory Report Type"() {

        when: "The module is called"
            def response = controller.negativeInventory()

        then: "it returns the correct report type"
            controller.params.type == "Negative Inventory"
    }

    void "Unit Test 7.4-1 -- Backroom Inventory Report Type"() {

        when: "The module is called"
        def response = controller.backroomInventory()

        then: "it returns the correct report type"
            controller.params.type == "Backroom Inventory"
    }

    void "Unit Test 7.5-1 -- Discontinued Items Report Type"() {

        when: "The module is called"
            def response = controller.discontinuedItems()

        then: "it returns the correct report type"
            controller.params.type == "Discontinued Items"
    }
}
