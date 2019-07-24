
 /**
 * @labelField title
 * @dataManagerGroup Product
 */
component {
    property name="title"         type="string" dbtype="varchar"  maxLength="100"         required="true";
    property name="sub_title"         type="string" dbtype="varchar"  maxLength="100"         required="true";
    property name="link"      type="string" dbtype="varchar" control="linkPicker" ;
    property name="img"        control="assetPicker"  allowedTypes="image" required="true";
}
