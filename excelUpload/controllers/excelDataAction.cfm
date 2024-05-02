<cfscript>
    variables.data='';
    if(StructKeyExists(form, "submit")){
        variables.fileObj=createObject("component","controllers.excelData");
        variables.data=variables.fileObj.showData(excelFile=form.excelFile);
        Writedump(data);abort;
    }         
</cfscript>