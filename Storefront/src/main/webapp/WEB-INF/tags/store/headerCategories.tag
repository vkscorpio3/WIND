<%@ include file="/includes/prelude.jspf"%>
<%@ tag language="java"%>


<!-- header-container -->
<div class="header-container">
	<div class="container">

		<!-- row -->
		<div class="row">

			<!-- col-lg-9 -->
			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-8 pull-right">
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
						<mws:searchBox/>
					</div>
				</div>

			</div>
			<!-- /col-lg-9 -->

			<!-- col-lg-3 -->
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">

				<div class="nav-str-down">
					<a href="#" class="nav-str-link visible-lg visible-md visible-sm"
						id="pc-nav">nav</a> <a href="#" class="nav-str-link visible-xs"
						id="mobile-nav">nav</a>
				</div>
				<!-- main-menu -->
				<div class="main-menu">

					<nav class="navbar main-navbar" role="navigation">
						<!-- Brand and toggle get grouped for better mobile display -->


						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="main-collapse" id="bs-example-navbar-collapse-1">

							<mws:navbarMenu />

						</div>
						<!-- /.navbar-collapse -->
					</nav>
				</div>
				<!-- /main-menu -->
			</div>
			<!-- /col-lg-3 -->
		</div>
		<!-- /row -->
	</div>
</div>
<!-- header-container -->
