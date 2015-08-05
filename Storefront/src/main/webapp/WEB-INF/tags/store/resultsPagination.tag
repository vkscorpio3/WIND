<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<%@ attribute name="contentItem" required="true" rtexprvalue="true" type="java.lang.Object"%>

<dsp:importbean bean="/atg/endeca/store/droplet/ActionURLDroplet" />

<!-- filter__top__content -->
<div class="filter__top__content">
    <div class="row">
        <div class="col-sm-3 visible-sm visible-xs col-xs-7">
            <a href="#" class="filter__link__show">Фильтры <span>(N товаров)</span></a>
        </div>
        
        <div class="visible-xs col-xs-5">
            <a href="#" class="show__sort">show__sort</a>
        </div>
        
        <div class="col-lg-2 col-md-2 col-xs-4 view-container view-container-m">
            <ul class="product__view">
                <li class="product__view__item active">
                    <a href="#" class="product__view__link c-grid-view"><i class="glyphicon glyphicon-th product__v__icon"></i></a>
                </li>
                <li class="product__view__item">
                    <a href="#" class="product__view__link c-list-view"><i class="glyphicon glyphicon-th-list product__v__icon"></i></a>
                </li>                                    
            </ul>
        </div>
        
        <div class="col-lg-3 col-md-4 col-sm-2 col-xs-5 select-container1">
	        <dsp:form id="sortByForm" action="${originatingRequest.contextPath}/browse" iclass="sort-item">
				<!-- select -->
				<div class="filter__select">
					<a href="javascript:void(0);" class="f__slct">
						<c:set var="selectedOptionExists" value="${false }"/>
						<c:forEach var="sortOption" items="${contentItem.sortOptions}" varStatus="stat">							
							<c:if test="${sortOption.selected}">
								<fmt:message key="${sortOption.label}" />
								<c:set var="selectedOptionExists" value="${true }"/>
							</c:if>														
						</c:forEach>
						<c:if test="${!selectedOptionExists }">							
							<fmt:message key="common.topPicks" />
						</c:if>
					</a>
					<ul class="f__drop">
						<c:forEach var="sortOption" items="${contentItem.sortOptions}">
							<dsp:droplet name="ActionURLDroplet">
								<dsp:param name="action" value="${sortOption}" />
		
								<dsp:oparam name="output">
									<dsp:getvalueof var="actionURL" param="actionURL" />
									<c:set var="sortAction" value="${actionURL}" />
								</dsp:oparam>
							</dsp:droplet>
		
							<li sort-action="${sortAction}">
								<fmt:message key="${sortOption.label}"/>
							</li>
						</c:forEach>
					</ul>
					<input type="hidden" id="f__sel__sort" name="sort" value="${sortAction}"/>
				</div><!-- /select -->
			</dsp:form>
        </div>
        
        <div class="col-lg-3 col-md-2 col-xs-3 select-container2">
            <!-- select -->
            <div class="filter__select">
            	<a href="javascript:void(0);" class="f__slct f__slct__col">100</a>
            	<ul class="f__drop f__drop__col">
					<li sort-action="${originatingRequest.contextPath}/browse?Npp=100">100</li>
                    <li sort-action="${originatingRequest.contextPath}/browse?Npp=200">200</li>
                    <li sort-action="${originatingRequest.contextPath}/browse?Npp=300">300</li>
                    <li sort-action="${originatingRequest.contextPath}/browse?Npp=50">50</li>
                    <li sort-action="${originatingRequest.contextPath}/browse?Npp=10">10</li>                               
            	</ul>
            	<input type="hidden" id="f__sel__col" />
            </div><!-- /select -->                                
        </div>
        
        <div class="col-lg-2 col-md-2 view-container hidden-xs">
            <ul class="product__view">
                <li class="product__view__item active">
                    <a href="#" class="product__view__link c-grid-view"><i class="glyphicon glyphicon-th product__v__icon"></i></a>
                </li>
                <li class="product__view__item">
                    <a href="#" class="product__view__link c-list-view"><i class="glyphicon glyphicon-th-list product__v__icon"></i></a>
                </li>                                    
            </ul>
        </div>
        
        <div class="col-lg-4 col-md-4 pagination-container hidden-xs">
        	<!-- main-pagination --> 
         	<ul class="main-pagination">         		
				<c:forEach var="pageElement" items="${contentItem.pagination}" varStatus="pageStatus">					
					<li class="pagination__item"><a href="${originatingRequest.contextPath}/browse${pageElement.url}" class="pagination__link ${contentItem.currentPage == pageElement.name ? 'active' : ''}">${pageElement.name}</a></li>
				</c:forEach>
			</ul>			
			<!-- /main-pagination -->                               
        </div>
        
    </div>                    
</div><!-- /filter__top__content -->

	

<%--
<!-- Start pagination -->
<div class="row"> 
	<div class="col-lg-12 pull-left max-width">
		<dsp:form id="sortByForm" action="${originatingRequest.contextPath}/browse" iclass="sort-item">
			<label for="sortBySelect">Порядок</label>

			<select id="sortBySelect" name="sort" onchange="location = this.options[this.selectedIndex].value">
				<c:forEach var="sortOption" items="${contentItem.sortOptions}">
					<dsp:droplet name="ActionURLDroplet">
						<dsp:param name="action" value="${sortOption}" />

						<dsp:oparam name="output">
							<dsp:getvalueof var="actionURL" param="actionURL" />
							<c:set var="sortAction" value="${actionURL}" />
						</dsp:oparam>
					</dsp:droplet>

					<option ${sortOption.selected ? 'selected="selected"' : ''} value="${sortAction}">
						<fmt:message key="${sortOption.label}"/>
					</option>
				</c:forEach>
			</select>
		</dsp:form>

		<ul class="pagination pagination-lg pull-right">
			<c:forEach var="pageElement" items="${contentItem.pagination}" varStatus="pageStatus">
				<c:set var="currentPage">${pageStatus.index}</c:set>
				<li><a href="${originatingRequest.contextPath}/browse${pageElement.url}" ${currentPage == pageElement.name ? 'class="active"' : ''}>${pageElement.name}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>--%>

<!-- End pagination -->