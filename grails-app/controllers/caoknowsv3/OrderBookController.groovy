package caoknowsv3



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OrderBookController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OrderBook.list(params), model: [orderBookInstanceCount: OrderBook.count()]
    }

    def show(OrderBook orderBookInstance) {
        respond orderBookInstance
    }

    def create() {
        respond new OrderBook(params)
    }

    @Transactional
    def save(OrderBook orderBookInstance) {
        if (orderBookInstance == null) {
            notFound()
            return
        }

        if (orderBookInstance.hasErrors()) {
            respond orderBookInstance.errors, view: 'create'
            return
        }

        orderBookInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'orderBookInstance.label', default: 'OrderBook'), orderBookInstance.id])
                redirect orderBookInstance
            }
            '*' { respond orderBookInstance, [status: CREATED] }
        }
    }

    def edit(OrderBook orderBookInstance) {
        respond orderBookInstance
    }

    @Transactional
    def update(OrderBook orderBookInstance) {
        if (orderBookInstance == null) {
            notFound()
            return
        }

        if (orderBookInstance.hasErrors()) {
            respond orderBookInstance.errors, view: 'edit'
            return
        }

        orderBookInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OrderBook.label', default: 'OrderBook'), orderBookInstance.id])
                redirect orderBookInstance
            }
            '*' { respond orderBookInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OrderBook orderBookInstance) {

        if (orderBookInstance == null) {
            notFound()
            return
        }

        orderBookInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OrderBook.label', default: 'OrderBook'), orderBookInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'orderBookInstance.label', default: 'OrderBook'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
