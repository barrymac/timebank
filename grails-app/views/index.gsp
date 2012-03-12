<html>
<head>
    <title>Welcome to TasteBud - Accounting for taste</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <script type="text/javascript">
        $(document).ready(function () {

            $('#googleLogin').click(function () {
                $('#openIdLoginForm').submit();
            });

            $('#facebookLogin').click(function () {
                $('#facebookLoginForm').submit();
            });

//$('#openIdLoginForm').submit(function() {
//  alert('Handler for .submit() called.');
//  return false;
//});
        });
    </script>
    %{--<g:include view="gspJsSnips/tagsAutoMultiJs.gsp"/>--}%
</head>

<body>
<sec:ifLoggedIn>
    <div class="row ">
        <div class="col col-15 align_center">
            %{--<div class="row">--}%
            <br>
            <h4>Personal home page</h4>
            <br>
            %{--</div>--}%
            <div class="row">
                <div class="col col-1"></div>

                <div class="col align_center">
                    <p>some content, recent jobs, friends ?</p>
                </div>
            </div>
        </div>
    </div>
</sec:ifLoggedIn>

<sec:ifNotLoggedIn>
    <div class="row ">
        <div id="pgBody" class="align_center">
            <div id="pgBodyTitle" class="row">
                <div class="col col-10">
                    <br><br><br>
                    <h4>Welcome to TimeBank!</h4>
                </div>
            </div>
            <br><br>

            <div class="row ">
                <div class="col col-10">
                    We use openid which means you can log in or register with an existing account just by clicking the logo.
                </div>
                <br><br>

                <div id="googleLoginFrm" class="col col-1">
                    <form action='${request.contextPath}/j_spring_openid_security_check' method='POST'
                          name='openIdLoginForm'
                          id="openIdLoginForm">
                        <div class="col col-1 rounded">
                            <img id="googleLogin" src="images/GoogleLogo.png" alt="Log In With Google">
                        </div>
                        <input type="hidden" id="openid_identifier" name="openid_identifier" class="title"
                               value="https://www.google.com/accounts/o8/id">
                    </form>
                </div>

                %{--<div class="col col-1 rounded"><g:link controller="login" action="auth"><img--}%
                %{--src="images/login-button-big.gif" alt="Log In"></g:link></div>--}%

                %{--<div id="fbLoginFrm" class="col col-1">--}%
                %{--<form action='${request.contextPath}/j_spring_openid_security_check' technique='POST'--}%
                %{--autocomplete='off' name='facebookLoginForm'--}%
                %{--id="facebookLoginForm">--}%
                %{--<div class="col col-1 rounded">--}%
                %{--<img id="facebookLogin" src="images/facebooklogo.png" alt="Log In With Facebook">--}%
                %{--</div>--}%
                %{--<input type="hidden" id="openid_identifier" name="openid_identifier" class="title"--}%
                %{--value="https://facebook.anyopenid.com">--}%
                %{--</form>--}%

                %{--</div>--}%

                <br><br>
                <br><br>

                <div class="col col-10">
                    We will be adding more login providers in the near future, such as facebook, twitter etc
                </div>
            </div>
            <br><br>

            %{--<div class="row">--}%
            %{--<td><div class="selectOnClick">https://www.google.com/accounts/o8/id</div>(already filled in)</td>--}%
            %{--<div class="row rounded">--}%
            %{--<div class="col col-1">&nbsp;</div>--}%

            %{--<div id="googleLoginFrm" class="col col-1">--}%
            %{--<form action='${request.contextPath}/j_spring_openid_security_check' method='POST'--}%
            %{--autocomplete='off'--}%
            %{--name='openIdLoginForm'--}%
            %{--id="openIdLoginForm">--}%
            %{--<div class="col col-1 rounded">--}%
            %{--<img id="googleLogin" src="images/GoogleLogo.png" alt="Log In With Google">--}%
            %{--</div>--}%
            %{--<input type="hidden" id="openid_identifier" name="openid_identifier" class="title"--}%
            %{--value="https://www.google.com/accounts/o8/id">--}%
            %{--</form>--}%
            %{--</div>--}%

            %{--<div class="col col-1 rounded"><g:link controller="login" action="auth"><img--}%
            %{--src="images/login-button-big.gif" alt="Log In"></g:link></div>--}%

            %{--<div id="fbLoginFrm" class="col col-1">--}%
            %{--<form action='${request.contextPath}/j_spring_openid_security_check' technique='POST'--}%
            %{--autocomplete='off' name='facebookLoginForm'--}%
            %{--id="facebookLoginForm">--}%
            %{--<div class="col col-1 rounded">--}%
            %{--<img id="facebookLogin" src="images/facebooklogo.png" alt="Log In With Facebook">--}%
            %{--</div>--}%
            %{--<input type="hidden" id="openid_identifier" name="openid_identifier" class="title"--}%
            %{--value="https://facebook.anyopenid.com">--}%
            %{--</form>--}%

            %{--</div>--}%

            %{--</div>--}%

            %{--<div class="row">--}%
            %{--<div class="col col-10 rounded">--}%
            %{--<br>--}%
            %{--We will be adding more openId providers in the near future such as Facebook or Microsoft Live.--}%
            %{--<br>--}%
            %{--If you are a new user then you will be shown a registration page which is very simple.--}%
            %{--We won't demand loads of information from you or send you loads of emails.--}%
            %{--The more information you tell us about what you like of course the more we can tailor your experience of the site.--}%
            %{--</div>--}%
            %{--</div>--}%
            %{--</div>--}%

            <div class="row ">
                <div class="col col-10">
                    %{--<h2>A few things about the site</h2>--}%
                    <ul>
                    </ul>
                </div>
            </div>

            <div class="row ">
                <div class="col col-10">
                    %{--<h2>A few things about us</h2>--}%
                    <ul>
                    </ul>
                </div>
            </div>

        </div>
    </div>

</sec:ifNotLoggedIn>
</body>
</html>
