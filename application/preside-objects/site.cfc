component {
    property name="contact_section_title"       type="string"   dbtype="varchar" default="Contact us";
    property name="contact_address"             type="string"   dbtype="text";
    property name="social_link_section_title"   type="string"   dbtype="varchar" default="Follow us";
    property name="social_links"                type="string"   dbtype="text";
    property name="copyright"                   type="string"   dbtype="text";
    property name="left_content"                type="string"   dbtype="text";
    property name="logo"                        relationship="many-to-one" relatedto="asset" allowedTypes="images";

    //
    property name="footer_title"    	type="string" dbtype="varchar" ;
	property name="footer_content"    	type="string"  maxLength="1000" dbtype="varchar" control="richEditor";
	property name="footer_facebook"    	type="string" dbtype="varchar" control="linkPicker" ;
	property name="footer_youtube"    	type="string" dbtype="varchar" control="linkPicker" ;
}