<%@ include file="/includes/prelude.jspf" %>
<%@ tag language="java" pageEncoding="UTF-8" %>

<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<fmt:requestEncoding value="UTF-8"/>
<fmt:setLocale value="ru" />
<fmt:setBundle basename="atg.userprofiling.UserProfileMessages" var="lang"/>

<dsp:form action="${originatingRequest.requestURI}" method="post" formid="subscription_FormId">

    <h4>Уведомлять меня:</h4>

    <dsp:input type="checkbox" bean="ProfileFormHandler.editValue.subscribeNews"/> О новостях<br />
    <dsp:input type="checkbox" bean="ProfileFormHandler.editValue.subscribeNewCoupon"/> О появлении купонов<br />
    <dsp:input type="checkbox" bean="ProfileFormHandler.editValue.subscribeNewProduct"/> О новинках<br />
    <dsp:input type="checkbox" bean="ProfileFormHandler.editValue.subscribeNewPromotion"/> О проводимых акциях<br />
    <dsp:input type="checkbox" bean="ProfileFormHandler.editValue.subscribeOrderStatus"/> О статусах моего заказа<br />


    <%-- Section subscription by promotion treshold --%> <br />
    Уведомлять об акциях, если снижение цены на товар более %
    <dsp:select bean="ProfileFormHandler.subscribePromoThreshold">
        <dsp:option value="0">Не уведомлять</dsp:option>
        <dsp:option value="10">10</dsp:option>
        <dsp:option value="15">15</dsp:option>
        <dsp:option value="20">20</dsp:option>
        <dsp:option value="25">25</dsp:option>
        <dsp:option value="30">30</dsp:option>
    </dsp:select>

    <%-- Section subscription by categories --%> <br />

    <dsp:droplet name="ForEach">
        <dsp:param name="array" bean="Profile.catalog.allRootCategories"/>
        <dsp:param name="elementName" value="rootCategory"/>

        <dsp:oparam name="outputStart">
            <h4>Подписка на категории продуктов:</h4>
        </dsp:oparam>

        <dsp:oparam name="output">
            <dsp:input type="checkbox" bean="ProfileFormHandler.subscribeCatalogIDs" paramvalue="rootCategory.repositoryId"/>
            <dsp:valueof param="rootCategory.displayName"/><br />

            <dsp:droplet name="ForEach">
                <dsp:param name="array" param="rootCategory.childCategories"/> <%-- Or fixedChildCategories ??--%>
                <dsp:param name="elementName" value="childCategory"/>

                <dsp:oparam name="output">
                    &nbsp;&nbsp;
                    <dsp:input type="checkbox" bean="ProfileFormHandler.subscribeCatalogIDs" paramvalue="childCategory.repositoryId"/>
                    <dsp:valueof param="childCategory.displayName"/>
                    <br />
                </dsp:oparam>

                <dsp:oparam name="empty">
                    <%--<p>Подкатегорий не найдено.</p>--%>
                </dsp:oparam>
            </dsp:droplet>
        </dsp:oparam>

        <dsp:oparam name="empty">
            <%--<p> Категорий продуктов не найдено. </p>--%>
        </dsp:oparam>
    </dsp:droplet>

    <dsp:input type="submit" bean="ProfileFormHandler.subscribtion" value="Подписаться" iclass="btn-red float-left"/>
</dsp:form>
