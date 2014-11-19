package caoknowsv3

class ItemInventory {

    Integer shelf
    Integer backroom
    Integer mezzanine
    Integer minimumLevel
    Date lastUpdated
    User lastUpdatedBy

    static belongsTo = [item:Item]

    String toString() {
        String inventory = (String) shelf + backroom + mezzanine

        if(item.capacity.secondary > 0) //we have secondary, add asterisk so clerks know when reviewing orders
            inventory += "*"

        return inventory
    }

    int onHandInventory() {
        return shelf + backroom + mezzanine;
    }

    static constraints = {
        item nullable:false
        shelf nullable:true
        backroom nullable:true
        mezzanine nullable:true
        minimumLevel nullable:true
        lastUpdatedBy nullable:true
    }

    static mapping = {
        shelf defaultValue:0
        backroom defaultValue:0
        mezzanine defaultValue:0
        autoTimestamp(true)
    }
}
