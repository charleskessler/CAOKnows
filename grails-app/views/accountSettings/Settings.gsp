<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Account Settings</title>
</head>

<body>


<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
     </ul>
</div>
<br>
<div class="homeCell">
<h3>Change Password</h3>

    <g:form action="changePassword">

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <table>
            <tr class="prop">
                <td class="name">
                    <label for="oldPassword">Current Password:</label>
                </td>
                <td class="value">
                    <g:field type="password" name="oldPassword"></g:field>
                </td>
            </tr>
            <tr class="prop">
                <td class="name">
                    <label for="newPassword">New Password:</label>
                </td>
                <td class="value">
                    <g:field type="password" name="newPassword"></g:field>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <g:actionSubmit value="Change Password" action="changePassword"></g:actionSubmit>
                </td>
            </tr>
        </table>

    </g:form>

</div>
</body>
</html>
