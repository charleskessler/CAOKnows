
<%@ page import="caoknowsv3.Item" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
		<title>Book ${bookNum} Items</title>
	</head>
	<body>
		<a href="#list-item" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" controller="OrderBook" action="index">All Order Books</g:link></li>
                <g:isManager>
				    <li><g:link class="create" action="create" params='["bookNum":"${bookNum}"]'><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </g:isManager>

			</ul>
		</div>
		<div id="list-item" class="content scaffold-list" role="main">
			<h1>Book ${bookNum} Items</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="itemCode" params='["bookNum":"${bookNum}"]' title="${message(code: 'item.itemCode.label', default: 'Item Code')}" />
					
						<g:sortableColumn property="itemUPC" params='["bookNum":"${bookNum}"]' title="${message(code: 'item.itemUPC.label', default: 'Item UPC')}" />
					
						<g:sortableColumn property="description" params='["bookNum":"${bookNum}"]' title="${message(code: 'item.description.label', default: 'Description')}" />

						<g:sortableColumn property="unitSize" params='["bookNum":"${bookNum}"]' title="${message(code: 'item.unitSize.label', default: 'Unit Size')}" />
					
						<g:sortableColumn property="unitType" params='["bookNum":"${bookNum}"]' title="${message(code: 'item.unitType.label', default: 'Unit Type')}" />

                        <g:sortableColumn property="inventory" params='["bookNum":"${bookNum}"]' title="${message(code: 'item.inventory.label', default: 'On Hand')}" />

                        <g:sortableColumn property="capacity" params='["bookNum":"${bookNum}"]' title="${message(code: 'item.capacity.label', default: 'Capacity')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemInstanceList}" status="i" var="itemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemInstance.id}">${fieldValue(bean: itemInstance, field: "itemCode")}</g:link></td>
					
						<td>${fieldValue(bean: itemInstance, field: "itemUPC")}</td>
					
						<td>${fieldValue(bean: itemInstance, field: "description")}</td>

						<td>${fieldValue(bean: itemInstance, field: "unitSize")}</td>
					
						<td>${fieldValue(bean: itemInstance, field: "unitType")}</td>

                        <td>
                            <g:link controller="ItemInventory" action="show" id="${itemInstance.inventory.id}">
                                ${fieldValue(bean: itemInstance, field: "inventory")}
                            </g:link>
                        </td>

                        <td>
                            <g:link controller="ItemCapacity" action="show" id="${itemInstance.capacity.id}" >
                                ${fieldValue(bean: itemInstance, field: "capacity")}
                            </g:link>
                        </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate params='["bookNum":"${bookNum}"]' total="${itemInstanceCount ?: 0}"/>
			</div>
		</div>
	</body>
</html>
