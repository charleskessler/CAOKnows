<%@ page import="caoknowsv3.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="user.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" maxlength="12" required="" value="${userInstance?.userName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" maxlength="16" required="" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'rights', 'error')} ">
	<label for="rights">
		<g:message code="user.rights.label" default="Rights" />
		
	</label>
	<g:select name="rights" from="${userInstance.constraints.rights.inList}" value="${userInstance?.rights}" valueMessagePrefix="user.rights" noSelection="['': '']"/>

</div>

