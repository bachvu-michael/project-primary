
/**
 * @labelField title
 */

component {
	property name="title"               type="string" dbtype="varchar"  maxLength="500"         required="true";
	property name="description"         type="string" dbtype="varchar"  maxLength="4000"        required="true";

	property name="background"          type="string" dbtype="varchar"  control="assetPicker"   required="true";
    property name="link"               type="string" dbtype="varchar"  control="linkPicker"    required="false";
}