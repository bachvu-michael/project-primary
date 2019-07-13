/**
 * @singleton
 */
component {

// CONSTRUCTOR
	/**
	 * @googleAnalyticsReportingApiWrapper.inject 	googleAnalyticsReportingApiWrapper
	 * @pageDao.inject								presidecms:object:page
	 * @systemConfigurationService.inject 			systemConfigurationService
	 */
	public any function init(
		required any googleAnalyticsReportingApiWrapper,
		required any pageDao,
		required any systemConfigurationService
	) {

		_setGoogleAnalyticsReportingApiWrapper( arguments.googleAnalyticsReportingApiWrapper );
		_setPageDao( arguments.pageDao );
		_setSystemConfigurationService( arguments.systemConfigurationService );

		return this;
	}

// PUBLIC FUNCTIONS
	public boolean function importPageViews( logger ) {
		var loggerAvailable = structKeyExists( arguments, "logger" );
		var canDebug        = loggerAvailable && arguments.logger.canDebug();
		var canError        = loggerAvailable && arguments.logger.canError();
		var canInfo         = loggerAvailable && arguments.logger.canInfo();

		if ( canInfo ) {
			arguments.logger.info( "Starting import of Google Analytics page views..." );
		}

		var dateRange = _getDateRange();

		if ( canDebug ) {
			arguments.logger.debug( "Using date range: " & serializeJson( dateRange ) );
		}

		var reportResponse = _getGoogleAnalyticsReportingApiWrapper().getReport(
			applicationName  = _getGoogleAnalyticsApplicationName(),
		 	viewId 			 = _getGoogleAnalyticsViewId(),
		 	privateJsonKey	 = _getGoogleAnalyticsPrivateKey(),
			startDate		 = dateRange.start,
			endDate			 = dateRange.end,
		 	metrics			 = [ "ga:pageviews", "ga:uniquepageviews" ],
		 	dimension        = _getDimension(),
			pageSize		 = 10000,
			hideTotals		 = true,
			hideValueRanges	 = true,
			includeEmptyRows = false,
			orderBy			 = "ga:uniquePageviews",
			sortOrder		 = "DESCENDING"
		);

		if ( canDebug ) {
			arguments.logger.debug( serializeJson( reportResponse ) );
		}

		var pageViewImportSuccess = true;

		for ( var pageId in reportResponse ) {
			pageViewImportSuccess = _importPageView(
				pageId=pageId,
				pageViews=reportResponse[ pageId ].pageViews ?: 0,
				uniquePageViews=reportResponse[ pageId ].uniquePageViews ?: 0,
				logger=arguments.logger ?: nullValue()
			);

			if ( !pageViewImportSuccess ) {
				if ( canError ) {
					arguments.logger.error( "Error during import of Google Analytics page views for pageID = '#pageId#'" );
					arguments.logger.warn( "Task completed with errors." );
				}
				// TODO: error or not?!?
				return false;
			}
		}

		if ( canInfo ) {
			arguments.logger.info( "Import of Google Analytics page views completed." );
		}

		return true;
	}

// PRIVATE HELPERS
	private boolean function _importPageView(
		required string pageId,
		required numeric pageViews,
		required numeric uniquePageViews,
		logger
	) {
		var loggerAvailable = structKeyExists( arguments, "logger" );
		var canDebug        = loggerAvailable && arguments.logger.canDebug();
		var canError        = loggerAvailable && arguments.logger.canError();
		var canInfo         = loggerAvailable && arguments.logger.canInfo();

		var page = _getPageDao().selectData( id=arguments.pageId, selectFields=[ "id", "title", "slug"] );

		if ( canDebug ) {
			arguments.logger.debug( serializeJson( page ) );
		}

		if ( page.recordCount eq 0 ) {
			if ( canError ) {
				arguments.logger.warn( "Page not found - PageId='#arguments.pageId#'" );
			}
			return false;
		}

		_getPageDao().updateData(
			id=arguments.pageId,
			data={
				page_views=arguments.pageViews,
				unique_page_views=arguments.uniquePageViews
			}
		);

		if ( canInfo) {
			arguments.logger.info( "Page '#page.title#' (id='#arguments.pageId#') updated: pageviews=#arguments.pageViews#, uniquepageviews=#arguments.uniquePageViews#" );
		}

		return true;
	}

	private struct function _getDateRange() {

		var dateRangeValue = _getGoogleAnalyticsDateRangeValue();
		var dateRangeUnit  = _getGoogleAnalyticsDateRangeUnit(); // day, week, month, year

		var today = dateFormat( now(), "yyyy-mm-dd" );
		var days = 0;

		// for simplicity this is not accurate right now, maybe differ semantically, e.g. data from this month, not 30 days
		if ( dateRangeUnit eq "day" ) {
			days = dateRangeValue;
		}
		else if ( dateRangeUnit eq "week" ) {
			days = dateRangeValue * 7;
		}
		else if ( dateRangeUnit eq "month" ) {
			days = dateRangeValue * 30;
		}
		else if ( dateRangeUnit eq "year" ) {
			days = dateRangeValue * 365;
		}
		
		return { start=dateFormat( dateAdd( "d", days * -1, today ), "yyyy-mm-dd" ), end=today };
	}

	private string function _getDimension() {
		return "ga:dimension" & _getGoogleAnalyticsPageIdCustomDimensionIndex();
	}

// GETTERS AND SETTERS
	private any function _getGoogleAnalyticsReportingApiWrapper() {
		return _googleAnalyticsReportingApiWrapper;
	}
	private void function _setGoogleAnalyticsReportingApiWrapper( required any googleAnalyticsReportingApiWrapper ) {
		_googleAnalyticsReportingApiWrapper = arguments.googleAnalyticsReportingApiWrapper;
	}

	private any function _getPageDao() {
		return _pageDao;
	}
	private void function _setPageDao( required any pageDao ) {
		_pageDao = arguments.pageDao;
	}

	private any function _getSystemConfigurationService() {
		return _systemConfigurationService;
	}
	private void function _setSystemConfigurationService( required any systemConfigurationService ) {
		_systemConfigurationService = arguments.systemConfigurationService;
	}

	private string function _getGoogleAnalyticsApplicationName() {
		return _getSystemConfigurationService().getSetting( "analytics_import", "application_name", "" );
	}

	private string function _getGoogleAnalyticsViewId() {
		return _getSystemConfigurationService().getSetting( "analytics_import", "view_id", "" );
	}

	private string function _getGoogleAnalyticsPrivateKey() {
		return _getSystemConfigurationService().getSetting( "analytics_import", "private_key", "" );
	}

	private numeric function _getGoogleAnalyticsPageIdCustomDimensionIndex() {
		return _getSystemConfigurationService().getSetting( "analytics_import", "page_id_custom_dimension_index", 1 );
	}

	private numeric function _getGoogleAnalyticsDateRangeValue() {
		return _getSystemConfigurationService().getSetting( "analytics_import", "date_range_value", 1 );
	}

	private string function _getGoogleAnalyticsDateRangeUnit() {
		return _getSystemConfigurationService().getSetting( "analytics_import", "date_range_unit", "month" );
	}
}