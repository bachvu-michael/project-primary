



<cfparam name="args.background_color"  default="" />
<cfparam name="args.items"  default="" />
<cfparam name="args.layout"  default="" />
<cfscript>
    prc.layout =  args.layout;
</cfscript>
<cfoutput>
    <div class="section-bg-color bg-color white" style="background-color:#args.background_color#;">
        <div class="container content">
            <div class="row">
                <cfif !isEmpty(args.items)>
                    #renderView(
                        view          =  "/widgets/show_count/_item"
                      , presideObject = "item_count"
                      , filter        = { id=listToArray( args.items ) }
                      , orderBy       = "FIELD( id, #listqualify( args.items, "'" )# )"
                    )#
                </cfif>
            </div>
        </div>
    </div>
</cfoutput>