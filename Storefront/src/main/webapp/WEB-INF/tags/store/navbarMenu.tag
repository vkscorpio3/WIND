<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<%@ attribute name="vertical" type="java.lang.Boolean"%>

<dsp:importbean	bean="/atg/commerce/endeca/cache/DimensionValueCacheDroplet" />
<dsp:importbean bean="/atg/userprofiling/Profile" />

<dsp:getvalueof var="topLevelCategories" bean="Profile.catalog.rootNavigationCategory.childCategories" />

<ul class="navbar__dropdown__nav">

	<li class="navbar__dropdown__item">
		<a href="#"	class="navbar__dropdown__link main-navbar__title">каталог товаров</a>
	</li>
	<!-- LI--1 -->
	
	<c:forEach var="topLevelCategory" items="${topLevelCategories}" varStatus="status">

		<c:set var="topLevelCategoryCacheEntry" value="" />
		<dsp:droplet name="DimensionValueCacheDroplet">
			<dsp:param name="repositoryId" value="${topLevelCategory.repositoryId}" />
			<dsp:oparam name="output">
				<dsp:getvalueof var="topLevelCategoryCacheEntry" param="dimensionValueCacheEntry" />
			</dsp:oparam>
		</dsp:droplet>

		<c:if test="${(not empty topLevelCategoryCacheEntry && not empty topLevelCategoryCacheEntry.url)}">
			<li class="navbar__dropdown__item">
				<dsp:a page="${topLevelCategoryCacheEntry.url}" iclass="navbar__dropdown__link link__arrow">
					<dsp:valueof value="${topLevelCategory.displayName}"></dsp:valueof>
					<c:if test="${empty vertical}">						
					</c:if>
					<i class="icon__arrow"></i>
				</dsp:a>
				<!-- sub_menu -->				
				<c:if test="${not empty topLevelCategory.childCategories}">
					<mws:navbarCategory categories="${topLevelCategory.childCategories}" topLevelCategoryId="${topLevelCategory.repositoryId}" />
				</c:if>				
				<!-- /sub_menu -->				
			</li>
		</c:if>
	</c:forEach>
</ul>
<%--

<div class="categories-list ${vertical ? 'navbar-vertical' : ''}">
	<div class="title">каталог товаров</div>
	<ul class="nav navbar-nav">
		<c:forEach var="topLevelCategory" items="${topLevelCategories}" varStatus="status">
	
			<c:set var="topLevelCategoryCacheEntry" value="" />
			<dsp:droplet name="DimensionValueCacheDroplet">
				<dsp:param name="repositoryId" value="${topLevelCategory.repositoryId}" />
				<dsp:oparam name="output">
					<dsp:getvalueof var="topLevelCategoryCacheEntry" param="dimensionValueCacheEntry" />
				</dsp:oparam>
			</dsp:droplet>
	
			<c:if test="${(not empty topLevelCategoryCacheEntry && not empty topLevelCategoryCacheEntry.url)}">
				<li class="dropdown">
					<dsp:a page="${topLevelCategoryCacheEntry.url}" iclass="dropdown-toggle">
						<dsp:valueof value="${topLevelCategory.displayName}"></dsp:valueof>
						<c:if test="${empty vertical}">
							<b class="caret"></b>
						</c:if>
					</dsp:a>
					<c:if test="${not empty topLevelCategory.childCategories}">
						<mws:navbarCategory categories="${topLevelCategory.childCategories}" topLevelCategoryId="${topLevelCategory.repositoryId}" />
					</c:if>
				</li>
			</c:if>
		</c:forEach>
	</ul>
</div>

 --%>