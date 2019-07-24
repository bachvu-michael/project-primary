/**
 * @labelField question
 */

component {
	property name="question"             type="string" dbtype="varchar" control="textArea"      maxLength="255"  required="true";
    property name="answer"               type="string" dbtype="text"    control="richEditor"    required="true";
}