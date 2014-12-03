package caoknowsv3

import grails.orm.PagedResultList

class GenerateOrderController {

    def index() {
        respond OrderBook.list(params), model: [orderBookInstanceCount: OrderBook.count()]
    }


//Module 4.0 -- Generate Order
    def generateOrder(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def count
        def itemList = []
        def caseTotal = 0

        if (params.bookNumber) {
            def list = Item.findAllByOrderBook(OrderBook.findByBookNumber(params.bookNumber))

            if (list) {
                list.each() {

                    println(it.id)
                   // if(it.inventory && it.orderHistory) {
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
                            caseTotal += orderQuantity
                        }
                        else {
                            order.pendingDeliveryQuantity = 0
                        }
                 //   }
                }
            } else {
                flash.message = 'Invalid book number'
                return
            }
        }
        params.caseTotal = caseTotal
        count = itemList.size()
        respond itemList, model:[itemInstanceCount:count], view:"OrderReview"
    }

//Module 3.2.1 -- Update Order Quantity
    def updateOrderQuantity() {
        if(params.id) {
            def item = Item.findById(params.id)
            if(item) {
                item.orderHistory.pendingDeliveryQuantity = (params.orderQty).toInteger()
                item.save()
            } else { //no item found with that ID
                flash.message = "Item not found."
                return
            }
        }
    }
//Module 5.0 -- Complete Order
    def completeOrder() {
        def list = Item.findAllByOrderBook(OrderBook.findByBookNumber(params.bookNumber))
        def count
        def itemList = []
        def finalCount = 0

        list.each() {
            def order = it.orderHistory

            if(order.pendingDeliveryQuantity > 0) {
                itemList.add(it)
                finalCount += order.pendingDeliveryQuantity
            }
        }

        params.finalCount = finalCount
        params.itemCount = itemList.size()
        count = itemList.size()
        respond itemList.toList(), model:[itemInstanceCount:count], view:"OrderView"
    }
}
