<%@ include file="/includes/prelude.jspf" %>
<%@ tag language="java" %>

<%@ attribute name="pageTitle" %>

<mws:pageStart pageTitle="${pageTitle}"/>
<div class="page-wrapper" ng-controller="ShoppingCartCtrl">
    <div ng-controller="ProfileCtrl">
            <mws:pageHeader/>
            <%-- Container for the page --%>
            <section id="wrapper">
                <div class="container">
                    <%--<div class="max-width margintop30">
                        <div class="row">
                            <div class="col-lg-3 megadropdown">
                                <mws:navbarMenu vertical="true"/>
                            </div>
                        </div>
                    </div>--%>
                </div>
                <div class="main__content">
                    <div class="container">
                        <div class="row">
                            <jsp:doBody/>
                        </div>
                    </div>
                </div>
            </section>
            <mws:pageFooter/>
    </div>
</div>
<mws:pageEnd/>