
 /**
 * @labelField code
 * @dataManagerGroup Product
 */
component {
    property name="name"             type="string" dbtype="varchar"  maxLength="500"         required="true";
    property name="code"             type="string" dbtype="varchar"  maxLength="10"         required="true";
    property name="status"           type="string" dbtype="varchar"  maxLength="500"         required="true";
    property name="price"            type= "numeric"    dbtype = "decimal(10,2)"    minValue  = 0 default  = 0  required="true";
	property name="description_short"        type="string" dbtype="varchar"  maxLength="1000"        required="true";
	property name="description_long"         type="string" dbtype="varchar"  maxLength="4000"   control="richEditor"     required="true";
    property name="images"                   type="string" dbtype="varchar"  control="assetPicker" allowedTypes="image"  multiple="true" sortable="true" quickadd="true" quickedit="true" required="true";
    property name="group_product"           relationship="many-to-one"      relatedTo="group_product" quickadd="true" quickedit="true" required="true";

}