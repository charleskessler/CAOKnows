package caoknowsv3

class AccountSettingsController {

    def index() {
        render (view:"Settings")
    }

    def changePassword() {

        def user = session.user
        println("curr=" + user.password)
        println("old=" + params.oldPassword)
        if(params.oldPassword == user.password) {
            user.password = params.newPassword

            flash.message = "Password Successfully Changed"
            render view:'Settings'
            return
        } else {
            flash.message = "Incorrect Password"
            render view:'Settings'
            return
        }

    }
}
