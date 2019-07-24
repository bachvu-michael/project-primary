

<cfparam name="args.background_color"       default="" />
<cfparam name="args.products"               default="" />
<cfparam name="args.sub_title"              default="" />
<cfparam name="args.title"                  default="" />
<cfparam name="args.description"            default="" />
<cfparam name="args.contact_link"           default="" />
<cfparam name="args.layout"                 default="" />

<cfscript>
    //dump(args.products);abort;
    products = "";
    productFirst = "";
    if(!isEmpty(args.products)){
        products = listToArray( args.products );
        productFirst = products[1];
        products = products.deleteAt(1);
    }
</cfscript>
<cfoutput>
    <div class="section-empty no-paddings-y" style="background-color:#args.background_color#;">
        <div class="container content">
            <div class="row vertical-row">
                <div class="col-md-8 col-sm-6" style="order:#args.layout#;">
                    <hr class="space visible-sm" />
                    <div class="title-base text-left">
                        <hr />
                        <h2>#args.title#</h2>
                        <p>#args.sub_title#</p>
                    </div>
                    <p>
                        #args.description#
                    </p>
                    <hr class="space s">
                    <div class="grid-list">
                        <div class="grid-box row" data-lightbox-anima="fade-left">
                            <cfif !isEmpty(products)>
                                #renderView(
                                    view          = "/widgets/info_1/_item"
                                  , presideObject = "product"
                                  , filter        = { id= products }
                                  , orderBy       = "FIELD( id, #listqualify( products.toList(), "'" )# )"
                                )#
                            </cfif>
                        </div>
                    </div>
                    <hr class="space m">
                    #renderLink( id= args.contact_link,
                            class="circle-button btn btn-sm",
                            target="_blank"
                    )#
                </div>
                <div class="col-md-4 col-sm-6 text-right" data-anima="fade-right">
                    <cfif !isEmpty(productFirst)>
                        #renderView(
                            view          =  "/widgets/info_1/_item_first"
                          , presideObject = "product"
                          , filter        = { id=listToArray( productFirst ) }
                          , orderBy       = "FIELD( id, #listqualify( productFirst, "'" )# )"
                        )#
                    </cfif>
                </div>
            </div>
        </div>
    </div>
</cfoutput>