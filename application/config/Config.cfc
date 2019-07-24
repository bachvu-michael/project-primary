component extends="preside.system.config.Config" {

	public void function configure() {
		super.configure();
		settings.autoSyncDb = true;
		settings.preside_admin_path  = "adminie";
		settings.system_users        = "sysadmin";
		settings.default_locale      = "en";

		settings.default_log_name    = "ielts4chance";
		settings.default_log_level   = "information";
		settings.sql_log_name        = "ielts4chance";
		settings.sql_log_level       = "information";

		settings.ckeditor.defaults.stylesheets.append( "css-bootstrap" );
		settings.ckeditor.defaults.stylesheets.append( "css-layout" );

		settings.features.websiteUsers.enabled = true;
		_setupInterceptors();

	}
	private struct function _getConfiguredAssetDerivatives() {
		var derivatives  = super._getConfiguredAssetDerivatives();

		derivatives.280x360 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=280, height=360, maintainaspectratio=true, quality="mediumQuality" } } ]
		 };

		 derivatives.1920x650 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=1920, height=650, maintainaspectratio=true, quality="highQuality" } } ]
		 };
		 derivatives.275x155 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=275, height=155, maintainaspectratio=true, quality="mediumQuality" } } ]
		 };
		 derivatives.350x415 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=350, height=415, maintainaspectratio=true, quality="mediumQuality" } } ]
		 };
		 derivatives.800x450 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=800, height=450, maintainaspectratio=true, quality="highQuality" } } ]
		 };
		 derivatives.900x505 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=900, height=505, maintainaspectratio=true, quality="highQuality" } } ]
		 };
		 derivatives.800x500 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=800, height=500, maintainaspectratio=true, quality="highQuality" } } ]
             };
             derivatives.175x100 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=175, height=100, maintainaspectratio=true, quality="highQuality" } } ]
             };
             derivatives.360x360 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=360, height=360, maintainaspectratio=true, quality="highQuality" } } ]
             };
             
             


            derivatives.table_of_content = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=300, height=200, maintainaspectratio=true } }
                  ]
            };
            derivatives.table_of_content_small = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=84, height=56, maintainaspectratio=true } }
                  ]
            };
            derivatives.card = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=286, height=180, maintainaspectratio=true } }
                  ]
            };
            derivatives.square200 = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=200, height=200, maintainaspectratio=true } }
                  ]
            };
            derivatives.square50 = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=50, height=50, maintainaspectratio=true } }
                  ]
            };
            derivatives.square60 = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=60, height=60, maintainaspectratio=true } }
                  ]
            };
            derivatives.masonry = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=500, maintainaspectratio=true } }
                  ]
            };
            derivatives.feature = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=450, maintainaspectratio=true } }
                  ]
            };
            //start page
            derivatives.banner = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=1263,height=810, maintainaspectratio=true } }
                  ]
            };
            derivatives.banner_detail = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=1920,height=650, maintainaspectratio=true } }
                  ]
            };
            derivatives.girl_4 = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=800,height=450, maintainaspectratio=true } }
                  ]
            };
            derivatives.customer_review = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=100,height=100, maintainaspectratio=true } }
                  ]
            };
            derivatives.features_home = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=600,height=500, maintainaspectratio=true } }
                  ]
            };
            derivatives.try_box = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=1920, height=850,maintainaspectratio=true } }
                  ]
            };
            derivatives.about_1_1 = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=500, height=700,maintainaspectratio=true } }
                  ]
            };
            derivatives.about_1_2 = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=500, height=362,maintainaspectratio=true } }
                  ]
            };
            derivatives.about_1_3 = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=1000, height=500,maintainaspectratio=true } }
                  ]
            };
            derivatives.about_2 = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=900, height=506,maintainaspectratio=true } }
                  ]
            };
            derivatives.about_team = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=450,height=450, maintainaspectratio=true } }
                  ]
            };
            derivatives.services_item = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=370,height=210, maintainaspectratio=true } }
                  ]
            };
            derivatives.165x130 = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=165,height=130, maintainaspectratio=true } }
                  ]
            };
            derivatives.420x230 = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ width=420,height=230, maintainaspectratio=true } }
                  ]
            };
            derivatives.logo_company_relationship = {
                  permissions = "inherit"
                  , transformations = [
                        { method="Resize", args={ height=100, maintainaspectratio=true } }
                  ]
            };


		return derivatives
	}
	private void function _setupInterceptors(){
		_getConfiguredAssetDerivatives();
	}
}
