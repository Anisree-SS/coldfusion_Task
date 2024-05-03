<cfinclude template ="header.cfm">
<body>
<cfoutput>
    <div class="d-flex-column align-items-center justify-content-center">
        <form class="p-5 py-0 mt-3 bg-light col-4" action="?action=upload" method="post" enctype="multipart/form-data">
            <div class="forHeight">
                <p class="text-danger">#variables.errorMsg#</p>
            </div>
            <div class="form-group ">
                <label for="excelFile">Upload File</label>
                <input type="file" class="form-control" id="excelFile" name="excelFile">
            </div>
            <div>
                <input type="submit" name="submit" value="submit" class="loginColor m-1 px-5">
            </div>
        </form>
        <table>
            #variables.data#
        </table>
    <div>
</cfoutput>
</body>
</html>