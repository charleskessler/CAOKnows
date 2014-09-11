package caoknowsv3



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OrderHistoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OrderHistory.list(params), model: [orderHistoryInstanceCount: OrderHistory.count()]
    }

    def show(OrderHistory orderHistoryInstance) {
        respond orderHistoryInstance
    }

    def create() {
        respond new OrderHistory(params)
    }

    @Transactional
    def save(OrderHistory orderHistoryInstance) {
        if (orderHistoryInstance == null) {
            notFound()
            return
        }

        if (orderHistoryInstance.hasErrors()) {
            respond orderHistoryInstance.errors, view: 'create'
            return
        }

        orderHistoryInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'orderHistoryInstance.label', default: 'OrderHistory'), orderHistoryInstance.id])
                redirect orderHistoryInstance
            }
            '*' { respond orderHistoryInstance, [status: CREATED] }
        }
    }

    def edit(OrderHistory orderHistoryInstance) {
        respond orderHistoryInstance
    }

    @Transactional
    def update(OrderHistory orderHistoryInstance) {
        if (orderHistoryInstance == null) {
            notFound()
            return
        }

        if (orderHistoryInstance.hasErrors()) {
            respond orderHistoryInstance.errors, view: 'edit'
            return
        }

        orderHistoryInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OrderHistory.label', default: 'OrderHistory'), orderHistoryInstance.id])
                redirect orderHistoryInstance
            }
            '*' { respond orderHistoryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OrderHistory orderHistoryInstance) {

        if (orderHistoryInstance == null) {
            notFound()
            return
        }

        orderHistoryInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OrderHistory.label', default: 'OrderHistory'), orderHistoryInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'orderHistoryInstance.label', default: 'OrderHistory'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
