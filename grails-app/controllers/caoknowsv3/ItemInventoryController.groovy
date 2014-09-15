package caoknowsv3



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ItemInventoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ItemInventory.list(params), model: [itemInventoryInstanceCount: ItemInventory.count()]
    }

    def show(ItemInventory itemInventoryInstance) {
        respond itemInventoryInstance
    }

    def create() {
        respond new ItemInventory(params)
    }

    @Transactional
    def save(ItemInventory itemInventoryInstance) {
        if (itemInventoryInstance == null) {
            notFound()
            return
        }

        if (itemInventoryInstance.hasErrors()) {
            respond itemInventoryInstance.errors, view: 'create'
            return
        }

        itemInventoryInstance.lastUpdatedBy = session.user
        itemInventoryInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'itemInventoryInstance.label', default: 'Item Inventory'), itemInventoryInstance.id])
                redirect itemInventoryInstance
            }
            '*' { respond itemInventoryInstance, [status: CREATED] }
        }
    }

    def edit(ItemInventory itemInventoryInstance) {
        respond itemInventoryInstance
    }

    @Transactional
    def update(ItemInventory itemInventoryInstance) {
        if (itemInventoryInstance == null) {
            notFound()
            return
        }

        if (itemInventoryInstance.hasErrors()) {
            respond itemInventoryInstance.errors, view: 'edit'
            return
        }
        itemInventoryInstance.lastUpdatedBy = session.user
        itemInventoryInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ItemInventory.label', default: 'Item Inventory'), itemInventoryInstance.id])
                redirect itemInventoryInstance
            }
            '*' { respond itemInventoryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ItemInventory itemInventoryInstance) {

        if (itemInventoryInstance == null) {
            notFound()
            return
        }

        itemInventoryInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ItemInventory.label', default: 'Item Inventory'), itemInventoryInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemInventoryInstance.label', default: 'Item Inventory'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
