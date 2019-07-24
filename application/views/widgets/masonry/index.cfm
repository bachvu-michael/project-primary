

<cfparam name="args.images"         default="" />
<cfparam name="args.max_item"       default=4 />
<cfparam name="args.is_container"   default=0 />
<cfparam name="args.layout"         default="4" />

<cfscript>
    event	.include( assetId="jq-magnific"               ,group="botJs" )
            .include( assetId="css-magnific"                            );
</cfscript>
<cfoutput>
    <div class="<cfif args.is_container == 1>container<cfelse>container-fluid</cfif>">
        <div class="maso-list maso-layout gallery">
            <div class="maso-box row" data-lightbox-anima="show-scale">
                <cfloop  list="#args.images#" item="img">
                    <div class="maso-item col-md-#args.layout#">
                        <a class="img-box i-center" href="#event.buildLink(assetId=img)#" data-anima="show-scale" data-trigger="hover" data-anima-out="hide">
                            <i class="fa fa-camera anima"></i>
                            #renderAsset(assetId=img, args={ derivative="masonry" })#
                        </a>
                    </div>
                </cfloop>
            </div>
            <div class="list-nav">
                <a href="##" class="circle-button btn btn-sm circle-button load-more-maso" data-pagination-anima="fade-bottom" data-page-items="#args.max_item#">
                    Load More
                    <i class="fa fa-arrow-down"></i>
                </a>
            </div>
        </div>
    </div>
</cfoutput>
