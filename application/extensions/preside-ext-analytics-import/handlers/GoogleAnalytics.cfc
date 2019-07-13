component {
	public string function tracking( event, rc, prc, args={} ) {
		return renderView(
			view="googleanalytics/tracking",
			args={
				trackingId=getSystemSetting( "analytics_import", "analytics_id", "" ),
				customDimensionIndex=getSystemSetting( "analytics_import", "page_id_custom_dimension_index", "" )
			}
		);
	}
}