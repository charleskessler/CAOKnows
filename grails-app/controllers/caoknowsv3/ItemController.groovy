package caoknowsv3

import grails.gorm.PagedResultList

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def list
        def count

        if(params.bookNum) {
            def book = OrderBook.findByBookNumber(params.bookNum)
            list = Item.findAllByOrderBook(book, params)
            count = Item.countByOrderBook(book)
        }
        else {
            list = Item.list(params)
            count = Item.count()
        }

        [itemInstanceList:list, itemInstanceCount:count, bookNum:params.bookNum]
        //respond Item.list(max:10, fetch:[bookNumber]), model:[itemInstanceCount: Item.countByOrderBook(book)]
    }

    def show(Item itemInstance) {
        respond itemInstance
    }

    def create() {
        println("NEW ITEM CREATED: " + params)
        respond new Item(params)
    }

    @Transactional
    def save(Item itemInstance) {
        if (itemInstance == null) {
            notFound()
            return
        }

        if (itemInstance.hasErrors()) {
            respond itemInstance.errors, view:'create'
            return
        }

        // check if these fields were filled in on creation, if not create new ones
        if(itemInstance.location == null) {
            itemInstance.location = new ItemLocation(item:itemInstance,
                    aisle:0, side:"", segment:0, shelf:0, position:0)
        }
        if(itemInstance.inventory == null) {
            itemInstance.inventory = new ItemInventory(item:itemInstance,
                    shelf:0, backroom:0, mezzanine:0, minimumLevel:0)
        }
        if(itemInstance.capacity == null) {
            itemInstance.capacity = new ItemCapacity(item:itemInstance,
                    facings:0, depth:0, height:1, secondary:0)
        }
        if(itemInstance.orderHistory == null) {
            itemInstance.orderHistory = new OrderHistory(pendingDeliveryQuantity: 0,
                    pendingDeliveryDate: new Date(),
                    lastOrderQuantity: 0,
                    lastOrderReceived: 0,
                    lastReceivedQuantity: 0,
                    lastReceivedDate: new Date(),
                    item: itemInstance)
        }
        if (itemInstance.createdBy == null) {
            itemInstance.createdBy = session.user
        }

        itemInstance.lastUpdatedBy = session.user



        itemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'itemInstance.label', default: 'Item'), itemInstance.id])
                redirect itemInstance
            }
            '*' { respond itemInstance, [status: CREATED] }
        }
    }

    def edit(Item itemInstance) {
        respond itemInstance
    }

    @Transactional
    def update(Item itemInstance) {
        if (itemInstance == null) {
            notFound()
            return
        }

        if (itemInstance.hasErrors()) {
            respond itemInstance.errors, view:'edit'
            return
        }

        itemInstance.lastUpdatedBy = session.user
        itemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Item.label', default: 'Item'), itemInstance.id])
                redirect itemInstance
            }
            '*'{ respond itemInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Item itemInstance) {

        if (itemInstance == null) {
            notFound()
            return
        }

        itemInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Item.label', default: 'Item'), itemInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemInstance.label', default: 'Item'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def search = {
        if(params.query) {
            def items = Item.search(params.query).results
            [items:items]
            /*
            println(items.size())
            if(items.size() == 1) { //only 1 item returned, go right to it
                def item = items[0]
                def id = ((Item)item).id
                redirect(controller:"item", action:"show", id:id)
            }
            else {
                [items:items]
            }*/
        }
    }
}
