<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<dsp:importbean	bean="/atg/commerce/endeca/cache/DimensionValueCacheDroplet" />

<%@ attribute name="items" required="true" rtexprvalue="true" type="java.util.Collection"%>
<%@ attribute name="topLevelCategoryId" %>

<ul class="sub_menu_child">
	<c:forEach var="item" items="${items}" varStatus="status">
		
		<c:set var="subCategoryCacheEntry" />
		<dsp:droplet name="DimensionValueCacheDroplet">
			<dsp:param name="repositoryId" value="${item.repositoryId}" />
			<dsp:param name="ancestors" value="${topLevelCategoryId}" />
			<dsp:oparam name="output">
				<dsp:getvalueof var="subCategoryCacheEntry"	param="dimensionValueCacheEntry" />
			</dsp:oparam>
		</dsp:droplet>
		
		<c:if test="${(not empty subCategoryCacheEntry && not empty subCategoryCacheEntry.url)}">
			<li class="sub_menu__item_child">
				<dsp:a page="${subCategoryCacheEntry.url}" iclass="sub_menu__link sub__child">
					<dsp:valueof value="${item.displayName}"></dsp:valueof>
				</dsp:a>
			</li>			
			<c:if test="${not empty item.childCategories}">
				<mws:navbarList items="${item.childCategories}"/>
			</c:if>
		</c:if>	
	</c:forEach>
</ul>
<!-- sub_menu_child -->

<%--
<c:forEach var="item" items="${items}" varStatus="status">
	
	<c:set var="subCategoryCacheEntry" />
	<dsp:droplet name="DimensionValueCacheDroplet">
		<dsp:param name="repositoryId" value="${item.repositoryId}" />
		<dsp:param name="ancestors" value="${topLevelCategoryId}" />
		<dsp:oparam name="output">
			<dsp:getvalueof var="subCategoryCacheEntry"	param="dimensionValueCacheEntry" />
		</dsp:oparam>
	</dsp:droplet>
	
	<c:if test="${(not empty subCategoryCacheEntry && not empty subCategoryCacheEntry.url)}">
		<li>
			<dsp:a page="${subCategoryCacheEntry.url}" iclass="dropdown-toggle">
				<dsp:valueof value="${item.displayName}"></dsp:valueof>
			</dsp:a>
		</li>			
		<c:if test="${not empty item.childCategories}">
			<ul>
				<mws:navbarList items="${item.childCategories}"/>
			</ul>
		</c:if>
	</c:if>	
</c:forEach>
 --%>