
<cfparam name="args.teaser" default="" />
<cfparam name="args.main_image"             default="" />
<cfparam name="args.main_content"              default="" />
<cfparam name="args.id"              default="" />
<cfparam name="args.title"              default="" />
<cfparam name="args.slug"              default="" />
<cfparam name="args.parent_slug"             field="parent_page.slug" />
<cfparam name="args.group_item"              default="" />

<cfscript>
    link = "#args.parent_slug#/#args.slug#.html"
    img = "/assets/img/gallery/image-6.jpg";
    if(!isEmpty(args.main_image)){
        img = event.buildLink(assetId=args.main_image,derivative="165x130");
    }
    classGroup ="";
    if(args.group == 1){
        if(!isEmpty(args.group_item)){
            classGroup = renderView(
                view          = "/general/_group_item_class"
                , presideObject = "group_item"
                , filter        = { id=listToArray( args.group_item ) }
                , orderBy       = "FIELD( id, #listqualify( args.group_item, "'" )# )"
            );
        }
    }
</cfscript>

<cfoutput>
    <div data-sort="1" class="maso-item col-md-6 #classGroup#">
        <div class="advs-box advs-box-side" data-anima="fade-left">
            <div class="row">
                <div class="col-md-4">
                    <div class="img-box small-img-box"><img src="#img#" alt=""></div>
                </div>
                <div class="col-md-8">
                    <cfif !isEmpty(args.title)>
                        <h3>#args.title#</h3>
                    </cfif>
                    <cfif !isEmpty(args.teaser)>
                        #renderContent( "richeditor", args.teaser )#
                    </cfif>
                    <br>
                    <a class="btn-text"  href="#link#">Read more</a>
                </div>
            </div>
        </div>
    </div>
</cfoutput>
