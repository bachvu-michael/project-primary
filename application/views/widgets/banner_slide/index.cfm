

<cfparam name="args.slides"        type="string"      editable="true"  default="" />
<cfscript>

</cfscript>
<cfoutput>
    <div class="section-empty no-paddings">
        <div class="section-slider row-18">
            <div class="flexslider advanced-slider slider" data-options="animation:fade">
                <ul class="slides">
                    <cfif !isEmpty(args.slides)>
                        #renderView(
                            view          = "/widgets/banner_slide/_item"
                          , presideObject = "widget_item_banner_slide"
                          , filter        = { id=listToArray( args.slides ) }
                          , orderBy       = "FIELD( id, #listqualify( args.slides, "'" )# )"
                        )#
                    </cfif>
                </ul>
            </div>
        </div>
    </div>
</cfoutput>