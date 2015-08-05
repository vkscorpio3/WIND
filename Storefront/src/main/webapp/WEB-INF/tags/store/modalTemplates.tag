<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>

<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />

<script type="text/ng-template" id="ModalWindowTemplate.html">
    <div tabindex="-1" role="dialog" class="modal fade" ng-class="{in: animate}" ng-style="{'z-index': 1050 + index*10, display: 'block'}" ng-click="close($event)">
        <div class="modal-dialog container"><div class="modal-content" modal-transclude></div></div>
    </div>
</script>

<script type="text/ng-template" id="AdultContent.html">
    <div class="modal-header">
        <button class="close" ng-click="cancel()">&times;</button>
        <h4 class="modal-title text-center">Каталог</h4>
    </div><!-- /modal-header -->
    <div class="modal-body modal-body--bottom text-center row">
        <div class="alert-message">
            <img src="/images/modals/modal-9.jpg" alt="#">
        </div><!-- /alert-message -->
        <div class="info-message col-xs-10 col-xs-offset-1">
            Вам исполнилось 18 лет?
        </div>
        <!-- /info-message -->
        <div class="buttons col-xs-10 col-xs-offset-1">
            <button class="btn btn-default button--ml" ng-click="ok()">Да</button>
            <button class="btn btn-default" ng-click="cancel()">Нет</button>
        </div>
        <!-- /buttons -->
        <div class="dop-info col-xs-10 col-xs-offset-1">
            Пожалуйста, <a href="${originatingRequest.contextPath}/myaccount/registration.jsp" class="dop-info__link--red">зарегистрируйтесь</a>, или <a href="${originatingRequest.contextPath}/myaccount/login.jsp" class="dop-info__link--red">войдите</a>, чтобы
            не отвечать на этот вопрос при каждом визите в магазин
        </div><!-- /dop-info -->
        <dsp:form action="${originatingRequest.requestURI}" method="post" name="adultConfirmForm">
            <dsp:input type="hidden" bean="ProfileFormHandler.value.isOverEighteen" ng-model="isOverEighteen"
                       ng-value="isOverEighteen"/>
            <dsp:input type="hidden" bean="ProfileFormHandler.update" value="Submit"/>
        </dsp:form>
    </div><!-- /modal-body -->
</script>

<script type="text/ng-template" id="GeolocationModal.html">
    <div class="modal-header">
        <button class="close" ng-click="cancel()">&times;</button>
        <h4 class="modal-title text-center">Местонахождение</h4>
    </div>
    <!-- /modal-header -->
    <div class="modal-body text-center row">
        <div class="alert-message col-xs-10 col-xs-offset-1">
            <img src="/images/modals/modal-3.jpg" alt="#">
        </div>
        <!-- /alert-message -->
        <div class="info-message col-xs-10 col-xs-offset-1">
            Ваш город {{ siteName }}?
        </div>
        <!-- /info-message -->
        <div class="buttons col-xs-10 col-xs-offset-1">
            <button class="btn btn-default button--ml" ng-click="confirmGeolocation()">Да</button>
            <button class="btn btn-default" ng-click="cancel()">Нет</button>
        </div>
        <!-- /buttons -->
        <dsp:form action="${originatingRequest.requestURI}" method="post" name="accurateGeolocationForm">
            <dsp:input type="hidden" bean="ProfileFormHandler.value.isAccurateGeolocation"
                       ng-model="isAccurateGeolocation"/>
            <dsp:input type="hidden" bean="ProfileFormHandler.update" value="Submit"/>
        </dsp:form>
    </div>
</script>

<script type="text/ng-template" id="RemoveItemModal.html">
    <div class="modal-header">
        <button class="close" ng-click="cancelRemoveItem()">&times;</button>
        <h4 class="modal-title text-center">Корзина</h4>
    </div>
    <div class="modal-body modal-body--bottom text-center row">
        <div class="alert-message col-xs-10 col-xs-offset-1">
            <img src="/images/modals/modal-4.jpg" alt="#">
        </div>
        <!-- /alert-message -->
        <div class="info-message col-xs-10 col-xs-offset-1">
            Пожалуйста, подтвердите удаление
        </div>
        <!-- /info-message -->

        <div class="buttons col-xs-10 col-xs-offset-1">
            <button class="btn btn-default button--ml" ng-click="confirmRemoveItem()">Да</button>
            <button class="btn btn-alert" ng-click="cancelRemoveItem()">Нет</button>
        </div>
        <div class="dop-info col-xs-10 col-xs-offset-1">
            <input id="check-yes" type="checkbox" class="modal-body__checkbox" ng-model="stopRemoveItemAlerts">
            <label for="check-yes">Больше не задавать этот вопрос</label>
        </div>
        <!-- /dop-info -->
    </div>
</script>
