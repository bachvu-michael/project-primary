component {
	property name="googleAnalyticsPageViewImporter" inject="googleAnalyticsPageViewImporter";

	/**
	 * Imports page views from Google Analytics.
	 *
	 * @displayName Google Analytics Pageview import
	 * @schedule    0 *\/20 * * * *
	 * @priority    10
	 * @timeout     600
	 */
	private boolean function importPageViews( event, rc, prc, logger ) {
		return googleAnalyticsPageViewImporter.importPageViews( arguments.logger ?: NullValue() );
	}
}