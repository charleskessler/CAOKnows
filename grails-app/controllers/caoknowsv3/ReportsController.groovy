package caoknowsv3

//Module 7.0 -- Reports
class ReportsController {

    def index() {
        render (view: "Reports")
    }

//Module 7.1 -- Items with no location
    def noLocation() {
        def list
        def count
        def itemList = []

        list = ItemLocation.findAllByAisle(0)
        count = ItemLocation.countByAisle(0)
        list.each() { itemList.add(it.getItem()) }
        params.type = "Items With No Location"

        respond itemList, model:[itemInstanceCount:count], view:"List"
    }

//Module 7.2 -- Backroom pull list
    def backroomPull() {

        def inventoryList = ItemInventory.findAllByShelfLessThanEqualsAndBackroomGreaterThan(0, 0, [max:10])
        def count = inventoryList.size()
        def itemList = []

        inventoryList.each() { itemList.add(it.getItem()) }
        params.type = "Backroom Pull"

        respond itemList, model:[itemInstanceCount:count], view:"List"
    }


//Module 7.3 -- Negative Inventory
    def negativeInventory() {

            def inventoryList = ItemInventory.findAllByShelfLessThanOrBackroomLessThanOrMezzanineLessThan(0, 0, 0)
            def count = inventoryList.size()
            def itemList = []

            inventoryList.each() { itemList.add(it.getItem()) }
            params.type = "Negative Inventory"

            respond itemList, model:[itemInstanceCount:count], view:"List", type:"Negative Inventory"
        }


//Module 7.4 -- Backroom Inventory
    def backroomInventory() {

        def inventoryList = ItemInventory.findAllByBackroomGreaterThan(0)
        def count = inventoryList.size()
        def itemList = []

        inventoryList.each() { itemList.add(it.getItem()) }
        params.type = "Backroom Inventory"

        respond itemList, model:[itemInstanceCount:count], view:"List"
    }


//Module 7.5 -- Discontinued items with shelf locations
    def discontinuedItems() {

        def itemList = Item.findAllByItemStatus("Discontinued")
        def discoList = []

        itemList.each() { item ->
                            if(item.getLocation().aisle != 0)
                                discoList.add(item) }
        def count = discoList.size()
        params.type = "Discontinued Items"

        respond discoList, model:[itemInstanceCount:count], view:"List"
    }
}
