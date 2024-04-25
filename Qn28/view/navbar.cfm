<cfset variables.strLoginLink=''>
<cfset variables.strPageListLink=''>
<cfset variables.strAddPageLink=''>

<cfset variables.strLoginLink= session.isLogin?"Log out":"Log In">
<cfset variables.strPageListLink=session.isLogin?"Page List":"">
<cfset variables.strfullName=session.isLogin?"#session.strfullName#":"">
<cfset variables.strAddPageLink=session.isLogin AND (session.strRole EQ "admin"||session.strRole EQ "editor")?"Add Page":"">

<cfoutput>
<div class="navBar d-flex align-items-center justify-content-center col-12 ">
    <nav class="navbar navbar-expand-lg flex-nowrap navbar-dark  px-3 px-sm-5 col-12">
        <a class="navbar-brand"><h3 class="clrHead"><b>Page Dive</b></h3></a>
        <div class="collapse navbar-collapse d-flex align-items-center justify-content-between" id="navbarColor02">
            <div class="d-flex  gap-3">
                <a class="nav-link" href="homePage.cfm">Home</a>
                <a class="nav-link" href="list.cfm">#variables.strPageListLink#</a>
                <a class="nav-link" href="editPage.cfm">#variables.strAddPageLink#</a>
            </div>
            <div class="d-flex gap-2">
            <a class="nav-link">#variables.strfullName#</a>
            <a class="nav-link" href="../controller/pages.cfc?method=doLogOut">#variables.strLoginLink#</a>
            </div>
        </div>
    </nav>
</div>
</cfoutput>
