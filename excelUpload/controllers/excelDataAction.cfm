<cfscript>
    variables.data=' ';
    variables.errorMsg='';
    variables.fileObj=createObject("component","controllers.excelData");
    if(StructKeyExists(form, "submit")){
        if(form.excelFile==''){
            variables.errorMsg="Please Upload File!!";
        }
        if(variables.errorMsg==''){
            variables.result=variables.fileObj.checkData(excelFile=form.excelFile);
            if(variables.result.success){
                variables.data=variables.fileObj.showData(excelFile=variables.result.data);
            }
            else{
                variables.errorMsg=variables.result.data;
            }
        }
    }         
</cfscript>