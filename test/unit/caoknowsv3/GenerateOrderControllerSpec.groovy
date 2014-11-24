package caoknowsv3

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(GenerateOrderController)
@Mock([OrderBook, Item, ItemCapacity,ItemInventory, ItemLocation, OrderHistory, User])
class GenerateOrderControllerSpec extends Specification {

    def setup() {

    }

    def cleanup() {
    }

    void "Unit Test 3.2.1-1 -- Invalid Item ID"() {

        when: "Item ID parameter is invalid"
            params.id = '-1'
            controller.updateOrderQuantity()
        then: "an Item Not Found error will display"
            controller.flash.message == 'Item not found.'
    }

    void "Unit Test 4.0-1 -- No Book Number Parameter"() {
        when: "the generateOrder order action is executed with no book number parameter"
            def returnedParams = controller.generateOrder()

        then: "the generateOrder order action returns an empty list"
            returnedParams == null
    }


}
