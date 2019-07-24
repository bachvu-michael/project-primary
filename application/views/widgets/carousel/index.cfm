

<cfparam name="args.images"      default="" />
<cfscript>
    event	.include( assetId="jq-magnific"               ,group="botJs" )
            .include( assetId="css-magnific"                            );
</cfscript>
<cfoutput>
    <div class="flexslider slider white nav-inner white"  data-options="controlNav:true,directionNav:true">>
        <ul class="slides">
            <cfloop  list="#args.images#" item="img">
                <li>
                    <a class="img-box img-scale-up lightbox" href="#event.buildLink(assetId=img,derivative="about_2" )#" data-lightbox-anima="show-scale" style="height: unset;">
                        #renderAsset(assetId=img,args={  derivative="about_2" })#
                    </a>
                </li>
            </cfloop>
        </ul>
    </div>
</cfoutput>
