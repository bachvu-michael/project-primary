<cfparam name="args.icon"      default="fa-vcard-o" />
<cfparam name="args.content"   default="" />   
<cfparam name="args.link"      default="" />   
<cfparam name="args.img"       default="" />   
<cfscript>
    img = "/assets/template/images/gallery/image-1.jpg";
    if(!isEmpty(args.img)){
        img = event.buildLink(assetId=args.img,derivative="360x360");
    }
    link = "";
    if(!isEmpty(args.link)){
        link = event.buildLink(linkTo=args.link);
    }
</cfscript>
<cfoutput>
    <li>
        <div class="advs-box advs-box-multiple boxed-inverse" data-anima="scale-rotate" data-trigger="hover">
            <a class="img-box" href="#link#"><img class="anima" src="#img#" alt="" /> </a>
            <div class="circle anima-rotate-20 anima"><i class="fa #args.icon#"></i></div>
            <div class="advs-box-content">
                #args.content#
                #renderLink( id=args.link,
				    class="btn btn-sm"
                )#
            </div>
        </div>
    </li>
</cfoutput>