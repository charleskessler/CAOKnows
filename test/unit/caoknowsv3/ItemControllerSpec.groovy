package caoknowsv3



import grails.test.mixin.*
import spock.lang.*

@TestFor(ItemController)
@Mock([Item, OrderBook, OrderHistory, ItemLocation, ItemCapacity, ItemInventory, OrderHistory, User])
class ItemControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        params["itemCode"] = '1234567'
        params["itemUPC"] = '123456789'
        params["description"] = 'Test Item'
        params["casePack"] = '12'
        params["unitSize"] = '16.0'
        params["unitType"] = 'Ounces'
        params["itemStatus"] = 'Active'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.itemInstanceList
        model.itemInstanceCount == 0
    }

    void "13.9-1 -- Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.itemInstance != null
    }

    void "13.10-1 -- Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        def item = new Item()
        item.validate()
        controller.save(item)

        then: "The create view is rendered again with the correct model"
        model.itemInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        item = new Item(params)

        controller.save(item)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/item/show/1'
        controller.flash.message != null
        Item.count() == 1
    }

    void "23.2-1 -- Item search returns one result"() {

        when: "the item search action is executed, and one result is found"
            def item = new Item(params)
            controller.save(item)

            params.query = '1234567'
            controller.search()

        then: "the controller redirects to that item"
            response.redirectedUrl == '/item/show/1'
            Item.count() == 1
    }

    void "15.0-2 -- Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def item = new Item(params)
        controller.show(item)

        then: "A model is populated containing the domain instance"
        model.itemInstance == item
    }

    void "14.0-2 -- Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def item = new Item(params)
        controller.edit(item)

        then: "A model is populated containing the domain instance"
        model.itemInstance == item
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/item/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def item = new Item()
        item.validate()
        controller.update(item)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.itemInstance == item

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        item = new Item(params).save(flush: true)
        controller.update(item)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/item/show/$item.id"
        flash.message != null
    }

    void "15.3.1-1 -- Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/item/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def item = new Item(params).save(flush: true)

        then: "It exists"
        Item.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(item)

        then: "The instance is deleted"
        Item.count() == 0
        response.redirectedUrl == '/item/index'
        flash.message != null
    }
}
