import caoknowsv3.User

class BootStrap {

    def init = { servletContext ->
        def testUser = new User(userName:"test", password:"test", rights:"Manager")
        testUser.save()
    }
    def destroy = {
    }
}
