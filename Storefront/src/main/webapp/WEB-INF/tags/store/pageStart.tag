<%@ include file="/includes/prelude.jspf" %>
<%@ tag language="java"%>

<%@ attribute name="pageTitle" %>

<!DOCTYPE html>
<html lang="ru" ng-app="mwsFrontEndApp">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon"/>

    <title>${pageTitle}</title>
    
	<link rel="apple-touch-icon" href="/images/touch/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/images/touch/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/images/touch/apple-touch-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="144x144" href="/images/touch/apple-touch-icon-144x144.png">
	
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="/css/style.css" />
	<link rel="stylesheet" href="/css/overwrite.css" />
	<link rel="stylesheet" href="/css/modals.css" />
	<link rel="stylesheet" href="/css/jquery.bxslider.css" />
	<link rel="stylesheet" href="/css/jquery.fancybox.css" />
	<link rel="stylesheet" href="/css/scrollbar.css" />
	<link rel="stylesheet" href="/css/bootstrap-dialog.min.css" />

	<!-- JavaScript Libraries -->
	<script src="/js/angular.min.js"></script>
    <script src="/js/ui-bootstrap-tpls-0.12.0.min.js"></script>
    <script src="/js/angular-cookies.js"></script>
    <script src="/js/angular-animate.js"></script>
    <script src="/js/angular-animate.min.js"></script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.bxslider.min.js"></script>
    <script src="/js/jquery.scrollbar.js"></script>
    <script src="/js/jquery.cloudzoom.js"></script>
    <script src="/js/jquery.fancybox.pack.js"></script>
    <script src="/js/jquery.cookies.min.js"></script>
    <script src="/js/bootstrap.dialog.min.js"></script>
    <script src="/js/site.selector.js"></script>

	<!-- UI Design -->
	<script src="/js/script.js"></script>
	
	<!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
	<script src="/js/ie-emulation-modes-warning.js"></script>

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="/js/ie10-viewport-bug-workaround.js"></script>	
    <!--[if lt IE 9]>
	  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js "></script>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <script src="http://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script>
      <link rel="stylesheet" href="css/ie.css" />
    <![endif]-->
    
    <!-- Main Application JavaScript -->    
	<script src="/js/application.js"></script>
    <script src="/js/rest.js"></script>
    
  </head>
  <body ng-cloak>