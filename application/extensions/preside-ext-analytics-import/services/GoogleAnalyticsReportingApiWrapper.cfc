/**
 * @singleton
 */
component {

// CONSTRUCTOR
	public any function init() {

		variables.javaloaderName = "google_analytics_import_javaloader_" & hash( getCurrentTemplatePath() );
		variables.javaloaderLibPaths = directoryList(expandPath("/app/extensions/preside-ext-analytics-import/lib"));

		return this;
	}

// PUBLIC FUNCTIONS
	public struct function getReport(
		required string applicationName, // aka property name
		required string viewId, // aka profileId
		required string privateJsonKey,
		required date startDate,
		required date endDate,
		required array metrics, // e.g. ga:pageviews or ga:uniquepageviews
		required string dimension, // currently we only support one single dimension, e.g. ga:dimension1 or ga:browser
		numeric pageSize=1000,  // max=10000
		boolean hideTotals=false,
		boolean hideValueRanges=false,
		boolean includeEmptyRows=false,
		string filterExpression="", // for filter expressions see: https://developers.google.com/analytics/devguides/reporting/core/v3/reference#filters
		string orderBy="",
		string sortOrder="ASCENDING" // or DESCENDING
	) {

		var analyticsReporting = _getAnalyticsReporting( arguments.applicationName, arguments.privateJsonKey );

		var loader = _getJavaLoader();

		var dateRange = loader.create("com.google.api.services.analyticsreporting.v4.model.DateRange").init();
		dateRange.setStartDate( arguments.startDate );
		dateRange.setEndDate( arguments.endDate );

		var metricObjects = [];
		var metricObject = 0;

		for (var metric in arguments.metrics) {
			metricObject = loader.create("com.google.api.services.analyticsreporting.v4.model.Metric").init();
		    metricObject.setExpression( metric );
		    metricObject.setAlias( listLast( metric, ":" ) ); // e.g. ga:pageviews > pageviews
		 	metricObjects.append(metricObject);
		}

		var dimension = loader.create("com.google.api.services.analyticsreporting.v4.model.Dimension").init();
	    dimension.setName( arguments.dimension );

		var reportRequest = loader.create("com.google.api.services.analyticsreporting.v4.model.ReportRequest").init();

	    reportRequest.setViewId( arguments.viewId );
	    reportRequest.setDateRanges( [ dateRange ] );
	    reportRequest.setDimensions( [ dimension ] );
	    reportRequest.setMetrics( metricObjects );
	    reportRequest.setPageSize( arguments.pageSize );
	    reportRequest.setHideTotals( arguments.hideTotals );
	    reportRequest.setHideValueRanges( arguments.hideValueRanges );
	    reportRequest.setIncludeEmptyRows( arguments.includeEmptyRows );

	    if ( len( arguments.filterExpression ) gt 0 ) {
			reportRequest.setFiltersExpression( arguments.filterExpression );
	    }

	    if ( len( arguments.orderBy ) gt 0 ) {
		    var orderBy = loader.create("com.google.api.services.analyticsreporting.v4.model.OrderBy").init();
		    orderBy.setFieldName( arguments.orderBy );
		    if ( arguments.sortOrder eq "DESCENDING" ) {
		    	orderBy.setSortOrder("DESCENDING");
		    }
		    reportRequest.setOrderBys([orderBy]);
	    }

		var getReport = loader.create("com.google.api.services.analyticsreporting.v4.model.GetReportsRequest").init();
	    getReport.setReportRequests([reportRequest]);

	    var response = analyticsReporting.reports().batchGet(getReport).execute();

	    return _buildResult(response);
	}

// PRIVATE HELPERS
	private any function _getAnalyticsReporting(
		required string applicationName, // aka property name
		required string privateJsonKey
	) {

		var loader = _getJavaLoader();

		var privateJsonKeyStream 	  = createObject( "java", "org.apache.commons.io.IOUtils" ).toInputStream( arguments.privateJsonKey );

		var GoogleCredential 		  = loader.create( "com.google.api.client.googleapis.auth.oauth2.GoogleCredential" );
		var GoogleNetHttpTransport 	  = loader.create( "com.google.api.client.googleapis.javanet.GoogleNetHttpTransport" );
		var GsonFactory 			  = loader.create( "com.google.api.client.json.gson.GsonFactory" );
		var AnalyticsReportingScopes  = loader.create( "com.google.api.services.analyticsreporting.v4.AnalyticsReportingScopes" );
		var Collections 			  = loader.create( "java.util.Collections" );

		var httpTransport 			  = GoogleNetHttpTransport.newTrustedTransport();
		var JSON_FACTORY 			  = GsonFactory.getDefaultInstance();
		var credential 				  = GoogleCredential
										.fromStream( privateJsonKeyStream, httpTransport, JSON_FACTORY )
										.createScoped( Collections.singleton( AnalyticsReportingScopes.ANALYTICS_READONLY ) );

		var AnalyticsReportingBuilder = loader.create( "com.google.api.services.analyticsreporting.v4.AnalyticsReporting$Builder" ).init(
			httpTransport,
			JSON_FACTORY,
			credential
		);

		return AnalyticsReportingBuilder.setApplicationName( arguments.applicationName ).build();
	}

	private struct function _buildResult( required any response ) {

		var result = {};

	    for ( var report in arguments.response.getReports() ) {

	    	var header 			 = report.getColumnHeader();
	    	var dimensionHeaders = header.getDimensions();
	    	var metricHeaders 	 = header.getMetricHeader().getMetricHeaderEntries();
	    	var rows 			 = report.getData().getRows();

	    	if ( isNull( rows ) ) {
	     		break;
	  		}

	  		for ( var row in rows ) {
	  			var dimensions = row.getDimensions();

	  			if ( dimensions.size() neq 1 ) {
	  				continue;
	  			}

	  			var dimension = dimensions.get(0);
				result[ dimension ] = {};

	  			var metrics = row.getMetrics();
	  			if ( metrics.size() neq 1 ) {
	  				continue;
	  			}
	  			var values = metrics.get(0).getValues();

				for ( var j = 0; j < values.size() && j < metricHeaders.size(); j++ ) {
					result[ dimension ][ metricHeaders.get( j ).getName() ] = values.get( j );
				}
	  		}

	    	// we only expect one single report and therefore just break out of the loop
	    	break;
	    }

	    return result;
	}

	private any function _getJavaLoader() {
		if ( !structKeyExists(server, variables.javaloaderName)) {
			lock name="#variables.javaloaderName#_lock" type="exclusive" throwontimeout="true" timeout="30" {
				if ( !structKeyExists(server, variables.javaloaderName)) {
					// there is a javaloader mapping in preside's bootstrap.cfc pointing to the one bundled in coldbox
					server[variables.javaloaderName] = createObject( "javaloader.Javaloader" ).init(variables.javaloaderLibPaths);
				}
			}
		}
		return server[variables.javaloaderName];
	}
}