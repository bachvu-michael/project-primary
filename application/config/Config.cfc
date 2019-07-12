component extends="preside.system.config.Config" {

	public void function configure() {
		super.configure();

		settings.preside_admin_path  = "mbadmin";
		settings.system_users        = "sysadmin";
		settings.default_locale      = "en";

		settings.default_log_name    = "ielts4chance";
		settings.default_log_level   = "information";
		settings.sql_log_name        = "ielts4chance";
		settings.sql_log_level       = "information";

		settings.ckeditor.defaults.stylesheets.append( "css-core-google-font" );
		settings.ckeditor.defaults.stylesheets.append( "css-core-bootstrap"   );
		settings.ckeditor.defaults.stylesheets.append( "/css/core/" 		  );

		settings.features.websiteUsers.enabled = true;
	}

	private struct function _getConfiguredAssetDerivatives() {
		var derivatives  = super._getConfiguredAssetDerivatives();

		derivatives.headerLogo = {
			  permissions = "inherit"
			, transformations = [
				  { method="Resize", args={ height=100, maintainaspectratio=true } }
			  ]
		};
		derivatives.280x360 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=280, height=360, maintainaspectratio=true } } ]
		 };

		 derivatives.1920x650 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=1920, height=650, maintainaspectratio=true } } ]
		 };
		 derivatives.275x155 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=275, height=155, maintainaspectratio=true } } ]
		 };
		 derivatives.350x415 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=350, height=415, maintainaspectratio=true } } ]
		 };
		 derivatives.800x450 = {
			permissions     = "inherit"
		  , transformations = [ { method="resize", args={ width=800, height=450, maintainaspectratio=true } } ]
		 };


		return derivatives;
	}
}
