
<%@ page import="caoknowsv3.Item" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:javascript library="jquery" />
    <g:setProvider library="jquery"/>
    <title>Order Review</title>
</head>
<body>
<a href="#list-item" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>
<div id="list-item" class="content scaffold-list" role="main">
    <h1>Book ${params.bookNumber} Order Review</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="itemCode" title="${message(code: 'item.itemCode.label', default: 'Item Code')}" />

            <g:sortableColumn property="description" title="${message(code: 'item.description.label', default: 'Description')}" />

            <g:sortableColumn property="casePack" title="${message(code: 'item.casePack.label', default: 'Pack Size')}" />

            <g:sortableColumn property="casePack" title="${message(code: 'item.inventory.label', default: 'On Hand Units')}" />

            <g:sortableColumn property="casePack" title="${message(code: 'item.inventory.label', default: 'Shelf Cap')}" />

            <g:sortableColumn property="casePack" title="${message(code: 'item.order.label', default: 'Order Qty')}" style="width: 75px"  />
        </tr>
        </thead>
        <tbody>
        <g:each in="${itemInstanceList}" status="i" var="itemInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link controller="Item" action="show" id="${itemInstance.id}">${fieldValue(bean: itemInstance, field: "itemCode")}</g:link></td>

                <td>${fieldValue(bean: itemInstance, field: "description")}</td>

                <td>${fieldValue(bean: itemInstance, field: "casePack")}</td>

                <td>${fieldValue(bean: itemInstance, field: "inventory")}</td>

                <td>${fieldValue(bean: itemInstance, field: 'capacity')}</td>

                <td><g:remoteField style="width:50px" type="number" action="updateOrder" name="orderQty" paramName="orderQty" value="${fieldValue(bean: itemInstance?.orderHistory, field:'pendingDeliveryQuantity')}" id="${itemInstance?.id}"></g:remoteField>

            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<fieldset class="buttons">
        <g:link class="edit" action="completeOrder" params="[bookNumber:"${params.bookNumber}"]">Complete Order</g:link>
</fieldset>
</body>
</html>
