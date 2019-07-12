<cfscript>

    site        = event.getSite() ?: {};

    //header_content = site.header_content ?: "";
    //header_social_links = site.header_social_links ?: "";

    mainNav     = renderViewlet( event = "core.navigation.mainNavigation", args = { depth = 2 } );
    classAdmin = "";
	if(event.isAdminUser()){
		classAdmin = "admin-editable"
	}
</cfscript>
<cfoutput>
    <header data-menu-anima="fade-top" style="z-index: 103;" class="#classAdmin#">
        <div class="navbar navbar-default navbar-big-logo navbar-fixed-top header-nav" role="navigation">
            <div class="navbar navbar-main mega-menu-fullwidth">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="/"><img src="/assets/HTWF/images/logo-badge-sika.png" alt="logo" /> </a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav nav-collapse-l1">
                            <li class="dropdown">
                                <a href="/">Trang Chủ</a>
                            </li>
                            #mainNav#
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
</cfoutput>