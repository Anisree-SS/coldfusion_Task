component {
    remote any function checkUserName(strUserName) returnFormat="json"{
        var errorMsg='';
        if(len(trim(strUserName)) GT 10 ){
            errorMsg+="Atmost 10 letters for user name!!"
        }
        if(errorMsg==''){
            local.successMsg=createObject("component","models.common").checkUserName(strUserName);
            return local.successMsg;
        }
        else{
            return {"success":false,"msg":"#local.errorMsg#"}
        }
    }

    remote any function doSave(strUserName,strPassword,strRole,strFullName) returnFormat="json"{
        local.strPassword=Hash(arguments.strPassword,"MD5");
        local.successMsg=createObject("component","models.common").doSave(strUserName,local.strPassword,strRole,strFullName);
        return local.successMsg;
    }
}