

<cfparam name="args.name"      default="" />
<cfparam name="args.images"      default="" />
<cfparam name="args.id"      default="" />

<cfscript>
    detail_link = event.buildLink(page="detailpage",queryString="pId=" & args.id);
    img = "/assets/HTWF/images/gallery/image-2.jpg";
    if(!isEmpty(args.images)){
        img = event.buildLink(assetId=listToArray(args.images)[1],derivative="175x100");
    }
</cfscript>
<cfoutput>
    <div class="grid-item col-md-3 col-sm-4">
        <a class="img-box i-center" href="#detail_link#" target="_blank">
            <i class="fa fa-camera"></i>
            <img src="#img#" alt="#args.name#">
        </a>
    </div>
</cfoutput>


