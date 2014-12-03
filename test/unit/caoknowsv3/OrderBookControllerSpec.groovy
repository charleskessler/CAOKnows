package caoknowsv3



import grails.test.mixin.*
import spock.lang.*

@TestFor(OrderBookController)
@Mock(OrderBook)
class OrderBookControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'

        params["bookNumber"] = '1'
        params["description"] = 'someDescription'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.orderBookInstanceList
        model.orderBookInstanceCount == 0
    }

    void "10.3-1 -- Test the create action returns the correct model"() {
        when: "The create action is executed"
            controller.create()

        then: "The model is correctly created"
            model.orderBookInstance != null
    }

    void "10.4-1 -- Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        def orderBook = new OrderBook()
        orderBook.validate()
        controller.save(orderBook)

        then: "The create view is rendered again with the correct model"
        model.orderBookInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        orderBook = new OrderBook(params)

        controller.save(orderBook)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/orderBook/show/1'
        controller.flash.message != null
        OrderBook.count() == 1
    }

    void "12.0-2 -- Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def orderBook = new OrderBook(params)
        controller.show(orderBook)

        then: "A model is populated containing the domain instance"
        model.orderBookInstance == orderBook
    }

    void "11.0-2 -- Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def orderBook = new OrderBook(params)
        controller.edit(orderBook)

        then: "A model is populated containing the domain instance"
        model.orderBookInstance == orderBook
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/orderBook/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def orderBook = new OrderBook()
        orderBook.validate()
        controller.update(orderBook)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.orderBookInstance == orderBook

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        orderBook = new OrderBook(params).save(flush: true)
        controller.update(orderBook)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/orderBook/show/$orderBook.id"
        flash.message != null
    }

    void "12.5.1-1 -- Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/orderBook/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def orderBook = new OrderBook(params).save(flush: true)

        then: "It exists"
        OrderBook.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(orderBook)

        then: "The instance is deleted"
        OrderBook.count() == 0
        response.redirectedUrl == '/orderBook/index'
        flash.message != null
    }
}
