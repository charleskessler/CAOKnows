package caoknowsv3

class OrderBook {

    Integer bookNumber
    String description
    Date dateCreated
    Date lastUpdated
    User createdBy
    User lastUpdatedBy

    static hasMany = [items:Item]

    String toString () {
        "$bookNumber -- $description"
    }
    static constraints = {
        bookNumber nullable:false, min:0, unique:true
        description nullable:false, blank:false, unique:true
        dateCreated nullable:true
        lastUpdated nullable:true
        createdBy nullable:true
        lastUpdatedBy nullable:true
    }

    static mapping = {
        autoTimestamp(true)
    }
}
