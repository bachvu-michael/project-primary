<cfscript>
	body     = renderView();
	mainNav  = renderViewlet( "core.navigation.mainNavigation" );
	metaTags = renderView( "/general/_pageMetaForHtmlHead" );
	adminBar = renderView( "/general/_adminToolbar"        );

    event
            //.include( "css-bootstrap" )
		 .include( "css-core"   )
		 .include( "css-font-awesome"  )
	     .include( "js-bootstrap"  )
		 .include( "js-jquery"     )
		 .include( "jq-script"     )
		 
		.include("jq-imagesloaded")
		.include("jq-parallax")
		.include("jq-flexslider")
		.include("jq-isotope")
		.include("jq-progress-counter")
		.include("jq-tab-accordion")
		.include("jq-bootstrap-popover")
		.include("jq-magnific-popup")
        .include("jq-social-stream")
        .include("jq-slimscroll")
		.include("jq-google-api");
        classAdmin = "";
        if(event.isAdminUser()){
            classAdmin = "admin-editable"
        }
</cfscript>

<cfoutput><!DOCTYPE html>
<html>
	<head>
		#metaTags#

		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		#event.renderIncludes( "css" )#
		<!--[if lt IE 9]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link rel="icon" href="/assets/template/images/favicon.png">
	</head>
	<body class="#classAdmin#">
		<div id="preloader"></div>
        <header class="fixed-top scroll-change " data-menu-anima="fade-in">
            <div class="navbar navbar-default mega-menu-fullwidth navbar-fixed-top" role="navigation">
                <div class="navbar navbar-main">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle">
                                <i class="fa fa-bars"></i>
                            </button>
                            <a class="navbar-brand" href="/">
                                <img class="logo-default" src="/assets/template/images/logo.png" alt="logo" />
                                <img class="logo-retina" src="/assets/template/images/logo-retina.png" alt="logo" />
                            </a>
                        </div>
                        <div class="collapse navbar-collapse">
                            <div class="nav navbar-nav navbar-right">
                                <ul class="nav navbar-nav">
                                    <li class="dropdown">
                                        <a href="/">Home</a>
                                        <!--<ul class="dropdown-menu multi-level">
                                            <li><a href="../../index-main.html">Main</a></li>
                                            <li><a href="../../index-design.html">Design</a></li>
                                            <li><a href="../../index-interiors.html">Interiors</a></li>
                                            <li><a href="../../index-business.html">Business</a></li>
                                            <li><a href="../../index-construction.html">Construction</a></li>
                                            <li><a href="../../index-fullpage.html">Fullpage</a></li>
                                            <li><a href="../../index-young.html">Young</a></li>
                                            <li><a href="../../index.html">Intro</a></li>
                                        </ul>-->
                                    </li>
                                    #mainNav#
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="footer-parallax-container">
            #body#
        </div>
        <i class="scroll-top scroll-top-mobile show fa fa-sort-asc"></i>
        <footer class="footer-center footer-parallax">
            <div class="content">
                <div class="container">
                    <div class="row footer-main">
                        <img src="/assets/template/images/logo.png" alt="" />
                        <hr class="space m" />
                        <p>Bedford-Stuyvesant, Brooklyn, New York, United States</p>
                        <p>federico@framework.com    (+05) 320 3057970    Skype fede.pixor</p>
                        <hr class="space xs" />
                        <div class="btn-group navbar-social">
                            <div class="btn-group social-group">
                                <a target="_blank" href="##"><i class="fa fa-facebook"></i></a>
                                <a target="_blank" href="##"><i class="fa fa-twitter"></i></a>
                                <a target="_blank" href="##"><i class="fa fa-instagram"></i></a>
                                <a target="_blank" href="##"><i class="fa fa-youtube"></i></a>
                            </div>
                        </div>
                        <hr class="space" />
                    </div>
                    <div class="row copy-row">
                        <div class="col-md-12 copy-text">
                            <div class="tag-row">
                                <span>© ALL RIGHTS RESERVED</span>
                                <span>FRAMEWORK Y</span>
                                <span>ENVATO MARKETPLACE</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

		#adminBar#

        #event.renderIncludes("js")#
        <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	</body>
</html></cfoutput>