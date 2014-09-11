package caoknowsv3



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ItemLocationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ItemLocation.list(params), model: [itemLocationInstanceCount: ItemLocation.count()]
    }

    def show(ItemLocation itemLocationInstance) {
        respond itemLocationInstance
    }

    def create() {
        respond new ItemLocation(params)
    }

    @Transactional
    def save(ItemLocation itemLocationInstance) {
        if (itemLocationInstance == null) {
            notFound()
            return
        }

        if (itemLocationInstance.hasErrors()) {
            respond itemLocationInstance.errors, view: 'create'
            return
        }

        itemLocationInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'itemLocationInstance.label', default: 'ItemLocation'), itemLocationInstance.id])
                redirect itemLocationInstance
            }
            '*' { respond itemLocationInstance, [status: CREATED] }
        }
    }

    def edit(ItemLocation itemLocationInstance) {
        respond itemLocationInstance
    }

    @Transactional
    def update(ItemLocation itemLocationInstance) {
        if (itemLocationInstance == null) {
            notFound()
            return
        }

        if (itemLocationInstance.hasErrors()) {
            respond itemLocationInstance.errors, view: 'edit'
            return
        }

        itemLocationInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ItemLocation.label', default: 'ItemLocation'), itemLocationInstance.id])
                redirect itemLocationInstance
            }
            '*' { respond itemLocationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ItemLocation itemLocationInstance) {

        if (itemLocationInstance == null) {
            notFound()
            return
        }

        itemLocationInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ItemLocation.label', default: 'ItemLocation'), itemLocationInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemLocationInstance.label', default: 'ItemLocation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
