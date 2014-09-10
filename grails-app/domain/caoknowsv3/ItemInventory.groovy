package caoknowsv3

class ItemInventory {

    Integer shelf
    Integer backroom
    Integer mezzanine
    Date lastUpdated
    User lastUpdatedBy

    static belongsTo = [item:Item]

    String toString() {
        "${shelf + backroom + mezzanine}"
    }

    static constraints = {
        item nullable:false
        shelf nullable:true
        backroom nullable:true
        mezzanine nullable:true
        lastUpdatedBy nullable:true
    }

    static mapping = {
        shelf defaultValue:0
        backroom defaultValue:0
        mezzanine defaultValue:0
        autoTimestamp(true)
    }
}
