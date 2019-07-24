
<cfparam name="args.teaser"                 default="" />
<cfparam name="args.main_image"             default="" />
<cfparam name="args.main_content"           default="" />
<cfparam name="args.id"                     default="" />
<cfparam name="args.title"                  default="" />
<cfparam name="args.slug"                   default="" />
<cfparam name="args.parent_slug"            field="parent_page.slug" />


<cfscript>
    link = "#args.parent_slug#/#args.slug#.html"
    img = "/assets/img/gallery/image-6.jpg";
    if(!isEmpty(args.main_image)){
        img = event.buildLink(assetId=args.main_image,derivative="420x230");
    }
      title = args.title;
        if(args.title.len()>58){
            title = args.title.left(55) & "...";
        }
        teaser = "";
        if( !isEmpty(args.teaser) ){
            teaser = args.teaser;
            if(args.teaser.len()>83){
                teaser = args.teaser.left(80) & "...";
            }
        }

</cfscript>

<cfoutput>

    <div class="grid-item col-md-4">
        <div class="advs-box advs-box-top-icon-img niche-box-post boxed-inverse" data-anima="scale-rotate" data-trigger="hover">
            <div class="block-infos">
                <a class="block-comment" href="##">2 <i class="fa fa-comment-o"></i></a>
            </div>
            <a class="img-box" href="#link#"><img class="anima" src="#img#" alt="#args.title#" /></a>
            <div class="advs-box-content" style="min-height:220px;">
                <h2 class="text-m"><a href="#link#">#title#</a></h2>
                <div class="tag-row">
                    <span><i class="fa fa-bookmark"></i> <a href="##">Travel</a></span>
                    <span><i class="fa fa-pencil"></i><a href="##">Admin</a></span>
                </div>
                <p class="niche-box-content">
                    #teaser#
                </p>
            </div>
        </div>
    </div>

</cfoutput>
