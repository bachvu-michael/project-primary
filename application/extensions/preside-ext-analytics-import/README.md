# PresideCMS Extension: Import Google Analytics Reporting data into PresideCMS

This is an extension for [PresideCMS](https://www.presidecms.com) that provides the ability to to import pageview data into the database.
It extends your google analytics tracking by transmitting the preside page object id. Furthermore pageviews and uniquepageviews are imported from google and attached to custom page properties in the database.
How you use the data is up to you. Example use case could be to find out the most viewed pages.

	top10MostViewedPages = presideObjectService.selectData(
		objectName="page",
		savedFilters=[ "livepages" ],
		orderBy="page_views desc",
		maxRows=10
	);

The extension depends on the Preside Task Manager which is part of version 10.7.0. It configures a scheduled task that runs only if the Task Manager extension is present.
However it is also possible to directly perform the import. Implementation of a caller is then up to you.
	
	googleAnalyticsPageViewImporter.importPageViews();

## Configuration / Implementation

### System Settings

There is a new custom system settings screen available. In the Preside Admin go to:
	
	System > Settings > Google Analytics Reporting Import

Here it is required to define several settings. To setup analytics go to [Google Analytics](https://analytics.google.com).
There you will get the tracking ID.
Then you need an account for the [Google Developer Console](https://console.developers.google.com)
Within the console, setup an application, enable the Reporting API V4 and create a service account with a JSON key.

Add the generated service account email address from the developer console to the google analytics admin and give it read+analyze permission.
In addition create a custom dimension - named pageid - in the google analytics admin. Take note of the index that has been used. If it's the first custom dimension,
then the index will be 1. You are allowed to use 20 custom dimensions.

Within the Preside System settings you will need to enter the following properties

* Google Analytics Tracking ID
* Google Analytics Application Name (sometimes also referred to as Property Name, get it from the Analytics Admin screen where it says 'Property settings' > Property Name)
* Google Analytics View Id (sometimes also labelled Profile Id, get it from the Analytics Admin screen where it says 'View settings')
* Private JSON key (download it after creation of a service account in JSON format)
* Custom Dimension index (use the index of the custom dimension that you defined in the google analytics admin)
* Date Range Value + unit: this defines the date range that is imported (Be aware that the page views of the page object are always overwritten)

2 different use cases for the date range:
If you want to always use the overall page views, then pick a couple of years as the date range.
If you want to know what recently has had the most views, pick a short period, e.g. 1 week or 1 month.

The private JSON key should look something like this

	{
		"type": "service_account",
  		"project_id": "YOUR-PROJECT-NAME",
  		"private_key_id": "PRIVATE_KEY_ID",
		"private_key": "-----BEGIN PRIVATE KEY-----\n XXXXXXXX -----END PRIVATE KEY-----\n",
		"client_email": "YOUR-SERVICE-ACCOUNT@YOUR-PROJECT-NAME.iam.gserviceaccount.com",
		"client_id": "1234567789",
		"auth_uri": "https://accounts.google.com/o/oauth2/auth",
		"token_uri": "https://accounts.google.com/o/oauth2/token",
		"auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
		"client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/sdsdfasdf%asdfasdf.iam.gserviceaccount.com"
	}

### Tracking

Within your main layout file, e.g. in /app/layouts/main.cfm you need to include the following before the closing html body tag.

	#renderViewlet( event="googleanalytics.tracking" )#

## Installation

Install the extension to your application via either of the methods detailed below (Git submodule / CommandBox) and then enable the extension by opening up the Preside developer console and entering:

    extension enable preside-ext-analytics-import
    reload all

### Git Submodule method

From the root of your application, type the following command:

    git submodule add https://bitbucket.org/jjannek/preside-ext-analytics-import.git application/extensions/preside-ext-analytics-import

### CommandBox (box.json) method

From the root of your application, type the following command:

    box install preside-ext-analytics-import

## Dependencies

The extension uses the Google Analytics Reporting API V4 which you can find [here](https://developers.google.com/analytics/devguides/reporting/core/v4/)
The Javadocs are [here](https://developers.google.com/resources/api-libraries/documentation/analyticsreporting/v4/java/latest/)
The required libs from the Java package are stored beneath /lib.
In addition the project makes use of Mark Mandel's [JavaLoader](https://github.com/markmandel/JavaLoader). This is not bundled but installed via CommandBox.
It should be under /externals/javaloader. If this is not the case, go to the extension's root folder and do

	box package install

## Future stuff

There are several more use cases for the reporting API. The service component could be made more generic. Realtime data could be consumed, e.g. display graphs, etc.
Furthermore it would be good if it was possible to set up the whole google analytics / dev console stuff in an easier way. Still investigating on this one.

## Contribution

Feel free to fork and pull request. Any other feedback is also welcome - preferable on the PresideCMS slack channel.