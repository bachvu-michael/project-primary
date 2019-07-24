
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
        img = event.buildLink(assetId=args.main_image,derivative="services_item");
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
    <div data-sort="1" class="maso-item col-md-4 col-sm-6 #classGroup#">
        <div class="advs-box advs-box-multiple boxed-inverse" data-anima="scale-up" data-trigger="hover">

            <a class="img-box" href="#link#"><img class="anima" src="#img#" alt="image detail" /></a>

            <div class="advs-box-content">
                <cfif !isEmpty(args.title)>
                    <h3>#args.title#</h3>
                </cfif>
                <cfif !isEmpty(args.teaser)>
                    #renderContent( "richeditor", args.teaser )#
                </cfif>
                <br>
                <a class="btn-text" href="#link#">Enter now </a>
            </div>
        </div>
    </div>
</cfoutput>
