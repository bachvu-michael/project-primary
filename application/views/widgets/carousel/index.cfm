

<cfparam name="args.title"      default="" />
<cfparam name="args.sub_title"      default="" />
<cfparam name="args.layout"      default="" />
<cfparam name="args.items"      default="" />

<cfscript>
   
</cfscript>
<cfoutput>
    <div class="section-empty section-item text-center">
		<div class="container content">
			<div class="title-modern title-modern-2 st-icon text-center">
				<h2 style="border-bottom: 2px solid ##14ce0d;font-weight: 600;">#args.title#</h2>
				<hr >
				<p>#args.sub_title#</p>
			</div>
			<hr class="space m" />
			<div class="row">
				<div class="col-md-12">
					<div class="flexslider carousel outer-navs" data-options="itemMargin:15,minWidth:190">
						<ul class="slides">
                            #renderView(
                                view          =  "/widgets/carousel/_item_cart"
                              , presideObject = "cart_v1_item"
                              , filter        = { id=listToArray( args.items ) }
                              , orderBy       = "FIELD( id, #listqualify( args.items, "'" )# )"
                            )#
						</ul>
					</div>
				</div>
			</div>
			<hr class="space s" />
		</div>
	</div>
</cfoutput>
