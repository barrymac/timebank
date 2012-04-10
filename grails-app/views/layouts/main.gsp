<%@ page import="grails.plugins.springsecurity.SpringSecurityService" %>
<!DOCTYPE html>
<html>
<head>
    <title><g:layoutTitle default="Timber Wharf Timebank"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon2.ico')}" type="image/x-icon"/>
    <link rel="stylesheet" href="${resource(dir: 'css/52fw', file: 'css3.css')}" type="text/css"/>
    <link rel="stylesheet" href="${resource(dir: 'css/52fw', file: 'grid.css')}" type="text/css"/>
    <link rel="stylesheet" href="${resource(dir: 'css/52fw', file: 'general.css')}" type="text/css"/>
    %{--<link rel="stylesheet" href="${resource(dir:'css/52fw',file:'forms.css')}" type="text/css" />--}%
    <script src="${resource(dir: 'js/52fw', file: 'selectivizr.js')}"></script>
    <script src="${resource(dir: 'js/52fw', file: 'modernizr-1.7.min.js')}"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet"
          type="text/css"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js" type="text/javascript"></script>
    <script src="${resource(dir: 'js/jdMenu', file: 'jquery.positionBy.js')}"></script>
    <script src="${resource(dir: 'js/jdMenu', file: 'jquery.bgiframe.js')}"></script>
    <script src="${resource(dir: 'js/jdMenu', file: 'jquery.jdMenu.js')}"></script>
    <link rel="stylesheet" href="${resource(dir: 'css/', file: 'jquery.jdMenu.css')}" type="text/css"/>
    %{--<g:javascript library="jquery" plugin="jquery"/>--}%
    %{--<jqui:resources/>--}%
    %{--<jqueryui:javascript />--}%
    <g:layoutHead/>
</head>

<body>
<div id="mainBodyDiv" class="row header align_center">
    <div id="titleDiv" class="col col_16 align_left">
        <div class="top">
            <a href="${request.contextPath}">
                <img src="${resource(dir: 'images', file: 'logo-beta.png')}" alt="TimeBank" border="0" class="top"/>
            </a>
        </div>

        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir: 'images', file: 'spinner.gif')}"
                 alt="${message(code: 'spinner.alt', default: 'Working...')}"/>
        </div>
        <br>

        <div id="selectedSessionDiv" class="row col_11 rounded message" style="display:none;">
        </div>
        <br>
    </div>

    <div class="col align_center">
        &nbsp;
    </div>

    <div id="menu" class="col col_3 align_left block" style="overflow: visible;">
    <ul class="jd_menu jd_menu_vertical jd_menu_slate align_left row rounded">
        %{--<sec:ifNotLoggedIn>--}%
        %{--<li><g:link id="loginLnk" controller="home"--}%
        %{--action="promptLogin">Log In&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</g:link></li>--}%
        %{--</sec:ifNotLoggedIn>--}%
        <li>
            <g:link elementId="homeLnk" url="${request.contextPath}">Home
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </g:link>
        </li>
        <sec:ifLoggedIn>
            <li></li>
            <li>Welcome <sec:username/> !</li>
            <li>Balance: ${session.balance}</li>
            <li><g:link controller="userProfile" action="editProfile" params="">My Profile</g:link></li>
            <sec:ifAllGranted roles="ROLE_ADMIN,ROLE_SUPERVISOR">
                <li><g:link controller="offer" action="create" params="">Offer a Skill</g:link></li>
                <li><g:link controller="request" action="create">Make a Request</g:link></li>
                <li><g:link controller="offer" action="list" params="">My Offers</g:link></li>
                <li><g:link controller="request" action="list">Browse Requests</g:link></li>
                <li><g:link controller="logout">Log out</g:link></li>
                <li><g:link controller="tag" action="create">Create a tag</g:link></li>
                <li><g:link controller="skill" action="create">Create a skill</g:link></li>
                <li><g:link controller="tag" action="list">List tags</g:link></li>
                <li><g:link controller="user" action="list">List People</g:link></li>
            </sec:ifAllGranted>

            <g:form url='[controller: "searchable", action: "index"]' id="searchableForm" name="searchableForm"
                    method="get" class="col_2">
                <br>
                <li><g:textField name="q" value="${params.q}" size="17" class="searchDialogue"/></li>
                <li><br><input type="submit" value="Search All"/></li>
                <br>
                <br>
            </g:form>
            <sec:access expression="hasRole('ROLE_DEVELOPMENT')">
                <g:if test="(env='development') || (env='test') || (env='devServer')">
                    <li><g:link uri="/indexScaffold.gsp">Show All controllers</g:link></li>
                </g:if>
                <li><g:link controller="notification" action="create">Add Notification</g:link></li>
                <li><g:link controller="searchable" action="indexAll">Run Search Index</g:link></li>
                </ul>
            </sec:access>
        </sec:ifLoggedIn>
        <br>
        <br>
        <br>
    </div>

    <div class="col col_12 align_center rounded block">
        <g:if test="${notifications}">
            <div id="notifications" class="col col_11 rounded message">
                <g:each in="${notifications}">
                    ${it.content}
                </g:each>
            </div>
        </g:if>
    %{--<g:if test="${flash.message}">--}%
    %{--<div id="errorsDiv" class="col col_11 rounded message">${flash.message}</div>--}%
    %{--</g:if>--}%

        <g:layoutBody/>
    %{--<br><br>--}%
    </div>

    <div class="col_1 col align_center">
        &nbsp;
    </div>
</div>

<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-29922445-1']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();

</script>
</body>
</html>