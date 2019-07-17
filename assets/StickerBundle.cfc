/**
 * Sticker bundle configuration file. See: http://sticker.readthedocs.org/
 */
component {

	public void function configure( bundle ) {

		bundle.addAsset( id="jq-jquery"       		, path="/template/scripts/jquery.min.js" 					 );
		bundle.addAsset( id="jq-script"       		, path="/template/scripts/script.js" 					 );

		//////////
		bundle.addAsset( id="css-font-awesome"      , path="/template/scripts/font-awesome/css/font-awesome.css"  ,  type="css" );
		bundle.addAsset( id="css-core"      , path="/css/core/core.css"  ,  type="css" );

        bundle.addAsset(id="jq-imagesloaded",path="/template/scripts/imagesloaded.min.js");
        bundle.addAsset(id="jq-parallax",path="/template/scripts/parallax.min.js");
        bundle.addAsset(id="jq-flexslider",path="/template/scripts/flexslider/jquery.flexslider-min.js");
        bundle.addAsset(id="jq-isotope",path="/template/scripts/isotope.min.js",async="true");
        bundle.addAsset(id="jq-progress-counter",path="/template/scripts/jquery.progress-counter.js",async="true");
        bundle.addAsset(id="jq-tab-accordion",path="/template/scripts/jquery.tab-accordion.js",async="true");
        bundle.addAsset(id="jq-bootstrap-popover",path="/template/scripts/bootstrap/js/bootstrap.popover.min.js",async="true");
        bundle.addAsset(id="jq-magnific-popup",path="/template/scripts/jquery.magnific-popup.min.js",async="true");
        bundle.addAsset(id="jq-social-stream",path="/template/scripts/social.stream.min.js");
		bundle.addAsset(id="jq-slimscroll",path="/template/scripts/jquery.slimscroll.min.js");
		bundle.addAsset(id="jq-google-map",path="/template/scripts/google.maps.min.js");
		bundle.addAsset(id="jq-google-api",url="https://maps.googleapis.com/maps/api/js?sensor=false");
		bundle.addAsset(id="jq-twbsPagination",path="/template/scripts/jquery.twbsPagination.min.js");
		//////////
		bundle.addAssets(
			  directory   = "/"
			, match       = function( filepath ){ return ReFindNoCase( "\.(js|css)$", filepath ); }
			, idGenerator = function( filepath ){
				var fileName = ListLast( filePath, "/" );
				var id       = ListLast( filename, "." ) & "-" & ReReplace( filename, "\.(js|css)$", "" );
				return id;
			  }
		);

		bundle.asset( "css-bootstrap" ).before( "*" );
		bundle.asset( "js-bootstrap" ).dependsOn( "js-jquery" );
		bundle.asset( "jq-google-api" ).dependsOn( "jq-jquery" );
		bundle.asset( "jq-google-map" ).dependsOn( "jq-google-api" );
		
	}

}