component {

	public void function configure( bundle ) {
		// See sticker docs here: http://sticker.readthedocs.org/en/latest/
		bundle.addAsset( id="jq-core-jquery"        , path="/js/lib/jquery-1.10.1.min.js"                           );
		bundle.addAsset( id="jq-core-placeholders"  , path="/js/lib/placeholders.jquery.min.js"                     );
		bundle.addAsset( id="jq-tooltipster"        , path="/js/lib/jquery.tooltipster.min.js"                      );
		bundle.addAsset( id="jq-magnific-popup"     , path="/js/lib/jquery.magnific-popup.min.js"                   );
		bundle.addAsset( id="jq-bxslider"           , path="/js/lib/jquery.bxslider.min.js"                         );
		bundle.addAsset( id="jq-parallax"           , path="/js/lib/parallax.min.js"                                );
		bundle.addAsset( id="js-modernizr"          , path="/js/lib/modernizr-2.6.2.min.js"                         );
		bundle.addAsset( id="js-respond"            , path="/js/lib/respond.js"                                     );

		bundle.addAsset( id="css-core-google-font"  , url="//fonts.googleapis.com/css?family=Roboto:700%2C300%2C300italic%7CNoto+Serif:400%2C700",  type="css"  );
		bundle.addAsset( id="css-core-bootstrap"    , path="/css/lib/bootstrap.min.css"                             );
		bundle.addAsset( id="css-core-icomoon"      , path="/css/lib/icomoon.css"                                   );
		bundle.addAsset( id="css-tooltipster"       , path="/css/lib/tooltipster.css"                               );
		bundle.addAsset( id="css-magnific-popup"    , path="/css/lib/magnific-popup.css"                            );
		bundle.addAsset( id="css-bxslider"          , path="/css/lib/jquery.bxslider.css"                           );
		bundle.addAsset( id="css-ie8"               , path="/css/lib/ie8.css"                                       );

		//template
		bundle.addAsset( id="jq-jquery"       		, path="/HTWF/scripts/jquery.min.js" 							);
		bundle.addAsset( id="jq-script"       		, path="/HTWF/scripts/script.js" 					 			);
		bundle.addAsset( id="jq-bootstrap"       	, path="/HTWF/scripts/bootstrap/js/bootstrap.min.js" 			);
		bundle.addAsset( id="jq-imagesloaded"       , path="/HTWF/scripts/imagesloaded.min.js" 					 	);
		bundle.addAsset( id="jq-parallax"       	, path="/HTWF/scripts/parallax.min.js" 					 		);
		bundle.addAsset( id="jq-flexslider"       	, path="/HTWF/scripts/flexslider/jquery.flexslider-min.js" 		);

		bundle.addAsset( id="jq-isotope"       			, path="/HTWF/scripts/isotope.min.js" , 						async=true			);
		bundle.addAsset( id="jq-progressCounter"       	, path="/HTWF/scripts/jquery.progress-counter.js" , 			async=true			);
		bundle.addAsset( id="jq-tabAccordion"       	, path="/HTWF/scripts/jquery.tab-accordion.js" , 				async=true			);
		bundle.addAsset( id="jq-bootstrapPopover"       , path="/HTWF/scripts/bootstrap/js/bootstrap.popover.min.js" , 	async=true			);
		bundle.addAsset( id="jq-magnificPopup"       	, path="/HTWF/scripts/jquery.magnific-popup.min.js" , 			async=true			);

		bundle.addAsset( id="jq-stream"       		, path="/HTWF/scripts/social.stream.min.js" 					 	);
		bundle.addAsset( id="jq-slimscroll"       	, path="/HTWF/scripts/jquery.slimscroll.min.js" 					);
		bundle.addAsset( id="jq-contact"       		, path="/js/specific/contact/contact.js"							);
		bundle.addAsset( id="jq-googleMap"       	, path="/HTWF/scripts/google.maps.min.js"							);


		bundle.addAsset( id="css-bootstrapCustom"   , path="/HTWF/scripts/bootstrap/css/bootstrap.css"  		,  type="css" );
		bundle.addAsset( id="css-style"      		, path="/HTWF/style.css"  									,  type="css" );
		bundle.addAsset( id="css-contentBox"      	, path="/HTWF/css/content-box.css"  						,  type="css" );
		bundle.addAsset( id="css-imageBox"      	, path="/HTWF/css/image-box.css"  							,  type="css" );
		bundle.addAsset( id="css-animations"      	, path="/HTWF/css/animations.css"  							,  type="css" );
		bundle.addAsset( id="css-components"      	, path="/HTWF/css/components.css"  							,  type="css" );
		bundle.addAsset( id="css-flexslider"      	, path="/HTWF/scripts/flexslider/flexslider.css"  			,  type="css" );
		bundle.addAsset( id="css-magnificPopup"     , path="/HTWF/scripts/magnific-popup.css"  					,  type="css" );
		bundle.addAsset( id="css-stream"      		, path="/HTWF/scripts/social.stream.css"  					,  type="css" );
		bundle.addAsset( id="css-skin"      		, path="/HTWF/skin.css"  									,  type="css" );
		bundle.addAsset( id="css-fontAwesome"      	, path="/HTWF/scripts/font-awesome/css/font-awesome.css"  	,  type="css" );
		bundle.addAsset( id="css-core"      		, path="/css/core/core.css"  								,  type="css" );

		bundle.addAssets(
			  directory   = "/js/"
			, match       = function( path ){ return ReFindNoCase( "_[0-9a-f]{8}\..*?\.min.js$", arguments.path ); }
			, idGenerator = function( path ) {
				return ListDeleteAt( path, ListLen( path, "/" ), "/" ) & "/";
			}
		);

		bundle.addAssets(
			  directory   = "/css/"
			, match       = function( path ){ return ReFindNoCase( "_[0-9a-f]{8}\..*?\.min.css$", arguments.path ); }
			, idGenerator = function( path ) {
				return ListDeleteAt( path, ListLen( path, "/" ), "/" ) & "/";
			}
		);

		bundle.asset( "jq-core-jquery" ).dependents( "jq-*" );
		bundle.asset( "jq-core-placeholders" ).setIE( "lte IE 9" );
		bundle.asset( "js-respond" ).setIE( "lte IE 8" );
		bundle.asset( "/js/core/" ).after( "jq-*", "js-*" );

		bundle.asset( "css-core-google-font" ).dependents( "css-*" );
		bundle.asset( "css-core-bootstrap" ).before( "css-*" );
		bundle.asset( "/css/core/" ).after( "css-*" ).dependents( "/css/specific/*" );
		bundle.asset( "css-ie8" ).after( "/css/core/" ).setIE( "lte IE 8" );

		// maginific-popup bundle -- just include "/js/specific/maginific-popup/" on specific pages
		bundle.asset( "jq-magnific-popup" ).dependsOn( "css-magnific-popup" );
		bundle.asset( "/js/specific/magnific-popup/" ).dependsOn( "jq-magnific-popup" );

		// tooltipster bundle -- just include "/js/specific/tooltipster/" on specific pages
		bundle.asset( "jq-tooltipster" ).dependsOn( "css-tooltipster" );
		bundle.asset( "/js/specific/tooltipster/" ).dependsOn( "jq-tooltipster" );

		// bxslider bundle -- just include "/js/specific/bxslider/"" on specific pages
		bundle.asset( "jq-bxslider" ).dependsOn( "css-bxslider" );
		bundle.asset( "/js/specific/bxslider/" ).dependsOn( "jq-bxslider" );

		bundle.asset( "css-bootstrapCustom" ).before( "*" );
		bundle.asset( "css-style" ).before( "css-skin" );
	}
}