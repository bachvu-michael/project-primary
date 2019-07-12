

<cfparam name="args.group_product"      default="" />
<cfparam name="args.product"            default="" />
<cfparam name="args.background_color"            default="##f7f7f7" />
<cfparam name="args.title_widget"            default="" />
<cfparam name="args.has_title"            default="" />
<cfparam name="args.layout"            default="" />
<cfscript>
</cfscript>
<cfoutput>
<cfif args.layout == 0>
    <div class="section-bg-color" style="background-color:#args.background_color#;">
        <div class="container content">
            <cfif args.has_title == "1">
                <div class="header-base"  style="background-color:#args.background_color#;padding:0;border:0;min-height:80px;">
                    <div class="title-base text-left">
                        #args.title_widget#
                    </div>
                </div>
            </cfif>
            <div class="maso-list">
                <cfif !isEmpty(args.group_product)>
                    <div class="navbar navbar-inner">
                        <div class="navbar-toggle"><i class="fa fa-bars"></i><span>Menu</span><i class="fa fa-angle-down"></i></div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav over ms-minimal inner maso-filters">
                                #renderView(
                                    view          = "/widgets/maso_list/_item_group"
                                  , presideObject = "group_product"
                                  , filter        = { id=listToArray( args.group_product ) }
                                  , orderBy       = "FIELD( id, #listqualify( args.group_product, "'" )# )"
                                )#
                                <li  class="current-active active"><a data-filter="maso-item">All packages</a></li>
                                <li><a class="maso-order" data-sort="asc"><i class="fa fa-arrow-down"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </cfif>
                <div class="maso-box row">
                    <cfif !isEmpty(args.product)>
                        #renderView(
                            view          = "/widgets/maso_list/_item"
                        , presideObject = "product"
                        , filter        = { id=listToArray( args.product ) }
                        , orderBy       = "FIELD( id, #listqualify( args.product, "'" )# )"
                        )#
                    </cfif>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
</cfif>

<cfif args.layout == 1>
    <div class="section-empty section-item"  style="background-color:#args.background_color#;">
        <div class="container content">
            <cfif args.has_title == "1">
                <div class="header-base"  style="background-color:#args.background_color#;padding:0;border:0;min-height:80px;">
                    <div class="title-base text-left">
                        #args.title_widget#
                    </div>
                </div>
            </cfif>
            <div class="maso-list list-sm-6">
                <div class="navbar navbar-inner">
                    <div class="navbar-toggle"><i class="fa fa-bars"></i><span>MENU</span><i class="fa fa-angle-down"></i></div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav over ms-minimal inner maso-filters">
                            <li class="active"><a data-filter="maso-item">All</a></li>
                            #renderView(
                                view          = "/widgets/maso_list/_item_group"
                              , presideObject = "group_product"
                              , filter        = { id=listToArray( args.group_product ) }
                              , orderBy       = "FIELD( id, #listqualify( args.group_product, "'" )# )"
                            )#
                            <li><a class="maso-order" data-sort="asc"><i class="fa fa-arrow-down"></i></a></li>
                        </ul>
                    </div>
                </div>

                <div class="maso-box row" data-lightbox-anima="fade-top">
                    <cfif !isEmpty(args.product)>
                        #renderView(
                            view          = "/widgets/maso_list/_item_small"
                        , presideObject = "product"
                        , filter        = { id=listToArray( args.product ) }
                        , orderBy       = "FIELD( id, #listqualify( args.product, "'" )# )"
                        )#
                    </cfif>
                    <div class="clear"></div>
                </div>

                <div class="list-nav">
                    <a href="##" class="circle-button btn btn-sm circle-button load-more-maso" data-pagination-anima="fade-bottom" data-page-items="4">
                        Load More
                        <i class="fa fa-arrow-down"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</cfif>
</cfoutput>