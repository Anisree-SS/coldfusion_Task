<cfinclude template ="header.cfm">
<cfinclude template ="../controllers/excelDataAction.cfm">
<body>
<cfoutput>
    <form action="excelData.cfm" method="post" enctype="multipart/form-data">
        <label>Upload File </label>
        <input type="file" name="excelFile">
        <input type="submit" value="Submit" name="submit">
    </form>
</cfoutput>
</body>