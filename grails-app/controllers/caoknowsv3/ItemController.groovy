package caoknowsv3



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Item.list(params), model:[itemInstanceCount: Item.count()]
    }

    def show(Item itemInstance) {
        respond itemInstance
    }

    def create() {
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
                    shelf:0, backroom:0, mezzanine:0)
        }
        if(itemInstance.capacity == null) {
            itemInstance.capacity = new ItemCapacity(item:itemInstance,
                    facings:0, depth:0, height:0, secondary:0)
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
}
