
<cfparam name="args.name"      default="" />
<cfparam name="args.images"      default="" />
<cfparam name="args.group_product"      default="" />
<cfparam name="args.price"    type="numeric"  default="" />
<cfparam name="args.description_short"      default="" />
<cfscript>
    img = "/assets/HTWF/images/gallery/image-1.jpg";
    if(!isEmpty(args.images)){
        arr = listToArray(args.images);
        img = event.buildLink(assetId=arr[1],derivative="275x155");
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
    <div data-sort="0" class="maso-item col-md-3 #args.group_product.left(8)#">
        <div class="advs-box advs-box-multiple boxed-inverse" data-anima="scale-up" data-trigger="hover">
            <a class="img-box"><img class="anima" src="#img#" alt="" /></a>
            <div class="circle anima">#price#<span>#unit#</span></div>

            <div class="advs-box-content">
                <h3>#name#</h3>
                <p>
                    #des#
                </p>
            </div>
        </div>
    </div>
</cfoutput>


