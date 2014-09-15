<%@ page import="caoknowsv3.OrderBook" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'orderBook.label', default: 'OrderBook')}" />
    <title>Edit Book ${orderBookInstance.bookNumber} -- ${orderBookInstance.description}</title>
</head>
<body>
<a href="#edit-orderBook" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index">All Order Books</g:link></li>
    </ul>
</div>
<div id="edit-orderBook" class="content scaffold-edit" role="main">
    <h1>Edit Book ${orderBookInstance.bookNumber} -- ${orderBookInstance.description}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${orderBookInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${orderBookInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource:orderBookInstance, action:'update']" method="PUT" >
        <g:hiddenField name="version" value="${orderBookInstance?.version}" />
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
