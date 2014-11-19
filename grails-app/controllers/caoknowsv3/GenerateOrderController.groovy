package caoknowsv3

import grails.orm.PagedResultList

class GenerateOrderController {

    def index() {
        respond OrderBook.list(params), model: [orderBookInstanceCount: OrderBook.count()]
    }

    def generate(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def list = Item.findAllByOrderBook(OrderBook.findByBookNumber(params.bookNumber))
        def count

        def itemList = []
        list.each() {
            def onHand =  it.inventory.onHandInventory()
            def min = it.inventory.minimumLevel
            def order = it.orderHistory

            if (onHand <= min || onHand <= 0)
            {
                int orderQuantity = 0
                if(it.casePack != null && it.casePack > 0)
                    orderQuantity = (it.capacity.shelfCapacity() - onHand) / it.casePack
                else if(it.casePack == null || it.casePack <= 0)
                    orderQuantity = (it.capacity.shelfCapacity() - onHand)
                order.pendingDeliveryQuantity = orderQuantity
                order.pendingDeliveryDate = new Date() //today
                itemList.add(it)
            }
            else {
                order.pendingDeliveryQuantity = 0
            }
        }

        count = itemList.size()
        respond itemList, model:[itemInstanceCount:count], view:"OrderReview"
    }

    def updateOrder() {
        if(params.id) {
            def item = Item.findById(params.id)
            item.orderHistory.pendingDeliveryQuantity = (params.orderQty).toInteger()
            item.save()
        }
    }

    def completeOrder() {
        def list = Item.findAllByOrderBook(OrderBook.findByBookNumber(params.bookNumber))
        def count
        def itemList = []

        list.each() {
            def order = it.orderHistory

            if(order.pendingDeliveryQuantity > 0)
                itemList.add(it)
        }
        count = itemList.size()
        respond itemList.toList(), model:[itemInstanceCount:count], view:"OrderView"
    }
}
