
<%@ page import="caoknowsv3.ItemInventory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemInventory.label', default: 'ItemInventory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-itemInventory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-itemInventory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list itemInventory">
			
				<g:if test="${itemInventoryInstance?.item}">
				<li class="fieldcontain">
					<span id="item-label" class="property-label"><g:message code="itemInventory.item.label" default="Item" /></span>
					
						<span class="property-value" aria-labelledby="item-label"><g:link controller="item" action="show" id="${itemInventoryInstance?.item?.id}">${itemInventoryInstance?.item?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInventoryInstance?.shelf}">
				<li class="fieldcontain">
					<span id="shelf-label" class="property-label"><g:message code="itemInventory.shelf.label" default="Shelf" /></span>
					
						<span class="property-value" aria-labelledby="shelf-label"><g:fieldValue bean="${itemInventoryInstance}" field="shelf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInventoryInstance?.backroom}">
				<li class="fieldcontain">
					<span id="backroom-label" class="property-label"><g:message code="itemInventory.backroom.label" default="Backroom" /></span>
					
						<span class="property-value" aria-labelledby="backroom-label"><g:fieldValue bean="${itemInventoryInstance}" field="backroom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInventoryInstance?.mezzanine}">
				<li class="fieldcontain">
					<span id="mezzanine-label" class="property-label"><g:message code="itemInventory.mezzanine.label" default="Mezzanine" /></span>
					
						<span class="property-value" aria-labelledby="mezzanine-label"><g:fieldValue bean="${itemInventoryInstance}" field="mezzanine"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInventoryInstance?.lastUpdatedBy}">
				<li class="fieldcontain">
					<span id="lastUpdatedBy-label" class="property-label"><g:message code="itemInventory.lastUpdatedBy.label" default="Last Updated By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:link controller="user" action="show" id="${itemInventoryInstance?.lastUpdatedBy?.id}">${itemInventoryInstance?.lastUpdatedBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInventoryInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="itemInventory.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${itemInventoryInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:itemInventoryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${itemInventoryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
