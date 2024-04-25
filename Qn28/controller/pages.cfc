component {
    remote any function savePage(intpageId,strpageName,strpageDes) returnFormat="JSON" {
        local.error='';
        if(len(trim(strpageName)) EQ 0 ){
             local.error&="Page name is required!!"&"<br>";
        }
        else if ((REFind("\d", strpageName)) OR (len(strpageName) GT 40)){
            local.error&="Page name should be string with less than 40 letters!! "&"<br>";
        }
        if(len(trim(strpageDes)) EQ 0){
            local.error&="Page description is required!!"&"<br>";
        }
        else if(isNumeric(strpageDes)){
            local.error&="Page description is required strings also!!"&"<br>";
        }
        if(len(local.error) EQ 0){
            local.update=createObject("component","CFC.pages");
            local.editMsg=local.update.savePage(strpageName,strpageDes,intpageId);
            return local.editMsg;  
        }
        else{
            return {"success":false,"msg":"#local.error#"};
        }
    }   

    public void function checkLogin(){
        if(session.isLogin){
           cflocation(url="../view/homePage.cfm");
        }
    }

    remote any function doLogOut(){
        session.isLogin=false;
        cflocation(url="../view/login.cfm");
    }

    remote any function doLogin(struserName,strpassword) returnFormat="JSON"{
        local.strpassword=Hash(arguments.strpassword,"MD5");
        local.getQuery=createObject("component","CFC.pages").doLogin(struserName,strpassword);
        if (local.getQuery.recordCount) {
            session.userRole = local.getQuery.role;
            session.Firstname=local.getQuery.fullName;
            session.isLogin = true;
            return { "success": true };
        } else {
            return { "success": false };
        }
    }

}

