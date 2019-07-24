<cfparam name="args.title"  default="##fff" />
<cfparam name="args.sub_title"  default="" />
<cfparam name="args.img"  default="" />
<cfparam name="args.link"  default="" />
<cfscript>
    img = '/assets/template/images/gallery/square-1.jpg';
    if(!isEmpty(args.img)){
        img = event.buildLink(assetId=args.img,derivative="360x360");
    }
    link = event.buildLink( linkTo=args.link );

</cfscript>
<cfoutput>
        <div class="col-md-4">
            <a class="img-box adv-circle circle adv-circle-center show" data-anima="fade-in" data-trigger="hover" href="##">
                <i class="im-geo2-star anima"></i>
                <img alt="#args.title#" src="#img#">
                <div class="caption">
                    <h2>#args.title#</h2>
                    <p>#args.sub_title#</p>
                </div>
            </a>
        </div>
</cfoutput>