component output=false {

   property name="presideObjectService" inject="presideObjectService";

   public boolean function submitContact( event, rc, prc,args={}){
        email = rc.email ?: "";
        phone = rc.phone ?: "";
        name = rc.name ?: "";
        message = rc.messagge ?: "";
        if(!isEmpty(email) && !isEmpty(phone)){
            newId = presideObjectService.insertData(
                    objectName = "contact"
                    , data       = { email=email, phone=phone,message=message,name=name}
                );
            return true;
        }else{
            return false;
        }
        return false;
   }

}