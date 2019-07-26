
 /**
 * @labelField icon
 * @dataManagerGroup Product
 */
component {
    property name="icon"        control="select" values="fa-phone,fa-envelope,fa-map-marker,fa-calendar,fa-money,fa-facebook"      required="true";
    property name="content"     type="string" dbtype="varchar"  maxLength="1000" control="richEditor"  required="true";
    property name="link"        type="string" dbtype="varchar" control="linkPicker" ;
    property name="img"         control="assetPicker"  allowedTypes="image" required="true";
}
