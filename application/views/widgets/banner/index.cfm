<cfparam name="args.image"  default="" />
<cfparam name="args.text"   default="" />
<cfparam name="args.color"   default="" />
<cfparam name="args.buttonItem"   default="" />
<cfparam name="args.text"   default="" />
<cfparam name="args.backgroundColor"  default="##ffffff" />
<cfoutput>
    <div class="section-empty no-paddings-y" style="background-color:#args.backgroundColor#;">
        <div class="container content">
            <div class="row">
                <div class="col-md-5" data-anima="fade-left" data-timeline="asc" data-time="1000" data-timeline-time="400">
                    <hr class="space" />
                    #rendercontent("richeditor", args.text)#
                    <hr class="space s" />
                    <div class="anima">
                        <cfif !isEmpty(args.buttonItem)>
                            #renderView(
                                view          = "/widgets/general/_button"
                              , presideObject = "common_widget_button_HTWF"
                              , filter        = { id=listToArray( args.buttonItem ) }
                              , orderBy       = "FIELD( id, #listqualify( args.buttonItem, "'" )# )"
                            )#
                        </cfif>
                    </div>
                </div>
                <div class="col-md-7" data-anima="fade-right" data-time="1100">
                    #renderAsset( assetId=args.image, args={ class="banner-background-image",alt="nentangvang company",derivative="banner" } )#
                </div>
            </div>
        </div>
    </div>
</cfoutput>