
<%@ page import="caoknowsv3.OrderBook" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'orderBook.label', default: 'Order Book')}" />
    <title>Book ${orderBookInstance?.bookNumber} -- ${orderBookInstance?.description}</title>
</head>
<body>
<a href="#show-orderBook" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index">All Order Books</g:link></li>
        <g:isManager>
            <li><g:link class="create" controller="item" action="create" params='["bookNum":"${orderBookInstance?.bookNumber}"]'>New Item</g:link></li>
        </g:isManager>
    </ul>
</div>
<div id="show-orderBook" class="content scaffold-show" role="main">
    <h1>Details for Book ${orderBookInstance?.bookNumber} -- ${orderBookInstance?.description}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list orderBook">

        <g:if test="${orderBookInstance?.bookNumber}">
            <li class="fieldcontain">
                <span id="bookNumber-label" class="property-label"><g:message code="orderBook.bookNumber.label" default="Book Number" /></span>

                <span class="property-value" aria-labelledby="bookNumber-label"><g:fieldValue bean="${orderBookInstance}" field="bookNumber"/></span>

            </li>
        </g:if>

        <g:if test="${orderBookInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="orderBook.description.label" default="Description" /></span>

                <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${orderBookInstance}" field="description"/></span>

            </li>
        </g:if>

        <li class="fieldcontain">
            <span id="items-label" class="property-label"><g:message code="orderBook.items.label" default="Items" /></span>
            <span class="property-value" aria-labelledby="items-label"><g:link controller="item" action="index" params='["bookNum":"${orderBookInstance?.bookNumber}"]'>All Items</g:link></span>
        </li>

        </ol>

        <h1>Edit History</h1>
        <ol class="property-list item">
        <g:if test="${orderBookInstance?.createdBy}">
            <li class="fieldcontain">
                <span id="createdBy-label" class="property-label"><g:message code="orderBook.createdBy.label" default="Created By" /></span>

                <span class="property-value" aria-labelledby="dateCreated-label">${orderBookInstance?.createdBy}</span>

            </li>
        </g:if>

        <g:if test="${orderBookInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="orderBook.dateCreated.label" default="Date Created" /></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${orderBookInstance?.dateCreated}" /></span>

            </li>
        </g:if>

        <g:if test="${orderBookInstance?.lastUpdatedBy}">
            <li class="fieldcontain">
                <span id="lastUpdatedBy-label" class="property-label"><g:message code="orderBook.lastUpdatedBy.label" default="Last Updated By" /></span>

                <span class="property-value" aria-labelledby="dateCreated-label">${orderBookInstance?.lastUpdatedBy}</span>

            </li>
        </g:if>

        <g:if test="${orderBookInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="orderBook.lastUpdated.label" default="Last Updated" /></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${orderBookInstance?.lastUpdated}" /></span>

            </li>
        </g:if>
    </ol>
    <g:isManager>
        <g:form url="[resource:orderBookInstance, action:'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${orderBookInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </g:isManager>
</div>
</body>
</html>