<!---
	This view file has been automatically created by the preside dev tools
	scaffolder. Please fill with meaningful content and remove this comment
--->
<cfoutput>

<cfif args.page_type_layout == "news">
    #renderView(
        view          = "/widgets/services/_item_news"
        , presideObject = "page"
        , filter        = { parent_page = args.parent_page }
        , orderBy ="#args.order#"
        , args={
            group    = ( args.group    ?: "" )
        }
    )#
<cfelse>
    <div class="section-empty section-item">
        <div class="container content">
            <div class="maso-list">
                <div class="navbar navbar-inner">
                <div class="navbar-toggle"><i class="fa fa-bars"></i><span>Menu</span><i class="fa fa-angle-down"></i></div>
                    <cfif args.group == 1>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav over ms-minimal inner maso-filters">
                                <li class="current-active active"><a data-filter="maso-item">All</a></li>
                                    <cfloop query="#args.listGroup#">
                                        <li><a data-filter="#class#">#title#</a></li>
                                    </cfloop>
                                <li><a class="maso-order" data-sort="asc"><i class="fa fa-arrow-down"></i></a></li>
                            </ul>
                        </div>
                    </cfif>
                </div>
                <cfif args.page_type_layout == "bigImage">
                        <div class="maso-box row" data-options="anima:fade-in">
                            #renderView(
                                view          = "/widgets/services/_item_services"
                                , presideObject = "page"
                                , filter        = { parent_page = args.parent_page }
                                , orderBy ="#args.order#"
                                , maxRows = "#args.max_item#"
                                ,args={
                                    group    = ( args.group    ?: "" )
                                }

                            )#
                            <div class="clear"></div>
                        </div>
                </cfif>
                <cfif args.page_type_layout == "smallImage">
                    <div class="maso-box row">
                        #renderView( 
                            view          = "/widgets/services/_item_projects"
                            , presideObject = "page"
                            , filter        = { parent_page = args.parent_page }
                            , orderBy ="#args.order#"
                            ,args={
                                group    = ( args.group    ?: "" )
                            }
                        )#
                        <!-- INSERT OTHERS GALLERY ITEMS HERE -->
                        <div class="clear"></div>
                    </div>
                </cfif>

            </div>
        </div>
</div>
</cfif>
</cfoutput>