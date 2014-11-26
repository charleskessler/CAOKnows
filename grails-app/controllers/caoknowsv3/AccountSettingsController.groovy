package caoknowsv3

class AccountSettingsController {

    def index() {
        render (view:"Settings")
    }

    def changePassword() {

        def user = session.user

        if(params.oldPassword == user.password) {
            user.password = params.newPassword

            flash.message = "Password Successfully Changed"
            redirect controller:'Dashboard', view:'index'
            return
        } else {
            flash.message = "Incorrect Password"
            render view:'Settings'
            return
        }

    }
}
