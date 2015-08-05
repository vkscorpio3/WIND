<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier" />
<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach" />
<dsp:importbean	bean="/atg/commerce/payment/CreditCardTools" />

<!--- Start payment method -->
<div class="panel-group" id="accordion">
	<div class="panel">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a class="accordion-toggle" data-toggle="collapse"
					data-parent="#accordion" href="#collapseOne"> Оплата кредитной картой </a>
			</h4>
		</div>
		<div id="collapseOne" class="panel-collapse collapse in">
			<div class="panel-body">
				<div class="form-horizontal margintop20">
					<div class="form-group">
						<label class="col-lg-2 control-label">Тип карты <span class="not-empty">*</span></label>
						<div class="col-lg-8">
							<dsp:droplet name="ForEach">
								<dsp:param name="array" bean="CreditCardTools.cardTypesMap" />
								<dsp:param name="elementName" value="creditCard" />
								<dsp:oparam name="output">
									<div class="radio">
										<label>
											<dsp:input type="radio" bean="ShoppingCartModifier.paymentGroup.creditCardType" paramvalue="key" />
											<dsp:valueof param="creditCard" />
										</label>
									</div>									
								</dsp:oparam>
							</dsp:droplet>							
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">Имя<span class="not-empty">*</span></label>
						<div class="col-lg-8">
							<dsp:input type="text" bean="ShoppingCartModifier.paymentGroup.billingAddress.firstName" required="true" iclass="form-block" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">Фамилия<span class="not-empty">*</span></label>
						<div class="col-lg-8">
							<dsp:input type="text" bean="ShoppingCartModifier.paymentGroup.billingAddress.lastName" required="true" iclass="form-block" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">№ карты<span class="not-empty">*</span></label>
						<div class="col-lg-8">
							<dsp:input type="text" bean="ShoppingCartModifier.paymentGroup.creditCardNumber" required="true" iclass="form-block" />
							<p class="form-info">16 знаков на передней стороне карты</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">CVV<span class="not-empty">*</span></label>
						<div class="col-lg-8">
							<dsp:input type="text" bean="ShoppingCartModifier.paymentGroup.cardVerificationNumber" required="true" iclass="form-block" maxlength="4" />							
							<p class="form-info">3 знака на обороте карты</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">Срок действия<span class="not-empty">*</span></label>
						<div class="col-lg-8">
							<dsp:select bean="ShoppingCartModifier.paymentGroup.expirationMonth" required="true">
								<dsp:option value="">Месяц</dsp:option>
								<dsp:option value="01">Январь</dsp:option>
								<dsp:option value="02">Февраль</dsp:option>
								<dsp:option value="03">Март</dsp:option>
								<dsp:option value="04">Апрель</dsp:option>
								<dsp:option value="05">Май</dsp:option>
								<dsp:option value="06">Июнь</dsp:option>
								<dsp:option value="07">Июль</dsp:option>
								<dsp:option value="08">Август</dsp:option>
								<dsp:option value="09">Сентябрь</dsp:option>
								<dsp:option value="10">Октябрь</dsp:option>
								<dsp:option value="11">Ноябрь</dsp:option>
								<dsp:option value="12">Декабрь</dsp:option>
							</dsp:select>
							<dsp:select bean="ShoppingCartModifier.paymentGroup.expirationYear" required="true">
								<dsp:option value="">Год</dsp:option>
								<dsp:option value="2013">2013</dsp:option>
								<dsp:option value="2014">2014</dsp:option>
								<dsp:option value="2015">2015</dsp:option>
								<dsp:option value="2016">2016</dsp:option>
								<dsp:option value="2017">2017</dsp:option>
								<dsp:option value="2018">2018</dsp:option>
								<dsp:option value="2019">2019</dsp:option>
								<dsp:option value="2020">2020</dsp:option>
							</dsp:select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="panel">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a class="accordion-toggle" data-toggle="collapse"
					data-parent="#accordion" href="#collapseTwo"> Через paypal </a>
			</h4>
		</div>
		<div id="collapseTwo" class="panel-collapse collapse">
			<div class="panel-body">
				<div class="form-horizontal margintop20">
					<div class="form-group">
						<label class="col-lg-2 control-label">PayPal имя пользователя <span
							class="not-empty">*</span></label>
						<div class="col-lg-8">
							<input type="email" class="form-block"
								placeholder="Enter paypal address" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-2 control-label">Подтвердите PayPal имя пользователя <span class="not-empty">*</span>
						</label>
						<div class="col-lg-8">
							<input type="email" class="form-block" placeholder="Confirm paypal address" />
							<p class="form-info">Remember do not copy and paste</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End payment method -->

<!-- Start cart action -->
<div class="row">
	<div class="col-lg-12 bg2 cart-action">
		<dsp:input type="submit" value="Потвердить" bean="ShoppingCartModifier.moveToConfirmation" iclass="btn btn-lg btn-primary"/>		
	</div>
</div>
<!-- End cart action -->