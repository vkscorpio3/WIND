<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<dsp:importbean	bean="/atg/commerce/endeca/cache/DimensionValueCacheDroplet" />

<%@ attribute name="categories" required="true" rtexprvalue="true" type="java.util.Collection"%>
<%@ attribute name="topLevelCategoryId" %>

<span class="visible-xs sub_arrow">sub_arrow</span>

<!-- sub_menu -->
<ul class="sub_menu">
	<c:forEach var="category" items="${categories}" varStatus="status">
					
		<c:set var="subCategoryCacheEntry" />
		<dsp:droplet name="DimensionValueCacheDroplet">
			<dsp:param name="repositoryId" value="${category.repositoryId}" />
			<dsp:param name="ancestors" value="${topLevelCategoryId}" />
			<dsp:oparam name="output">
				<dsp:getvalueof var="subCategoryCacheEntry"	param="dimensionValueCacheEntry" />
			</dsp:oparam>
		</dsp:droplet>
		
		<c:if test="${(not empty subCategoryCacheEntry && not empty subCategoryCacheEntry.url)}">
			<li class="sub_menu__item">
				<dsp:a page="${subCategoryCacheEntry.url}" iclass="sub_menu__link">
					<dsp:valueof value="${category.displayName}"></dsp:valueof>
					<span class="sub_menu__arrow">arrow</span>
				</dsp:a>
			</li>						
			<c:if test="${not empty category.childCategories}">
				<mws:navbarList items="${category.childCategories}"/>
			</c:if>
		</c:if>				

	</c:forEach>
</ul>
<!-- /sub_menu -->

<!-- dropdown__sub_content -->
<div class="dropdown__sub_content dropdown__sub1 hidden-xs">
	<c:forEach var="category" items="${categories}" varStatus="status">
	
		<c:if test="${status.first}">
			<div class="row">
		</c:if>
					
		<c:set var="subCategoryCacheEntry" />
		<dsp:droplet name="DimensionValueCacheDroplet">
			<dsp:param name="repositoryId" value="${category.repositoryId}" />
			<dsp:param name="ancestors" value="${topLevelCategoryId}" />
			<dsp:oparam name="output">
				<dsp:getvalueof var="subCategoryCacheEntry"	param="dimensionValueCacheEntry" />
			</dsp:oparam>
		</dsp:droplet>
		
		<c:if test="${(not empty subCategoryCacheEntry && not empty subCategoryCacheEntry.url)}">
			<!-- col-lg-3 -->
			<div class="col-lg-3 col-md-3 col-sm-4">
				<!-- dropdown__sub_menu -->
				<ul class="dropdown__sub_menu">
					<li class="dropdown__sub_item">
						<dsp:a page="${subCategoryCacheEntry.url}" iclass="dropdown__sub_link dropdown__sub_link-b">
							<dsp:valueof value="${category.displayName}"></dsp:valueof>
						</dsp:a>
						<c:if test="${not empty category.childCategories}">							
							<mws:navbarList items="${category.childCategories}"/>
						</c:if>								
					</li>
				</ul>
				<!-- /dropdown__sub_menu -->
			</div>
		</c:if>
					
		<c:if test="${((status.index % 2) eq 0) && !status.first}">
			</div>
			<!-- End row -->
			
			<c:if test="${!status.last}">
				<!-- Start row -->
				<div class="row">
			</c:if>	
		</c:if>						

	</c:forEach>
</div>
	
<%--
<ul class="dropdown-menu">
	<li>		
		<div class="megadropdown-content">
			<c:forEach var="category" items="${categories}" varStatus="status">
			
				<c:if test="${status.first}">
					<div class="row">
				</c:if>
							
				<c:set var="subCategoryCacheEntry" />
				<dsp:droplet name="DimensionValueCacheDroplet">
					<dsp:param name="repositoryId" value="${category.repositoryId}" />
					<dsp:param name="ancestors" value="${topLevelCategoryId}" />
					<dsp:oparam name="output">
						<dsp:getvalueof var="subCategoryCacheEntry"	param="dimensionValueCacheEntry" />
					</dsp:oparam>
				</dsp:droplet>
				
				<c:if test="${(not empty subCategoryCacheEntry && not empty subCategoryCacheEntry.url)}">
					<ul class="col-sm-2 list-unstyled">
						<li>
							<b>
								<dsp:a page="${subCategoryCacheEntry.url}" iclass="dropdown-toggle">
									<dsp:valueof value="${category.displayName}"></dsp:valueof>
								</dsp:a>
							</b>
						</li>						
						<c:if test="${not empty category.childCategories}">
							<li class="divider"></li>
							<mws:navbarList items="${category.childCategories}"/>
						</c:if>										
					</ul>
				</c:if>
							
				<c:if test="${((status.index % 2) eq 0) && !status.first}">
					</div>
					<!-- End row -->
					
					<c:if test="${!status.last}">
						<!-- Start row -->
						<div class="row">
					</c:if>	
				</c:if>						

			</c:forEach>
		</div>
	</li>
</ul>
 --%>