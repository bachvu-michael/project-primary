



<cfparam name="args.background_color"  default="fff" />
<cfparam name="args.content"  default="" />
<cfscript>
	event.include( assetId="jq-contact" ,group="botJs" );
</cfscript>
<cfoutput>
    <div class="section-bg-color bg-color white" style="background-color:#args.background_color#;">
        <div class="container content">
            <div class="row vertical-row">
                <div class="col-md-6">
                    <form id="contact-form" action="" class="form-box form-ajax form-inline white" method="post">
                        <input id="email" name="email" placeholder="Type your email" type="email" class="form-control form-value" required="true">
                        <hr class="space m">
                        <input id="phone" name="phone" placeholder="Type your phone number" type="number" class="form-control form-value" required="true">
                        <hr class="space m">
                        <button class="btn btn-sm" type="submit">Contact now</button>
                        <hr class="space m">
                        <div class="success-box" id="success">
                            <div class="alert alert-success">Congratulations. Your message has been sent successfully</div>
                        </div>
                        <div class="error-box" id="error">
                            <div class="alert alert-warning">Error, please retry. Your message has not been sent</div>
                        </div>
                    </form>
                </div>
                <div class="col-md-6">
                    <p class="text-s">
                        #args.content#
                    </p>
                </div>
            </div>
        </div>
    </div>
</cfoutput>