<cfparam name="args.title"        type="string" field="page.title"        editable="true" />
<cfparam name="args.main_content" type="string" field="page.main_content" editable="true" />
<cfscript>
    event.include( assetId="jq-contact" ,group="botJs" );
</cfscript>
<cfoutput>
    <div class="section-empty">
        <div class="container content" style="padding-top: 10px;">
            <div class="row">
                <div class="col-md-8 col-center text-center">
                    <div class="google-map" data-marker-pos-left="15" data-coords="10.849829,106.753292" data-skin="gray" data-marker="http://templates.framework-y.com/yellowbusiness/images/marker-map.png"></div>
                    <hr class="space" />
                    #args.main_content#
                    <form action="/" class="form-box form-ajax" method="post" id="contact-form">
                        <div class="row">
                            <div class="col-md-4">
                                <p>Your name</p>
                                <input id="name" name="name" placeholder="" type="text" class="form-control form-value" required>
                            </div>
                            <div class="col-md-4">
                                <p>Email</p>
                                <input id="email" name="email" placeholder="" type="email" class="form-control form-value" required>
                            </div>
                            <div class="col-md-4">
                                <p>Phone number</p>
                                <input id="phone" name="phone" placeholder="" type="text" class="form-control form-value" required>
                            </div>
                        </div>
                        <hr class="space xs" />
                        <div class="row">
                            <div class="col-md-12">
                                <p>Your message</p>
                                <textarea id="messagge" name="messagge" placeholder="" class="form-control form-value" required></textarea>
                                <hr class="space s" />
                                <button class="anima-button btn-sm btn" type="submit"><i class="fa fa-send-o"></i> Send messagge</button>
                            </div>
                        </div>
                        <hr class="space xs" />
                        <div class="success-box" id="success">
                            <div class="alert alert-success">Congratulations. Your message has been sent successfully</div>
                        </div>
                        <div class="error-box" id="error">
                            <div class="alert alert-warning">Error, please retry. Your message has not been sent</div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <cfscript>
        event.include( assetId="jq-googleMap" ,group="botJs" );
    </cfscript>
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
</cfoutput>