<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />
<cfscript>
	event	.include("jq-google-map");
</cfscript>
<cfoutput>
	#args.main_content#
	<div class="section-empty">
        <div class="container content">
            <div class="row">
                <div class="col-md-8 col-center text-center">
                    <div class="google-map" data-marker-pos-left="15" data-coords="40.741895,-73.989308" data-skin="gray" data-marker="http://templates.framework-y.com/yellowbusiness/images/marker-map.png"></div>
                    <hr class="space" />
                    <h2 class="">Contact us now</h2>
                    <p class="text-color no-margins">We are live 24/7 and reply withi 48 hours.</p>
                    <hr class="space s" />
                    <p>
                        Tincidunt integer eu augue augue nunc elit doloro luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit
                        vehicula utlaoreet acaliquam sit amet justo nunc tempor metus velo.
                    </p>
                    <hr class="space s" />
                   <p class="">19 Bertley Street, Los Angeles, United States<br />(123) 123-455669 or (123) 123-455699<br />info@company.com</p> 
                    <hr class="space m" />
                    <form action="/" class="form-box form-ajax" method="post">
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
                                <input id="phone" name="phone" placeholder="" type="text" class="form-control form-value">
                            </div>
                        </div>
                        <hr class="space xs" />
                        <div class="row">
                            <div class="col-md-12">
                                <p>Your message</p>
                                <textarea id="messagge" name="messagge" placeholder="" class="form-control form-value" required></textarea>
                                <hr class="space s" />
                                <a class="anima-button btn-sm btn"><i class="fa fa-send-o"></i>Send messagge</a>
                            </div>
                        </div>
                        <div class="success-box">
                            <div class="alert alert-success">Congratulations. Your message has been sent successfully</div>
                        </div>
                        <div class="error-box">
                            <div class="alert alert-warning">Error, please retry. Your message has not been sent</div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
	</div>
	
</cfoutput>