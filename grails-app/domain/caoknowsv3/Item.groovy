package caoknowsv3

class Item {

    String itemCode
    String itemUPC
    String description
    Integer casePack //# of this item in a case
    Double unitSize
    String unitType //Ounces, Fluid Ounces, Pack, Other
    String itemStatus //Active, Pending Discontinued, Discontinued
    Date dateCreated
    Date lastUpdated
    User createdBy
    User lastUpdatedBy

    static searchable = true

    static belongsTo = [orderBook:OrderBook]
    static hasOne = [location:ItemLocation, inventory:ItemInventory, capacity:ItemCapacity, orderHistory:OrderHistory]

    String toString() {
        if(unitSize == null || unitType == null)
            return "$itemCode -- $description"
        else
            return "$itemCode -- $description ($unitSize $unitType)"
    }

    static constraints = {
        itemCode nullable:false, blank:false, unique:true, maxSize:12
        itemUPC nullable:false, blank:false, unique:true, maxSize:12
        description nullable:false, blank:false, unique:false, maxSize:36
        casePack nullable:true, min:1
        unitSize nullable:true
        unitType inList:["Ounces", "Fluid Ounces", "Pack", "Other"], nullable:true, blank:true
        itemStatus inList:["Active", "Pending Discontinue", "Discontinued"], nullable:true
        location nullable:true
        inventory nullable:true
        capacity nullable:true
        dateCreated nullable:true
        lastUpdated nullable:true
        orderHistory nullable:true
        orderBook nullable:false
        createdBy nullable:true
        lastUpdatedBy nullable:true
    }

    static mapping = {
        autoTimestamp(true)
    }
}
