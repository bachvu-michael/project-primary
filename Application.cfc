component extends="preside.system.Bootstrap" {
	
	super.setupApplication( id = "ielts4chance" );
	function onError() { dump("ielts4chance");dump( arguments ); abort; } 

}
