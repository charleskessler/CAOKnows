package caoknowsv3

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(GenerateOrderController)
@Mock([OrderBook, Item, ItemCapacity,ItemInventory, ItemLocation,OrderHistory,User])
class GenerateOrderControllerSpec extends Specification {

    def setup() {

    }

    def cleanup() {
    }

    void "Unit Test 4.0-1 -- No Book Number Parameter"() {
        when: "the generate order action is executed with no book number parameter"
            def returnedParams = controller.generate()

        then: "the generate order action returns an empty list"
            returnedParams == null
    }
}
