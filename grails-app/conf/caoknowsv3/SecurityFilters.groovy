package caoknowsv3

class SecurityFilters {

    def filters = {
        doLogin(controller:'*', action:'*') {
            before = {
                if (!controllerName)
                    return true

                def allowedActions = ['login', 'validate']

                if(!session.user && !allowedActions.contains(actionName)) {
                    redirect(controller:'User', action:'login', params:['cName': controllerName, 'aName':actionName])
                    return false
                }
            }
        }
    }
}
