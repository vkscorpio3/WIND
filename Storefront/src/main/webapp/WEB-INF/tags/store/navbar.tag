<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach" />
<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
<dsp:importbean bean="/atg/dynamo/droplet/Switch" />

<dsp:importbean bean="/atg/commerce/catalog/comparison/ProductList"/>
<dsp:importbean bean="/atg/commerce/catalog/comparison/ProductListContains"/>
<dsp:importbean bean="/atg/commerce/catalog/comparison/ProductListHandler"/>

<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>	
<dsp:importbean bean="/atg/commerce/order/purchase/RepriceOrderDroplet" />
<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier" />	
<dsp:importbean bean="/atg/commerce/gifts/GiftlistFormHandler"/>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />

<dsp:importbean bean="/atg/multisite/Site"/>

<dsp:getvalueof bean="/apm/atg/commerce/order/states/CheckoutProgressStates.currentLevelAsInt" id="currentLevel" idtype="java.lang.Integer"/>
<dsp:getvalueof var="order" bean="ShoppingCartModifier.shoppingCart.current" />

<dsp:droplet name="RepriceOrderDroplet">
	<dsp:param value="ORDER_SUBTOTAL" name="pricingOp" />
</dsp:droplet>
 
<dsp:importbean bean="/atg/commerce/catalog/CatalogNavHistory" />
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>

<dsp:getvalueof var="topLevelCategories" bean="Profile.catalog.rootNavigationCategory.childCategories" />

<dsp:getvalueof var="siteName" bean="Site.name"/>
<dsp:getvalueof var="isAccurateGeolocation" bean="Profile.isAccurateGeolocation"/>

<div ng-init="accurateGeolocation('${siteName}','${isAccurateGeolocation}')">

<div class="container">
	<!-- row -->
	<div class="row">
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
			<div class="logo">
				<a class="h-logo-link" href="${originatingRequest.contextPath}/index.jsp"><img src="/images/logo.png" alt="Магнит: всегда низкие цены!" /></a>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-2 col-xs-6 hidden-xs">
			<!-- select-city -->
			<div class="select-city">
				<i class="glyphicon glyphicon-map-marker gm"></i> <span
					class="your-city">Ваш город:</span>
					<dsp:include page="/global/site.jsp" />
			</div>
			<!-- select-city -->
		</div>
		<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6 hidden-xs">
			<div class="headerPhone-box">
				<span class="h-phone-text">Горячая линия</span> <span
					class="h-phone">8 800 355 55 55</span> <span class="h-phone-text">ежедневно
					с 7.00 до 23.00</span>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<dsp:droplet name="Switch">
						<dsp:param name="value" bean="Profile.transient" />
						<dsp:oparam name="true">
							<!-- sign-in-user active -->
							<div class="sign-in-user">
								<a href="${originatingRequest.contextPath}/myaccount/registration.jsp" class="sign-reg-link hidden-xs">
									<span class="s-r-text s-reg">Регистрация</span>
								</a>
								<dsp:a href="${originatingRequest.contextPath}/myaccount/login.jsp" iclass="sign-enter-link icon-lock icon-men">
									<span class="s-e-text">Вход</span>
								</dsp:a>
							</div>
						</dsp:oparam>
						<dsp:oparam name="false">
							<!-- sign-in-user active -->
							<div class="sign-in-user active">
								<dsp:a href="${originatingRequest.contextPath}/myaccount/profile.jsp" value="true" iclass="sign-reg-link hidden-xs">
									<span class="s-r-text s-cabinet visible-lg visible-md">Личный кабинет</span>
									<span class="s-r-text s-cabinet visible-sm">Кабинет</span>
								</dsp:a>
								<dsp:a href="${originatingRequest.contextPath}/myaccount/profile.jsp" value="true" iclass="sign-enter-link icon-lock icon-men">
									<dsp:getvalueof bean="Profile.firstName" var="firstname" />
									<dsp:getvalueof bean="Profile.middleName" var="middleName" />
									<span class="s-e-user">
										<c:if test="${not empty firstname}">
											<c:out value="${firstname}"/>
										</c:if>
										<c:if test="${not empty middleName}">
											<br />
											,<c:out value="${middleName}"/>
										</c:if>
									</span>
									<span class="s-e-col">8</span>
								</dsp:a>

								<ul class="s-menu hidden-xs">
									<li class="s-menu__item"><a href="#"
										class="s-menu__item__link">Новости (8)</a></li>
									<li class="s-menu__item"><a href="#"
										class="s-menu__item__link">данные</a></li>
									<li class="s-menu__item"><a href="#"
										class="s-menu__item__link">Заказы (0/3)</a></li>
									<li class="s-menu__item"><a href="#"
										class="s-menu__item__link">Настройки</a></li>
									<li class="s-menu__item"><a href="#"
										class="s-menu__item__link">Избранное</a></li>
									<li class="s-menu__item"><a href="#"
										class="s-menu__item__link">обратная связь</a></li>
									<li class="s-menu__item">
										<dsp:a href="${originatingRequest.contextPath}/index.jsp" value="true" bean="ProfileFormHandler.logout" iclass="s-menu__item__link">
											выход
										</dsp:a>
									</li>
								</ul>
							</div>
						</dsp:oparam>
					</dsp:droplet>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<!-- checkout -->
					<div class="checkout">
						<dsp:form action="${originatingRequest.requestURI}" method="post" name="removeItemCompareListForm">
			    			<dsp:input type="hidden" bean="ProductListHandler.productID" ng-model="productId" ng-value="productId" />
			    			<dsp:input type="hidden" bean="ProductListHandler.skuID" ng-model="skuId" ng-value="skuId" />
			    			<dsp:input type="hidden" bean="ProductListHandler.removeProduct" value="Submit" />
			    		</dsp:form>

			    		<dsp:form action="${originatingRequest.requestURI}" method="post" name="addItemCompareListForm">
			    			<dsp:input type="hidden" bean="ProductListHandler.productID" ng-model="productId" ng-value="productId" />
			    			<dsp:input type="hidden" bean="ProductListHandler.skuID" ng-model="skuId" ng-value="skuId" />
			    			<dsp:input type="hidden" bean="ProductListHandler.addProduct" value="Submit"/>
			    		</dsp:form>

						<dsp:form action="${originatingRequest.requestURI}" method="post" name="wishListForm">
							<dsp:input type="hidden" bean="GiftlistFormHandler.productId" ng-model="productId" ng-value="productId" />
							<dsp:input type="hidden" bean="GiftlistFormHandler.catalogRefIds" ng-model="skuId" ng-value="skuId" />
							<dsp:input type="hidden" bean="GiftlistFormHandler.giftlistId" beanvalue="Profile.wishlist.id" />
							<dsp:input type="hidden" bean="GiftlistFormHandler.quantity" value="1"/>
							<dsp:input type="hidden" bean="GiftlistFormHandler.addItemToGiftlist" value="Submit" />
						</dsp:form>

						<dsp:form action="${originatingRequest.requestURI}" method="post" name="cartForm" >
							<dsp:input type="hidden" bean="CartModifierFormHandler.productId" ng-model="productId" ng-value="productId" />
							<dsp:input type="hidden" bean="CartModifierFormHandler.catalogRefIds" ng-model="skuId" ng-value="skuId" />
							<dsp:input type="hidden" bean="CartModifierFormHandler.quantity" value="1" />
							<dsp:input type="hidden" bean="CartModifierFormHandler.addItemToOrder" value="Submit"/>
						</dsp:form>

						<dsp:form action="${originatingRequest.requestURI}" method="post" name="removeItemCartForm" >
							<dsp:input type="hidden" bean="CartModifierFormHandler.removalCommerceIds" ng-model="cItemIdToRemove" ng-value="cItemIdToRemove"/>
							<dsp:input type="hidden" bean="CartModifierFormHandler.removeItemFromOrder" value="Submit"/>
						</dsp:form>

						<dsp:form action="${originatingRequest.requestURI}" method="post" name="updateCartForm" >
							<dsp:input type="hidden" bean="CartModifierFormHandler.setOrderByCommerceId" value="Submit" />
						</dsp:form>

						<a href="${originatingRequest.contextPath}/cart/cart.jsp" class="checkout-basket">
							<span class="s-r-text hidden-xs">Корзина</span>
						</a>
						<a href="${originatingRequest.contextPath}/cart/cart.jsp" class="topBasket-info icon-backet">
							<span id="cItemCnt" class="checkout-col">{{totalItemsCount}}</span>
							<span id="cartAmount" class="checkout-price">{{totalAmount}}</span>
							<span class="checkout-cur">руб.</span>
							<span class="checkout-order s-r-text hidden-xs">Оформить заказ</span>
						</a>

						<ul class="s-menu hidden-xs" id="s-cart" ng-if="!isEmptyCart();">
							<li class="s-menu__item" ng-repeat="item in items" ng-init="itemInitial($index)">
								<a href="#" class="s-menu__del" ng-click="removeFromCart(item.id)">del</a>
								<a href="${originatingRequest.contextPath}{{item.productTemplateURL}}?productId={{item.productId}}" class="s-menu__item__link s-cart__item__link" title="{{item.productDisplayName}}">
	    							{{item.productDisplayName|truncate:20}}
	    						</a>
	    						<span class="s-cart__col">({{item.quantity}})</span>
							</li>
						</ul>

						<%--
							<ul class="s-menu hidden-xs" id="s-cart">
							<dsp:droplet name="/apm/atg/magnit/droplet/OrderSplitDroplet">
								<dsp:param name="order" bean="ShoppingCart.current"/>
								<dsp:oparam name="unavailableItems">
									<dsp:droplet name="ForEach">
										<dsp:param name="array" param="commerceItems" />
										<dsp:param name="elementName" value="commerceItem" />
										<dsp:oparam name="output">
											<dsp:param name="itemAvailable" value="false"/>
											<dsp:getvalueof param="commerceItem.auxiliaryData.productId" var="productId"/>
											<dsp:getvalueof param="commerceItem.auxiliaryData.productRef.parentCategory.id" var="parentCategoryId"/>
											<dsp:getvalueof param="commerceItem.catalogRefId" var="skuId"/>
											<dsp:getvalueof param="commerceItem.id" var="commerceItemId"/>
											<dsp:getvalueof param="commerceItem.auxiliaryData.productRef.template.url" var="templateUrl"/>
											<dsp:getvalueof param="commerceItem.auxiliaryData.productRef.displayName" var="displayName"/>
											<li id="citem-${commerceItemId}"  class="s-menu__item">
												<a href="#" class="s-menu__del" onclick="removeFromCart('${commerceItemId}','${skuId}');" >del</a>
												<dsp:a href="${originatingRequest.contextPath}${templateUrl}" iclass="s-menu__item__link s-cart__item__link" title="${displayName}">
					    							<dsp:param name="productId" value="${productId}"/>
					    							${fn:substring(displayName, 0, 20)}...
					    						</dsp:a>
					    						<span class="s-cart__col">(<dsp:valueof param="commerceItem.quantity"/>)</span>
											</li>
										</dsp:oparam>
									</dsp:droplet>
								</dsp:oparam>
								<dsp:oparam name="availableItems">
									<dsp:droplet name="ForEach">
										<dsp:param name="array" param="commerceItems" />
										<dsp:param name="elementName" value="commerceItem" />
										<dsp:oparam name="output">
											<dsp:param name="itemAvailable" value="true"/>
											<dsp:getvalueof param="commerceItem.auxiliaryData.productId" var="productId"/>
											<dsp:getvalueof param="commerceItem.auxiliaryData.productRef.parentCategory.id" var="parentCategoryId"/>
											<dsp:getvalueof param="commerceItem.catalogRefId" var="skuId"/>
											<dsp:getvalueof param="commerceItem.id" var="commerceItemId"/>
											<dsp:getvalueof param="commerceItem.auxiliaryData.productRef.template.url" var="templateUrl"/>
											<dsp:getvalueof param="commerceItem.auxiliaryData.productRef.displayName" var="displayName"/>
											<li id="citem-${commerceItemId}" class="s-menu__item">
												<a href="#" class="s-menu__del" onclick="removeFromCart('${commerceItemId}','${skuId}');" >del</a>
												<dsp:a href="${originatingRequest.contextPath}${templateUrl}" iclass="s-menu__item__link s-cart__item__link" title="${displayName}">
					    							<dsp:param name="productId" value="${productId}"/>
					    							${fn:substring(displayName, 0, 20)}...
					    						</dsp:a>
					    						<span class="s-cart__col">(<dsp:valueof param="commerceItem.quantity"/>)</span>
											</li>
										</dsp:oparam>
									</dsp:droplet>
								</dsp:oparam>
							</dsp:droplet>
						</ul>
						--%>
					</div>
					<!-- /checkout -->
				</div>
			</div>
		</div>
	</div>
	<!-- /row -->
</div>
</div>

<%-- Select region dialog info --%>
<dsp:include page="/global/sitesInfo.jsp" />
