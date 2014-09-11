
<%@ page import="caoknowsv3.ItemCapacity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemCapacity.label', default: 'ItemCapacity')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-itemCapacity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-itemCapacity" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list itemCapacity">
			
				<g:if test="${itemCapacityInstance?.item}">
				<li class="fieldcontain">
					<span id="item-label" class="property-label"><g:message code="itemCapacity.item.label" default="Item" /></span>
					
						<span class="property-value" aria-labelledby="item-label"><g:link controller="item" action="show" id="${itemCapacityInstance?.item?.id}">${itemCapacityInstance?.item?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemCapacityInstance?.facings}">
				<li class="fieldcontain">
					<span id="facings-label" class="property-label"><g:message code="itemCapacity.facings.label" default="Facings" /></span>
					
						<span class="property-value" aria-labelledby="facings-label"><g:fieldValue bean="${itemCapacityInstance}" field="facings"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemCapacityInstance?.depth}">
				<li class="fieldcontain">
					<span id="depth-label" class="property-label"><g:message code="itemCapacity.depth.label" default="Depth" /></span>
					
						<span class="property-value" aria-labelledby="depth-label"><g:fieldValue bean="${itemCapacityInstance}" field="depth"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemCapacityInstance?.height}">
				<li class="fieldcontain">
					<span id="height-label" class="property-label"><g:message code="itemCapacity.height.label" default="Height" /></span>
					
						<span class="property-value" aria-labelledby="height-label"><g:fieldValue bean="${itemCapacityInstance}" field="height"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemCapacityInstance?.secondary}">
				<li class="fieldcontain">
					<span id="secondary-label" class="property-label"><g:message code="itemCapacity.secondary.label" default="Secondary" /></span>
					
						<span class="property-value" aria-labelledby="secondary-label"><g:fieldValue bean="${itemCapacityInstance}" field="secondary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemCapacityInstance?.lastUpdatedBy}">
				<li class="fieldcontain">
					<span id="lastUpdatedBy-label" class="property-label"><g:message code="itemCapacity.lastUpdatedBy.label" default="Last Updated By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:link controller="user" action="show" id="${itemCapacityInstance?.lastUpdatedBy?.id}">${itemCapacityInstance?.lastUpdatedBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemCapacityInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="itemCapacity.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${itemCapacityInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:itemCapacityInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${itemCapacityInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
