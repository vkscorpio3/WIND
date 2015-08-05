<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java" pageEncoding="UTF-8"%>

<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>

<ul id="profileTabs" class="nav nav-tabs">
	<li class="active">
		<a href="#addressBook" data-toggle="tab">Адресная книга</a>
	</li>
	<li>
		<a href="#myOrders" data-toggle="tab">История заказов</a>
	</li>
		<li>
		<a href="#changePassword" data-toggle="tab">Изменить пароль</a>
	</li>
		<li>
		<a href="#socialNetworks" data-toggle="tab">Социальные сети</a>
	</li>
		<li>
		<a href="#subscription" data-toggle="tab">Рассылка</a>
	</li>
		<li>
		<a href="#wishList" data-toggle="tab">Избранное</a>
	</li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="addressBook">
		<h4 class="head">Адресная книга</h4>
		<mws:addressBookForm editable="true"/>
		<%--<dsp:a title="Добавить новый адрес" href="address.jsp" iclass="btn btn-primary">Добавить новый адрес</dsp:a>--%>

		<!-- Button trigger modal -->
		<button class="btn-red float-left" data-toggle="modal" data-target="#profileAddressesModal">Добавить новый адрес</button>
		
		<c:set var="profileNewAddressFormId" value="profileAddressesModal"/>
		<c:set var="editAddressFromId" value="editAddress"/>
		
		<mws:addressModalForm type="profile" formHandlerComponent="ProfileFormHandler.editValue" modalDialogId="${profileNewAddressFormId}" title="Новый адрес" mapId="map1"/>
		<mws:addressModalForm type="profile" formHandlerComponent="ProfileFormHandler.editValue" modalDialogId="editAddress" title="Редактирование адреса" mapId="map2"/>
		
		<script type="text/javascript">
			var centerX = '<dsp:valueof bean="/atg/userprofiling/ProfileFormHandler.editValue.latitude"/>';
			var centerY = '<dsp:valueof bean="/atg/userprofiling/ProfileFormHandler.editValue.longitude"/>';
			var profileNewAddressFormId = '${profileNewAddressFormId}';
			var editAddressFromId = '${editAddressFromId}';
		</script>
		<script src="//api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
		<script src="/js/ymap.init.js"></script>
	
	</div>
	<div class="tab-pane fade" id="myOrders">
		<h4 class="head">История заказов</h4>
        <mws:ordersForm/>
	</div>
	<div class="tab-pane fade" id="changePassword">
		<h4 class="head">Изменить пароль</h4>
		<dsp:form action="${originatingRequest.requestURI}" method="post" formid="changePasswordForm">
			<div class="box">
				<div class="form-group">
					<div class="col-lg-2">
						<label class="control-label">Старый пароль <span class="not-empty">*</span></label>
					</div>
					<div class="col-lg-10">
						<dsp:input type="password" bean="ProfileFormHandler.value.OLDPASSWORD" required="true" maxlength="255" iclass="form-block" placeholder="Старый пароль"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-2">
						<label class="control-label">Новый пароль <span class="not-empty">*</span></label>
					</div>
					<div class="col-lg-10">
						<dsp:input type="password" bean="ProfileFormHandler.value.password" value="" required="true" maxlength="255" iclass="form-block" placeholder="Новый пароль"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-2">
						<label class="control-label">Повторите пароль <span class="not-empty">*</span></label>
					</div>
					<div class="col-lg-10">
						<dsp:input type="password" bean="ProfileFormHandler.value.CONFIRMPASSWORD" required="true" maxlength="255" iclass="form-block" placeholder="Новый пароль"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-12">
						<dsp:input bean="ProfileFormHandler.changePassword" type="submit" value="Изменить пароль" iclass="btn-red float-left"/>
					</div>
				</div>
				<dsp:input type="hidden" bean="ProfileFormHandler.changePasswordSuccessURL" value="${originatingRequest.requestURI}"/>
				<dsp:input type="hidden" bean="ProfileFormHandler.changePasswordErrorURL" value="${originatingRequest.requestURI}#changePassword"/>
				<dsp:input type="hidden" bean="ProfileFormHandler.confirmOldPassword" value="true"/>
				<dsp:input type="hidden" bean="ProfileFormHandler.confirmPassword" value="true"/>
			</div>
		</dsp:form>
	</div>
	<div class="tab-pane fade" id="socialNetworks">
		<h4 class="head">Связь с социальными сетями</h4>
		<p>Пусто</p>
	</div>
    <div class="tab-pane fade" id="subscription">
		<h4 class="head">Настройка рассылки</h4>
		<mws:subscriptionForm/>
	</div>
	<div class="tab-pane fade" id="wishList">
		<h4 class="head">Избранное</h4>
		<mws:wishListForm formId="addToCartFromWishlist" />
	</div>
</div>
