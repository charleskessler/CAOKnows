package caoknowsv3

class OrderHistory {

    Integer pendingDeliveryQuantity
    Date pendingDeliveryDate

    Integer lastOrderQuantity
    Integer lastOrderReceived

    Integer lastReceivedQuantity
    Date lastReceivedDate

    static belongsTo = [item:Item]

    static constraints = {
        pendingDeliveryQuantity min:0, nullable:false
        lastOrderQuantity min:0, nullable:false
        lastOrderQuantity min:0, nullable:false
        lastReceivedQuantity min:0, nullable:false
        item unique:true
    }
}
