<cfscript>
    site           = event.getSite()     ?: {};
    footer_title = site.footer_title;
    footer_content = site.footer_content;
    footer_facebook = site.footer_facebook;
    footer_youtube = site.footer_youtube;
</cfscript>
<cfoutput>
	<footer class="footer-minimal">
        <div class="content">
            <div class="container">
                <div class="row footer-main">
                    <h5 class="footer-title">#footer_title#</h5>
                    <hr class="space s" />
                    #footer_content#
                    <hr class="space xs" />
                    <div class="btn-group navbar-social">
                        <div class="btn-group social-group">
                            #renderLink( id=footer_facebook,
                                            body="<i class='fa fa-facebook'></i>",
                                            target="_blank"

                            )#
                            #renderLink( id=footer_youtube,
                                            body="<i class='fa fa-youtube'></i>",
                                            target="_blank"
                            )#
                        </div>
                    </div>
                </div>
                <div class="row copy-row">
                    <div class="col-md-12 copy-text">
                        <div class="tag-row">
                            <span>© MAKE BY MAYSOFT</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</cfoutput>