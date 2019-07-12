
<cfparam name="args.name"      default="" />
<cfparam name="args.images"      default="" />
<cfparam name="args.group_product"      default="" />
<cfparam name="args.price"    type="numeric"  default="" />
<cfparam name="args.description_short"      default="" />
<cfscript>
    img = "/assets/HTWF/images/gallery/image-1.jpg";
    if(!isEmpty(args.images)){
        arr = listToArray(args.images);
        img = event.buildLink(assetId=arr[1],derivative="800x450");
    }
    des = args.description_short.left(50);
    name = args.name.left(50);
    price = args.price/1000;
    unit = "K VND";
    if(args.price >= 1000000){
        price = args.price/1000000;
        unit = "M VND"
    }
</cfscript>
<cfoutput>
    <div data-sort="1" class="maso-item col-md-3 #args.group_product.left(8)#">
        <div class="img-box adv-img adv-img-down-text">
            <a class="img-box img-scale-up lightbox i-center" href="#img#">
                <div class="caption">
                    <i class="fa fa-plus"></i>
                </div>
                <img src="#img#" alt="" />
            </a>
            <div class="caption-bottom">
                <h2><a href="##">#name#</a></h2>
                <p>#des#</p>
                <p>#price# #unit#</p>
            </div>
        </div>
    </div>
</cfoutput>


