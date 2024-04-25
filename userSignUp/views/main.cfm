<cfset variables.getData=createObject("component","models.common").getData()>

<cfinclude template ="header.cfm">
<body>
<cfoutput>
    <div class="d-flex align-items-center justify-content-center">
        <form class="p-5 m-5 bg-light col-4" action="?action=userAdd" method="post" id="signUpForm">
            <h3> Page Dive</h3>
            <br>
            <div class="form-group">
                <label for="strFullName">Full Name<span class="text-danger">*</span></label>
                <input type="text" class="form-control" id="strFullName" name="strFullName">
            </div>
            <div class="form-group">
                <label for="strUserName">User Name<span class="text-danger">*</span></label>
                <input type="text" class="form-control" id="strUserName" name="strUserName">
            </div>
            <div class="form-group">
                <label for="strPassword">Password<span class="text-danger">*</span></label>
                <input type="text" class="form-control" id="strPassword" name="strPassword">
            </div>
            <div class="form-group">
                <label for="strRole">Select role<span class="text-danger">*</span></label>
                <select class="form-control" id="strRole">
                <option>user</option>
                <option>admin</option>
                <option>editor</option>
                </select>
            </div>
            <div class="form-group d-flex justify-content-end  m-5">
                <input type="reset" class="bg-light border-1 m-1 px-5" value="Cancel" >
                <input type="submit" name="submit" value="Save" class="loginColor m-1 px-5" id="submitBtn">
            </div>
            <p class="labelStyle text-success" id="success"></p>
            <p class="labelStyle text-danger" id="failMsg"></p>
        </form>
    </div>
</cfoutput>
</body>
</html>