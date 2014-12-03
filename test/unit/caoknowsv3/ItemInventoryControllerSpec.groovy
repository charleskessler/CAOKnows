package caoknowsv3



import grails.test.mixin.*
import spock.lang.*

@TestFor(ItemInventoryController)
@Mock(ItemInventory)
class ItemInventoryControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.itemInventoryInstanceList
        model.itemInventoryInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.itemInventoryInstance != null
    }

    void "21.4-1 -- Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        def itemInventory = new ItemInventory()
        itemInventory.validate()
        controller.save(itemInventory)

        then: "The create view is rendered again with the correct model"
        model.itemInventoryInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        itemInventory = new ItemInventory(params)

        controller.save(itemInventory)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/itemInventory/show/1'
        controller.flash.message != null
        ItemInventory.count() == 1
    }

    void "22.0-2 -- Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def itemInventory = new ItemInventory(params)
        controller.show(itemInventory)

        then: "A model is populated containing the domain instance"
        model.itemInventoryInstance == itemInventory
    }

    void "21.0-2 -- Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def itemInventory = new ItemInventory(params)
        controller.edit(itemInventory)

        then: "A model is populated containing the domain instance"
        model.itemInventoryInstance == itemInventory
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/itemInventory/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def itemInventory = new ItemInventory()
        itemInventory.validate()
        controller.update(itemInventory)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.itemInventoryInstance == itemInventory

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        itemInventory = new ItemInventory(params).save(flush: true)
        controller.update(itemInventory)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/itemInventory/show/$itemInventory.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/itemInventory/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def itemInventory = new ItemInventory(params).save(flush: true)

        then: "It exists"
        ItemInventory.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(itemInventory)

        then: "The instance is deleted"
        ItemInventory.count() == 0
        response.redirectedUrl == '/itemInventory/index'
        flash.message != null
    }
}
