

<cfparam name="args.background"     type="string"   default="" />
<cfparam name="args.title"     type="string"   default="" />
<cfparam name="args.description"     type="string"  default="" />
<cfparam name="args.link"     type="string"   default="" />
<cfscript>
    background = event.buildLink(assetId=args.background,derivative="1920x650");
</cfscript>
<cfoutput>
    <li data-slider-anima="fade-left" data-time="1000">
        <div class="section-slide">
            <div class="bg-cover" style="background-image:url('#background#')">
            </div>
            <div class="container content-slide-custom">
                <div class="container-middle">
                    <div class="container-inner text-left">
                        <hr class="space m visible-sm" />
                        <div class="row">
                            <div class="col-md-9 anima">
                                <h1>
                                    #args.title#
                                </h1>
                                <p>
                                    #args.description#
                                </p>
                                <hr class="space s" />
                            </div>

                            <div class="col-md-3">
                                <hr class="space s" />
                                <cfif !isEmpty(args.link)>
                                    <cfsavecontent variable="content">
                                        <i class="fa fa-folder-open"></i>services
                                    </cfsavecontent>
                                    #renderLink( id=args.link,
                                                body=content,
                                                class="btn btn-lg btn-border")#
                                </cfif>
                            </div>
                        </div>
                        <hr class="space visible-sm" />
                    </div>
                </div>
            </div>
        </div>
    </li>
</cfoutput>


