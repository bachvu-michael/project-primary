

<cfparam name="args.name"      default="" />
<cfparam name="args.description_short"      default="" />
<cfparam name="args.description_long"      default="" />
<cfparam name="args.images"      default="" />
<cfparam name="args.group_product"      default="" />

<cfscript>
    contact_link =  prc.contact_link ?: "";
    sub_title = prc.sub_title ?: "";
    image_represent = "/assets/HTWF/images/avatar-3.jpg";
    if(!isEmpty(prc.image_represent)){
        image_represent =event.buildLink(assetId=prc.image_represent,derivative="350x415");
    }
</cfscript>
<cfoutput>
    <div class="col-md-8 col-sm-6" style="order:#prc.layout#;">
        <hr class="space visible-sm" />
        <div class="title-base text-left">
            <hr />
            <h2>#args.name#</h2>
            <p>#sub_title#</p>
        </div>
        <p>
            #args.description_short#
        </p>
        <hr class="space s">
        <div class="grid-list gallery">
            <div class="grid-box row" data-lightbox-anima="fade-left">
                <cfloop list="#args.images#" index="res">
                    <cfscript>
                        img = "/assets/HTWF/images/gallery/image-2.jpg";
                        if(!isEmpty(res)){
                            img = event.buildLink(assetId=res,derivative="800x450");
                        }
                    </cfscript>
                    <div class="grid-item col-md-3 col-sm-4">
                        <a class="img-box i-center" href="#img#">
                            <i class="fa fa-camera"></i>
                            <img src="#img#" alt="">
                        </a>
                    </div>
                </cfloop>
            </div>
        </div>
        <hr class="space m">
        <a href="##" class="circle-button btn btn-sm">View details</a><span class="space"></span>
        #renderLink( id=contact_link,
				body="Contact us",
				class="btn-text"
        )#
    </div>
    <div class="col-md-4 col-sm-6 text-right" data-anima="fade-right">
        <hr class="space">
        <img src="#image_represent#" alt="">
    </div>
</cfoutput>


