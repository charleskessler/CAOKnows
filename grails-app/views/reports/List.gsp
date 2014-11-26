<%--
Module 8.0 -- Display Report
--%>
<%@ page import="caoknowsv3.Item" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Report</title>
</head>
<body>
<a href="#list-item" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index">Reports Menu</g:link></li>
    </ul>
</div>
<div id="list-item" class="content scaffold-list" role="main">
    <h1>${params.type} Report</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:if test="${params.type == "Items With No Location"}">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="itemCode" title="${message(code: 'item.itemCode.label', default: 'Item Code')}" />

                <g:sortableColumn property="itemUPC" title="${message(code: 'item.itemUPC.label', default: 'Item UPC')}" />

                <g:sortableColumn property="description" title="${message(code: 'item.description.label', default: 'Description')}" />

                <g:sortableColumn property="casePack" title="${message(code: 'item.casePack.label', default: 'Case Pack')}" />

                <g:sortableColumn property="unitSize" title="${message(code: 'item.unitSize.label', default: 'Unit Size')}" />

                <g:sortableColumn property="unitType" title="${message(code: 'item.unitType.label', default: 'Unit Type')}" />

            </tr>
            </thead>
            <tbody>
            <g:each in="${itemInstanceList}" status="i" var="itemInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link controller="Item" action="show" id="${itemInstance.id}">${fieldValue(bean: itemInstance, field: "itemCode")}</g:link></td>

                    <td>${fieldValue(bean: itemInstance, field: "itemUPC")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "description")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "casePack")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "unitSize")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "unitType")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </g:if>
    <g:elseif test="${params.type == "Backroom Pull" || params.type == "Backroom Inventory"}">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="itemCode" title="${message(code: 'item.itemCode.label', default: 'Item Code')}" />

                <g:sortableColumn property="itemUPC" title="${message(code: 'item.itemUPC.label', default: 'Item UPC')}" />

                <g:sortableColumn property="description" title="${message(code: 'item.description.label', default: 'Description')}" />

                <g:sortableColumn property="casePack" title="${message(code: 'item.casePack.label', default: 'Case Pack')}" />

                <g:sortableColumn property="unitSize" title="${message(code: 'item.unitSize.label', default: 'Unit Size')}" />

                <g:sortableColumn property="unitType" title="${message(code: 'item.unitType.label', default: 'Unit Type')}" />

                <g:sortableColumn property="inventory" title="Backroom Inventory" />

            </tr>
            </thead>
            <tbody>
            <g:each in="${itemInstanceList}" status="i" var="itemInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link controller="Item" action="show" id="${itemInstance.id}">${fieldValue(bean: itemInstance, field: "itemCode")}</g:link></td>

                    <td>${fieldValue(bean: itemInstance, field: "itemUPC")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "description")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "casePack")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "unitSize")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "unitType")}</td>

                    <td><g:link controller="ItemInventory" action="show" id="${itemInstance.inventory.id}">
                            <g:fieldValue bean="${itemInstance.inventory}" field="backroom"></g:fieldValue>
                        </g:link>
                    </td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </g:elseif>
    <g:elseif test="${params.type == "Negative Inventory"}">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="itemCode" title="${message(code: 'item.itemCode.label', default: 'Item Code')}" />

                <g:sortableColumn property="itemUPC" title="${message(code: 'item.itemUPC.label', default: 'Item UPC')}" />

                <g:sortableColumn property="description" title="${message(code: 'item.description.label', default: 'Description')}" />

                <g:sortableColumn property="unitSize" title="${message(code: 'item.unitSize.label', default: 'Unit Size')}" />

                <g:sortableColumn property="unitType" title="${message(code: 'item.unitType.label', default: 'Unit Type')}" />

                <g:sortableColumn property="inventory" title="Inventory" />

                <g:sortableColumn property="location" title="Location" />

            </tr>
            </thead>
            <tbody>
            <g:each in="${itemInstanceList}" status="i" var="itemInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link controller="Item" action="show" id="${itemInstance.id}">${fieldValue(bean: itemInstance, field: "itemCode")}</g:link></td>

                    <td>${fieldValue(bean: itemInstance, field: "itemUPC")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "description")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "unitSize")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "unitType")}</td>

                    <td><g:link controller="ItemInventory" action="show" id="${itemInstance.inventory.id}">
                        ${fieldValue(bean: itemInstance, field: "inventory")}
                    </g:link>
                    </td>

                    <td><g:link controller="ItemLocation" action="show" id="${itemInstance.location.id}">
                            ${fieldValue(bean: itemInstance, field: "location")}
                        </g:link>
                    </td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </g:elseif>
    <g:elseif test="${params.type == "Discontinued Items"}">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="itemCode" title="${message(code: 'item.itemCode.label', default: 'Item Code')}" />

                <g:sortableColumn property="itemUPC" title="${message(code: 'item.itemUPC.label', default: 'Item UPC')}" />

                <g:sortableColumn property="description" title="${message(code: 'item.description.label', default: 'Description')}" />

                <g:sortableColumn property="unitSize" title="${message(code: 'item.unitSize.label', default: 'Unit Size')}" />

                <g:sortableColumn property="unitType" title="${message(code: 'item.unitType.label', default: 'Unit Type')}" />

                <g:sortableColumn property="location" title="Location" />


            </tr>
            </thead>
            <tbody>
            <g:each in="${itemInstanceList}" status="i" var="itemInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link controller="Item" action="show" id="${itemInstance.id}">${fieldValue(bean: itemInstance, field: "itemCode")}</g:link></td>

                    <td>${fieldValue(bean: itemInstance, field: "itemUPC")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "description")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "unitSize")}</td>

                    <td>${fieldValue(bean: itemInstance, field: "unitType")}</td>

                    <td><g:link controller="ItemLocation" action="show" id="${itemInstance.location.id}">
                        ${fieldValue(bean: itemInstance, field: "location")}
                    </g:link>
                    </td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </g:elseif>
</div>
</body>
</html>
