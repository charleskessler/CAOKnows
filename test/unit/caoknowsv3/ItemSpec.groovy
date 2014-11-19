package caoknowsv3

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Item)
class ItemSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test toString"() {
        when: "an Item has an item code, description, and a defined unit size and type"
            def testItem = new Item(itemCode:'1234567', description:'Test Item', unitSize:12.0, unitType:'Ounces')

        then: "the toString method will display them."
            testItem.toString() == '1234567 -- Test Item (12.0 Ounces)'

        when: "an Item has an item code, and description, but no unit size and type"
            def testItemNoUnit = new Item(itemCode:'1234567', description:'Test Item')

        then: "the toString method will display only item code and description"
            testItemNoUnit.toString() == '1234567 -- Test Item'
    }
}
