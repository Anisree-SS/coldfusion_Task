<cfset variables.strLoginLink=''>
<cfset variables.strPageListLink=''>
<cfset variables.strAddPageLink=''>

<cfset variables.strLoginLink= session.isLogin?"Log out":"Log In">
<cfset variables.strPageListLink=session.isLogin &&(session.role EQ "admin"||session.role EQ "editor" ||session.role EQ "user")?"Page List":"">
<cfset variables.strAddPageLink=session.isLogin &&(session.role EQ "admin"||session.role EQ "editor")?"Add Page":"">

<cfoutput>
    <footer class="footerHeight bg-light d-flex justify-content-center align-items-center ">
        <div class="d-flex">
            <div class="m-4 d-flex justify-content-between text-sm">
                <div>Page Dive</div>
            </div>
        </div>
        <div class="d-flex">
            <nav class="navbar navbar-expand-lg navbar-light px-3">
                <a  href="homePage.cfm" class="text-secondary">Home</a>
            </nav>
            <nav class="navbar navbar-expand-lg navbar-light  px-3">
                <a  href="List.cfm" class="text-secondary">#variables.strPageListLink#</a>
            </nav>
            <nav class="navbar navbar-expand-lg navbar-light  px-3">
                <a  href="editPage.cfm" class="text-secondary">#variables.strAddPageLink#</a>
            </nav>
            <nav class="navbar navbar-expand-lg navbar-light  px-3">
                <a class="nav-link text-secondary" href="../controller/pages.cfc?method=doLogOut">#variables.strLoginLink#</a>
            </nav>
        </div>
    </footer>
</cfoutput>