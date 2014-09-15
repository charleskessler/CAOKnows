package caoknowsv3

class ItemLocation {

    Integer aisle
    String side
    Integer segment
    Integer shelf
    Integer position
    Date lastUpdated
    User lastUpdatedBy

    static belongsTo = [item:Item]

    String toString() {
        "Aisle $aisle"
    }

    static constraints = {
        item nullable:false
        aisle nullable:true
        side nullable:true, inList:["A (Produce side)", "B"], blank:true
        segment nullable:true
        shelf nullable:true
        position nullable:true
        lastUpdatedBy nullable:true
    }

    static mapping = {
        aisle defaultValue:0
        side defaultValue:""
        segment defaultValue:0
        shelf defaultValue:0
        position defaultValue:0
        autoTimestamp(true)
    }
}
