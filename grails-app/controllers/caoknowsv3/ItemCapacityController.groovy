package caoknowsv3



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ItemCapacityController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ItemCapacity.list(params), model: [itemCapacityInstanceCount: ItemCapacity.count()]
    }

    def show(ItemCapacity itemCapacityInstance) {
        respond itemCapacityInstance
    }

    def create() {
        respond new ItemCapacity(params)
    }

    @Transactional
    def save(ItemCapacity itemCapacityInstance) {
        if (itemCapacityInstance == null) {
            notFound()
            return
        }

        if (itemCapacityInstance.hasErrors()) {
            respond itemCapacityInstance.errors, view: 'create'
            return
        }

        itemCapacityInstance.lastUpdatedBy = session.user
        itemCapacityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'itemCapacityInstance.label', default: 'Item Capacity'), itemCapacityInstance.id])
                redirect itemCapacityInstance
            }
            '*' { respond itemCapacityInstance, [status: CREATED] }
        }
    }

    def edit(ItemCapacity itemCapacityInstance) {
        respond itemCapacityInstance
    }

    @Transactional
    def update(ItemCapacity itemCapacityInstance) {
        if (itemCapacityInstance == null) {
            notFound()
            return
        }

        if (itemCapacityInstance.hasErrors()) {
            respond itemCapacityInstance.errors, view: 'edit'
            return
        }

        itemCapacityInstance.lastUpdatedBy = session.user
        itemCapacityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ItemCapacity.label', default: 'Item Capacity'), itemCapacityInstance.id])
                redirect itemCapacityInstance
            }
            '*' { respond itemCapacityInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ItemCapacity itemCapacityInstance) {

        if (itemCapacityInstance == null) {
            notFound()
            return
        }

        itemCapacityInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ItemCapacity.label', default: 'Item Capacity'), itemCapacityInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemCapacityInstance.label', default: 'ItemCapacity'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
