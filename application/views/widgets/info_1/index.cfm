

<cfparam name="args.background_color"        default="" />
<cfparam name="args.product"       default="" />
<cfparam name="args.sub_title"       default="" />
<cfparam name="args.contact_link"       default="" />
<cfparam name="args.image_represent"       default="" />
<cfparam name="args.layout"       default="" />
<cfscript>
    prc.sub_title = args.sub_title;
    prc.contact_link = args.contact_link;
    prc.image_represent = args.image_represent;
    prc.layout = args.layout;
</cfscript>
<cfoutput>
    <div class="section-empty no-paddings-y" style="background-color:#args.background_color#;">
        <div class="container content">
            <div class="row vertical-row">
                #renderView(
                    view          = "/widgets/info_1/_item"
                  , presideObject = "product"
                  , filter        = { id=listToArray( args.product ) }
                  , orderBy       = "FIELD( id, #listqualify( args.product, "'" )# )"
                )#
            </div>
        </div>
    </div>
</cfoutput>