<%@ include file="/includes/prelude.jspf" %>
<%@ tag language="java"%>

<%@attribute name="page" type="java.lang.String"%>

<dsp:importbean bean="/atg/dynamo/droplet/Switch" />

		
<div class="row bottom15">
	<dsp:droplet name="Switch">
		<dsp:param value="${page}" name="value" />
		<dsp:oparam name="delivery.jsp">
			<!-- breadcrumb -->
			<ol class="breadcrumb breadcrumb_steppage">
				<li class="breadcrumb__item"><a href="${originatingRequest.contextPath}/cart/cart.jsp" class="breadcrumb__item__link">Корзина</a></li>
				<li class="breadcrumb__item">Оформление заказа</li>
				<li class="breadcrumb__item breadcrumb__item_step breadcrumb__item_step_act">Способ <span class="breadcrumb__item_stepnum breadcrumb__item_stepnum_act">1</span></li>
				<li class="breadcrumb__item breadcrumb__item_step">Время <span class="breadcrumb__item_stepnum">2</span></li>
				<li class="breadcrumb__item breadcrumb__item_step">Оплата <span class="breadcrumb__item_stepnum">3</span></li>
				<li class="breadcrumb__item breadcrumb__item_step">Подтверждение <span class="breadcrumb__item_stepnum">4</span></li>
			</ol><!-- /breadcrumb -->
			<%-- <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item completed"><a href="delivery.jsp">Получение</a></h3></div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item"><a href="deliveryTime.jsp">Время</a></h3></div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item"><a href="billing.jsp">Оплата</a></h3></div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item"><a href="orderSummary.jsp">Подтверждение</a></h3></div>--%>
		</dsp:oparam>
		<dsp:oparam name="deliveryTime.jsp">
			<!-- breadcrumb -->
			<ol class="breadcrumb breadcrumb_steppage">
				<li class="breadcrumb__item"><a href="${originatingRequest.contextPath}/cart/cart.jsp" class="breadcrumb__item__link">Корзина</a></li>
				<li class="breadcrumb__item">Оформление заказа</li>
				<li class="breadcrumb__item breadcrumb__item_step"><a href="delivery.jsp" class="breadcrumb__item__link">Способ</a> <span class="breadcrumb__item_stepnum ">1</span></li>
				<li class="breadcrumb__item breadcrumb__item_step breadcrumb__item_step_act">Время <span class="breadcrumb__item_stepnum breadcrumb__item_stepnum_act">2</span></li>
				<li class="breadcrumb__item breadcrumb__item_step">Оплата <span class="breadcrumb__item_stepnum">3</span></li>
				<li class="breadcrumb__item breadcrumb__item_step">Подтверждение <span class="breadcrumb__item_stepnum">4</span></li>
			</ol><!-- /breadcrumb -->
			<%-- <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item completed"><a href="delivery.jsp">Получение</a></h3></div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item completed"><a href="deliveryTime.jsp">Время</a></h3></div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item"><a href="billing.jsp">Оплата</a></h3></div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item"><a href="orderSummary.jsp">Подтверждение</a></h3></div>--%>
		</dsp:oparam>
		<dsp:oparam name="billing.jsp">
			<!-- breadcrumb -->
			<ol class="breadcrumb breadcrumb_steppage">
				<li class="breadcrumb__item"><a href="${originatingRequest.contextPath}/cart/cart.jsp" class="breadcrumb__item__link">Корзина</a></li>
				<li class="breadcrumb__item">Оформление заказа</li>
				<li class="breadcrumb__item breadcrumb__item_step"><a href="delivery.jsp" class="breadcrumb__item__link">Способ</a> <span class="breadcrumb__item_stepnum">1</span></li>
				<li class="breadcrumb__item breadcrumb__item_step"><a href="deliveryTime.jsp" class="breadcrumb__item__link">Время</a> <span class="breadcrumb__item_stepnum">2</span></li>
				<li class="breadcrumb__item breadcrumb__item_step breadcrumb__item_step_act">Оплата <span class="breadcrumb__item_stepnum breadcrumb__item_stepnum_act">3</span></li>
				<li class="breadcrumb__item breadcrumb__item_step">Подтверждение <span class="breadcrumb__item_stepnum">4</span></li>
			</ol><!-- /breadcrumb -->
			<%--<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item completed"><a href="delivery.jsp">Получение</a></h3></div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item completed"><a href="deliveryTime.jsp">Время</a></h3></div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item completed"><a href="billing.jsp">Оплата</a></h3></div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item"><a href="orderSummary.jsp">Подтверждение</a></h3></div> --%>
		</dsp:oparam>
		<dsp:oparam name="orderSummary.jsp">
			<!-- breadcrumb -->
			<ol class="breadcrumb breadcrumb_steppage">
				<li class="breadcrumb__item"><a href="${originatingRequest.contextPath}/cart/cart.jsp" class="breadcrumb__item__link">Корзина</a></li>
				<li class="breadcrumb__item">Оформление заказа</li>
				<li class="breadcrumb__item breadcrumb__item_step"><a href="delivery.jsp" class="breadcrumb__item__link">Способ</a> <span class="breadcrumb__item_stepnum">1</span></li>
				<li class="breadcrumb__item breadcrumb__item_step"><a href="deliveryTime.jsp" class="breadcrumb__item__link">Время</a> <span class="breadcrumb__item_stepnum">2</span></li>
				<li class="breadcrumb__item breadcrumb__item_step"><a href="billing.jsp" class="breadcrumb__item__link">Оплата</a> <span class="breadcrumb__item_stepnum">3</span></li>
				<li class="breadcrumb__item breadcrumb__item_step breadcrumb__item_step_act">Подтверждение <span class="breadcrumb__item_stepnum breadcrumb__item_stepnum_act">4</span></li>
			</ol><!-- /breadcrumb -->
			<%-- <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item completed"><a href="delivery.jsp">Получение</a></h3></div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item completed"><a href="deliveryTime.jsp">Время</a></h3></div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item completed"><a href="billing.jsp">Оплата</a></h3></div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><h3 class="checkout-line-item completed"><a href="orderSummary.jsp">Подтверждение</a></h3></div>--%>
		</dsp:oparam>
	</dsp:droplet>
</div>