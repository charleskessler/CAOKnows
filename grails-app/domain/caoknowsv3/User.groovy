package caoknowsv3

class User {

    String userName
    String password
    String rights

     String toString() {
         return userName
     }

    static constraints = {
        userName nullable:false, blank:false, unique:true, maxSize:12
        password nullable:false, blank:false, unique:false, maxSize:16
        rights nullable:false, inList:["Manager", "Clerk"]
    }
}
