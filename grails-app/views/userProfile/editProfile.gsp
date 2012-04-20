<%@ page import="timebank.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="default.edit.profile"/></title>
    <script>
        $(document).ready(function () {
            $("#txtSkill").focus().autocomplete({
                minLength:2,
                cache:false,
                source:"${createLink( action: 'ajaxSkillSearch')}"
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
    <h4><g:message code="default.edit.profile"/></h4>
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
                    <td valign="top" class="name">
                        <label for="firstName"><g:message code="user.firstName.label" default="First Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'firstName', 'errors')}">
                        <g:textField name="firstName" value="${userInstance?.firstName}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="secondName"><g:message code="user.secondName.label" default="Second Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'secondName', 'errors')}">
                        <g:textField name="secondName" value="${userInstance?.secondName}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="dob"><g:message code="user.dob.label" default="Dob"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'dob', 'errors')}">
                        <joda:datePicker name="dob" value="${userInstance?.dob}"
                                         noSelection="['': '']"></joda:datePicker>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="user.balance.label" default="Balance"/></td>

                    <td valign="top" class="value">
                        %{--${userInstance.balance} hours--}%
                        %{--<g:hiddenField name="balance" value="userInstance.balance"/>--}%
                        ${userInstance?.balance.toStandardHours().hours}
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="offeredSkills"><g:message code="user.offeredSkills.label"
                                                              default="Offered Skills"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'offeredSkills', 'errors')}">
                        <g:select name="offeredSkills" from="${timebank.Skill.list()}" multiple="multiple"
                                  optionKey="id" optionValue="name" size="5" value="${userInstance?.offeredSkills*.id}"
                                  class="many-to-many"/>
                        <br>
                        <g:form action="addSkill"><g:textField name="txtSkill"/><g:actionSubmit value="Add Skill"
                                                                                                action="addSkill"
                                                                                                id="btnAddSkill"/></g:form>
                        %{--<br>--}%
                        %{--<g:actionSubmit value="Suggest Skill" action="suggestSkill" id="btnSuggestSkill"/>--}%
                        %{--<g:textField name="txtSuggestSkill" id="txtSuggestSkill"/>--}%
                    </td>
                </tr>


                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="username"><g:message code="user.username.label" default="Username"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                        <g:textField name="username" required="" value="${userInstance?.username}"/>
                    </td>
                </tr>

                %{--<tr class="prop">--}%
                %{--<td valign="top" class="name">--}%
                %{--<label for="createdRequests"><g:message code="user.createdRequests.label"--}%
                %{--default="Your Requests"/></label>--}%
                %{--</td>--}%
                %{--<td valign="top" class="value ${hasErrors(bean: userInstance, field: 'createdRequests', 'errors')}">--}%
                %{--<g:select name="createdRequests" from="${timebank.Request.list()}" multiple="multiple"--}%
                %{--optionKey="id" size="5" value="${userInstance?.createdRequests*.id}"--}%
                %{--class="many-to-many"/>--}%
                %{--</td>--}%
                %{--</tr>--}%

                %{--<tr class="prop">--}%
                %{--<td valign="top" class="name">--}%
                %{--<label for="exchangesProvided"><g:message code="user.exchangesProvided.label"--}%
                %{--default="Exchanges Provided"/></label>--}%
                %{--</td>--}%
                %{--<td valign="top"--}%
                %{--class="value ${hasErrors(bean: userInstance, field: 'exchangesProvided', 'errors')}">--}%
                %{--<g:select name="exchangesProvided" from="${timebank.Exchange.list()}" multiple="multiple"--}%
                %{--optionKey="id" size="5" value="${userInstance?.exchangesProvided*.id}"--}%
                %{--class="many-to-many"/>--}%
                %{--</td>--}%
                %{--</tr>--}%

                %{--<tr class="prop">--}%
                %{--<td valign="top" class="name">--}%
                %{--<label for="exchangesReceived"><g:message code="user.exchangesReceived.label"--}%
                %{--default="Exchanges Received"/></label>--}%
                %{--</td>--}%
                %{--<td valign="top"--}%
                %{--class="value ${hasErrors(bean: userInstance, field: 'exchangesReceived', 'errors')}">--}%
                %{--<g:select name="exchangesReceived" from="${timebank.Exchange.list()}" multiple="multiple"--}%
                %{--optionKey="id" size="5" value="${userInstance?.exchangesReceived*.id}"--}%
                %{--class="many-to-many"/>--}%
                %{--</td>--}%
                %{--</tr>--}%

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button"><g:actionSubmit class="save" action="updateProfile"
                                                 value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
        </div>
    </g:form>
</div>
</body>
</html>
