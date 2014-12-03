package caoknowsv3

class ItemCapacity {

    Integer facings
    Integer depth
    Integer height
    Integer secondary
    Date lastUpdated
    User lastUpdatedBy

    static belongsTo = [item:Item]

    String toString() {

        if(shelfCapacity() > 0)
            return shelfCapacity()
        else
            return "Set Capacity"
    }

    int shelfCapacity() {
        return facings * (depth * height) + secondary
    }


    static constraints = {
        item nullable:false
        facings nullable:true, min:0
        depth nullable:true, min:0
        height nullable:true, min:0
        secondary nullable:true, min:0
        lastUpdatedBy nullable:true
    }

    static mapping = {
        facings defaultValue:0
        depth defaultValue:0
        height defaultValue:0
        secondary defaultValue:0
        autoTimestamp(true)
    }
}
