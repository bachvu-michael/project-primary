
 /**
 * @labelField title
 */
component {
    property name="title"      type="string" dbtype="varchar"  maxLength="100"         required="true";
    property name="links"      type="string" dbtype="varchar" control="linkPicker" multiple="true"   required="true" maxLength="500";
}