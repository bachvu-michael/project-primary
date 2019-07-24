
 /**
 * @labelField email
 * @datamanagerGridFields email,phone,dateCreated
 * @datamanagerAllowedOperations view,delete
 * @dataManagerGroup Product
 */
component {
    property name="email"        type="string" dbtype="varchar"  maxLength="30"         required="true";
    property name="phone"        type="string" dbtype="varchar"  maxLength="20"         required="true";
    property name="name"         type="string" dbtype="varchar"  maxLength="50"         required="true";
    property name="message"      type="string" dbtype="varchar"  maxLength="1000"         required="true";
}