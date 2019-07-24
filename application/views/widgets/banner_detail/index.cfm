<cfparam name="args.image"      default="" />
<cfparam name="args.content"    default="" />
<cfoutput>
        <div class="header-title ken-burn-center white" style="height:230px;"
            data-parallax="scroll"
            data-position="top"
            data-natural-height="650"
            data-natural-width="1920"
            <cfif !isEmpty(args.image)>
                data-image-src="#event.buildLink(assetId=args.image,derivative='banner_detail')#"
            <cfelse>
                data-image-src="/assets/img/video-1-poster.png"
            </cfif>
            >
            <div class="container">
                <div class="title-base">
                    <hr class="anima" />
                    <cfif !isEmpty(args.content)>
                        #renderContent( "richeditor", args.content )#
                    </cfif>
                </div>
            </div>
        </div>
</cfoutput>
