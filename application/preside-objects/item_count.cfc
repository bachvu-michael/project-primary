
 /**
 * @labelField title
 * @dataManagerGroup Product
 */
component {
    property name="title"         type="string" dbtype="varchar"  maxLength="100"         required="true";
    property name="number"        type="numeric" dbtype="varchar" required="true" default="100";
    property name="icon"          control="select" values="fa-group,fa-bar-chart,fa-building-o,fa-user-md,fa-home,fa-map-o" default="fa-group"  required="true";
}