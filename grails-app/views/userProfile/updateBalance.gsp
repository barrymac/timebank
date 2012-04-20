<%@ page import="timebank.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="default.update.balance"/></title>
    <script>
        $(document).ready(function () {

            $("#addHour").click(function () {
                $.post("${request.contextPath}/ajax/addHour", {id: ${userInstance.id}},
                        function (data) {
                            $('#balance').fadeOut(200, function () {
                                $('#balance').text(data.newBalance + ' hours').fadeIn(200);
                            });
                        });
            });

            $("#subtractHour").click(function () {
                $.post("${request.contextPath}/ajax/subtractHour", {id: ${userInstance.id}},
                        function (data) {
                            $('#balance').fadeOut(200, function () {
                                $('#balance').text(data.newBalance + ' hours').fadeIn(200);
                            });
                        });
            });

        });
    </script>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
</div>

<div class="body">
    <br>
    <h4><g:message code="default.update.balance"/></h4>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${userInstance}">
        <div class="errors">
            <g:renderErrors bean="${userInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post" controller="userProfile" action="updateProfile">
        <g:hiddenField name="id" value="${userInstance?.id}"/>
        <g:hiddenField name="version" value="${userInstance?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="user.username.label" default="Username"/></td>

                    <td valign="top" class="value">${fieldValue(bean: userInstance, field: "username")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="user.firstName.label" default="First Name"/></td>

                    <td valign="top" class="value">${fieldValue(bean: userInstance, field: "firstName")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="user.secondName.label" default="Second Name"/></td>

                    <td valign="top" class="value">${fieldValue(bean: userInstance, field: "secondName")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="balance"><g:message code="user.balance.label" default="Balance"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'balance', 'errors')}">
                        %{--${userInstance?.balance} hours &nbsp;&nbsp;&nbsp;&nbsp;--}%
                        <div id="prevBalance">Was ${userInstance?.balance.toStandardHours().hours} hours</div><br>

                        <div id="balance">${userInstance?.balance.toStandardHours().hours} hours</div><br>
                        <img id="addHour" src='${fam.icon(name: 'add')}'/>
                        <img id="subtractHour" src='${fam.icon(name: 'delete')}'/>
                        %{--<g:textField name="balance" value="${userInstance?.balance}"/>--}%
                        %{--<joda:timePicker name="balance" value="${userInstance?.balance}" />--}%
                        %{--<joda:timeField name="balance" value="${userInstance?.balance}"></joda:timeField>--}%
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="user.offeredSkills.label"
                                                             default="Offered Skills"/></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${userInstance.offeredSkills}" var="o">
                                <li><g:link controller="skill" action="show"
                                            id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                </tbody>
            </table>
        </div>

    %{--<div class="buttons">--}%
    %{--<span class="button"><g:actionSubmit class="save" action="updateBalance"--}%
    %{--value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>--}%
    %{--</div>--}%
    </g:form>
</div>
</body>
</html>
