

<cfparam name="args.name"      default="" />
<cfparam name="args.images"      default="" />
<cfparam name="args.id"      default="" />

<cfscript>
    detail_link = event.buildLink(page="detailpage",queryString="pId=" & args.id);
    img = "/assets/HTWF/images/gallery/image-2.jpg";
    if(!isEmpty(args.images)){
        img = event.buildLink(assetId=listToArray(args.images)[1],derivative="350x415");
    }
</cfscript>
<cfoutput>
    <hr class="space"/>
    <a href="#detail_link#" class="img-box i-center" >
        <i class="fa fa-camera"></i>
        <img src="#img#" alt="#args.name#">
    </a>
</cfoutput>


