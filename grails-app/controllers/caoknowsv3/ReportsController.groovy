package caoknowsv3

class ReportsController {

    def index() {
        render (view: "Reports")
    }

    def noLocation() {
        def list
        def count

        def noLocationInstance = new ItemLocation(item:null, aisle:0, side:"", segment:0, shelf:0, position:0)

        list = ItemLocation.findAllByAisle(0)
        println(ItemLocation.list(params))
        count = ItemLocation.countByAisle(0)
        println(count)
       //render(view:"List", [itemInstanceLast:list, itemInstanceCount:count])
        def itemList = []
        list.each() { itemList.add(it.getItem()) }
        println("0-----0")
        println(itemList)
        params.type = "Items With No Location"
        respond itemList, model:[itemInstanceCount:count], view:"List"
    }

    def backroomPull() {

        def inventoryList = ItemInventory.findAllByShelfLessThanEqualsAndBackroomGreaterThan(0, 0, [max:10])
        def count = inventoryList.size()

        println(inventoryList)
        println(count)

        def itemList = []
        inventoryList.each() { itemList.add(it.getItem()) }
        println("0-----0")
        println(itemList)
        params.type = "Backroom Pull"
        respond itemList, model:[itemInstanceCount:count], view:"List"
    }

    def negativeInventory() {

            def inventoryList = ItemInventory.findAllByShelfLessThanOrBackroomLessThanOrMezzanineLessThan(0, 0, 0)
            def count = inventoryList.size()

            println(inventoryList)
            println(count)

            def itemList = []
            inventoryList.each() { itemList.add(it.getItem()) }
            println("0-----0")
            println(itemList)

            //respond [itemList:itemList, itemInstanceCount:count, type:"Negative Inventory", view:"List"]
        //[itemInstanceList:list, itemInstanceCount:count, bookNum:params.bookNum]
            params.type = "Negative Inventory"
            respond itemList, model:[itemInstanceCount:count], view:"List", type:"Negative Inventory"
        }

    def backroomInventory() {

        def inventoryList = ItemInventory.findAllByBackroomGreaterThan(0)
        def count = inventoryList.size()

        def itemList = []
        inventoryList.each() { itemList.add(it.getItem()) }
        params.type = "Backroom Inventory"
        respond itemList, model:[itemInstanceCount:count], view:"List"
    }

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
