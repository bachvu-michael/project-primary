<cfparam name="args.background_color"  default="##fff" />
<cfparam name="args.title"  default="" />
<cfparam name="args.sub_title"  default="" />
<cfparam name="args.items"  default="" />
<cfscript>

</cfscript>
<cfoutput>
    <div class="section-bg-color section-item text-center" style="background-color:#args.background_color#;">
		<div class="container content">
			<div class="title-modern title-modern-2 st-icon text-center">
				<h2 style="border-bottom: 2px solid ##14ce0d;font-weight: 600;">#args.title#</h2>
				<hr >
				<p>#args.sub_title#</p>
			</div>
			<hr class="space m" />
			<div class="text-center">
				<div class="row">
                    <cfif !isEmpty(args.items)>
                        #renderView(
                            view          =  "/widgets/circle_3item/_item"
                          , presideObject = "circle_item"
                          , filter        = { id=listToArray( args.items ) }
                          , orderBy       = "FIELD( id, #listqualify( args.items, "'" )# )"
                        )#
                    </cfif>
				</div>
			</div>
			<hr class="space s" />
		</div>
	</div>
</cfoutput>