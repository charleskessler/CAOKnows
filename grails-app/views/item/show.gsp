
<%@ page import="caoknowsv3.Item" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'item.label', default: 'Detailed Item View')}" />
    <title>Detailed Item View</title>
</head>
<body>
<a href="#show-item" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index" params='["bookNum":"${itemInstance.orderBook.bookNumber}"]'>Item List</g:link></li>
    </ul>
</div>
<div id="show-item" class="content scaffold-show" role="main">
    <h1>Detailed Item View -- ${itemInstance?.description}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list item">

        <g:if test="${itemInstance?.itemCode}">
            <li class="fieldcontain">
                <span id="itemCode-label" class="property-label"><g:message code="item.itemCode.label" default="Item Code" /></span>

                <span class="property-value" aria-labelledby="itemCode-label"><g:fieldValue bean="${itemInstance}" field="itemCode"/></span>

            </li>
        </g:if>

        <g:if test="${itemInstance?.itemUPC}">
            <li class="fieldcontain">
                <span id="itemUPC-label" class="property-label"><g:message code="item.itemUPC.label" default="Item UPC" /></span>

                <span class="property-value" aria-labelledby="itemUPC-label"><g:fieldValue bean="${itemInstance}" field="itemUPC"/></span>

            </li>
        </g:if>

        <g:if test="${itemInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="item.description.label" default="Description" /></span>

                <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${itemInstance}" field="description"/></span>

            </li>
        </g:if>

        <g:if test="${itemInstance?.orderBook}">
            <li class="fieldcontain">
                <span id="orderBook-label" class="property-label"><g:message code="item.orderBook.label" default="Order Book" /></span>

                <span class="property-value" aria-labelledby="orderBook-label"><g:link controller="orderBook" action="show" id="${itemInstance?.orderBook?.id}">${itemInstance?.orderBook?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${itemInstance?.casePack}">
            <li class="fieldcontain">
                <span id="casePack-label" class="property-label"><g:message code="item.casePack.label" default="Case Pack" /></span>

                <span class="property-value" aria-labelledby="casePack-label"><g:fieldValue bean="${itemInstance}" field="casePack"/></span>

            </li>
        </g:if>

        <g:if test="${itemInstance?.unitSize}">
            <li class="fieldcontain">
                <span id="unitSize-label" class="property-label"><g:message code="item.unitSize.label" default="Unit Size" /></span>

                <span class="property-value" aria-labelledby="unitSize-label"><g:fieldValue bean="${itemInstance}" field="unitSize"/></span>

            </li>
        </g:if>

        <g:if test="${itemInstance?.unitType}">
            <li class="fieldcontain">
                <span id="unitType-label" class="property-label"><g:message code="item.unitType.label" default="Unit Type" /></span>

                <span class="property-value" aria-labelledby="unitType-label"><g:fieldValue bean="${itemInstance}" field="unitType"/></span>

            </li>
        </g:if>

        <g:if test="${itemInstance?.itemStatus}">
            <li class="fieldcontain">
                <span id="itemStatus-label" class="property-label"><g:message code="item.itemStatus.label" default="Item Status" /></span>

                <span class="property-value" aria-labelledby="itemStatus-label"><g:fieldValue bean="${itemInstance}" field="itemStatus"/></span>

            </li>
        </g:if>

        <g:if test="${itemInstance?.location}">
            <li class="fieldcontain">
                <span id="location-label" class="property-label"><g:message code="item.location.label" default="Location" /></span>

                <g:if test="${caoknowsv3.ItemLocation.findById(itemInstance.location.id).aisle == 0}">
                    <span class="property-value" aria-labelledby="location-label"><g:link controller="itemLocation" action="show" id="${itemInstance?.location?.id}">Set Location</g:link></span>
                </g:if>
                <g:else>
                    <span class="property-value" aria-labelledby="location-label"><g:link controller="itemLocation" action="show" id="${itemInstance?.location?.id}">${itemInstance?.location?.encodeAsHTML()}</g:link></span>
                </g:else>
            </li>
        </g:if>

        <g:if test="${itemInstance?.inventory}">
            <li class="fieldcontain">
                <span id="inventory-label" class="property-label"><g:message code="item.inventory.label" default="Inventory" /></span>

                <span class="property-value" aria-labelledby="inventory-label"><g:link controller="itemInventory" action="show" id="${itemInstance?.inventory?.id}">${itemInstance?.inventory?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${itemInstance?.capacity}">
            <li class="fieldcontain">
                <span id="capacity-label" class="property-label"><g:message code="item.capacity.label" default="Capacity" /></span>

                <span class="property-value" aria-labelledby="capacity-label"><g:link controller="itemCapacity" action="show" id="${itemInstance?.capacity?.id}">${itemInstance?.capacity?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>
        </ol>

        <h1>Edit History</h1>
        <ol class="property-list item">
        <g:if test="${itemInstance?.createdBy}">
            <li class="fieldcontain">
                <span id="createdBy-label" class="property-label"><g:message code="item.createdBy.label" default="Created By" /></span>

                <span class="property-value" aria-labelledby="dateCreated-label">${itemInstance?.createdBy}</span>

            </li>
        </g:if>

        <g:if test="${itemInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="item.dateCreated.label" default="Date Created" /></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${itemInstance?.dateCreated}" /></span>

            </li>
        </g:if>


        <g:if test="${itemInstance?.lastUpdatedBy}">
            <li class="fieldcontain">
                <span id="lastUpdatedBy-label" class="property-label"><g:message code="item.lastUpdatedBy.label" default="Last Updated By" /></span>

                <span class="property-value" aria-labelledby="dateCreated-label">${itemInstance?.lastUpdatedBy}</span>

            </li>
        </g:if>

        <g:if test="${itemInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="item.lastUpdated.label" default="Last Updated" /></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${itemInstance?.lastUpdated}" /></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource:itemInstance, action:'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${itemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
