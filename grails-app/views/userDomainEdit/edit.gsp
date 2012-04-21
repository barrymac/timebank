<%@ page import="timebank.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                           args="[entityName]"/></g:link></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                               args="[entityName]"/></g:link></span>
</div>

<div class="body">
<h1><g:message code="default.edit.label" args="[entityName]"/></h1>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${userInstance}">
    <div class="errors">
        <g:renderErrors bean="${userInstance}" as="list"/>
    </div>
</g:hasErrors>
<g:form method="post">
    <g:hiddenField name="id" value="${userInstance?.id}"/>
    <g:hiddenField name="version" value="${userInstance?.version}"/>
    <div class="dialog">
        <table>
            <tbody>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="username"><g:message code="user.username.label" default="Username"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                    <g:textField name="username" required="" value="${userInstance?.username}"/>
                </td>
            </tr>

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
                    <label for="address1"><g:message code="user.address1.label" default="Address1"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'address1', 'errors')}">
                    <g:textField name="address1" value="${userInstance?.address1}"/>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="address2"><g:message code="user.address2.label" default="Address2"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'address2', 'errors')}">
                    <g:textField name="address2" value="${userInstance?.address2}"/>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="postcode"><g:message code="user.postcode.label" default="Postcode"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'postcode', 'errors')}">
                    <g:textField name="postcode" value="${userInstance?.postcode}"/>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="balance"><g:message code="user.balance.label" default="Balance"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'balance', 'errors')}">
                    <joda:periodPicker name="balance" value="${userInstance?.balance}"
                                       noSelection="['': '']"></joda:periodPicker>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="dob"><g:message code="user.dob.label" default="Dob"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'dob', 'errors')}">
                    <joda:datePicker name="dob" value="${userInstance?.dob}" noSelection="['': '']"></joda:datePicker>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="password"><g:message code="user.password.label" default="Password"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                    <g:textField name="password" value="${userInstance?.password}"/>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="userType"><g:message code="user.userType.label" default="User Type"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'userType', 'errors')}">
                    <g:select name="userType" from="${userInstance.constraints.userType.inList}"
                              value="${userInstance?.userType}" valueMessagePrefix="user.userType"
                              noSelection="['': '']"/>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="phoneNumber"><g:message code="user.phoneNumber.label" default="Phone Number"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'phoneNumber', 'errors')}">
                    <g:textField name="phoneNumber" pattern="${userInstance.constraints.phoneNumber.matches}"
                                 value="${userInstance?.phoneNumber}"/>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="email"><g:message code="user.email.label" default="Email"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                    <g:field type="email" name="email" value="${userInstance?.email}"/>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="accountExpired"><g:message code="user.accountExpired.label"
                                                           default="Account Expired"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'accountExpired', 'errors')}">
                    <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}"/>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="accountLocked"><g:message code="user.accountLocked.label"
                                                          default="Account Locked"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'accountLocked', 'errors')}">
                    <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}"/>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="enabled"><g:message code="user.enabled.label" default="Enabled"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'enabled', 'errors')}">
                    <g:checkBox name="enabled" value="${userInstance?.enabled}"/>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="offeredSkills"><g:message code="user.offeredSkills.label"
                                                          default="Offered Skills"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'offeredSkills', 'errors')}">

                    <ul class="one-to-many">
                        <g:each in="${userInstance?.offeredSkills ?}" var="o">
                            <li><g:link controller="userSkill" action="show"
                                        id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                        </g:each>
                        <li class="add">
                            <g:link controller="userSkill" action="create"
                                    params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userSkill.label', default: 'UserSkill')])}</g:link>
                        </li>
                    </ul>

                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="openIds"><g:message code="user.openIds.label" default="Open Ids"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'openIds', 'errors')}">

                    <ul class="one-to-many">
                        <g:each in="${userInstance?.openIds ?}" var="o">
                            <li><g:link controller="openID" action="show"
                                        id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                        </g:each>
                        <li class="add">
                            <g:link controller="openID" action="create"
                                    params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'openID.label', default: 'OpenID')])}</g:link>
                        </li>
                    </ul>

                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="passwordExpired"><g:message code="user.passwordExpired.label"
                                                            default="Password Expired"/></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'passwordExpired', 'errors')}">
                    <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}"/>
                </td>
            </tr>

            </tbody>
        </table>
    </div>

    <div class="buttons">
        <span class="button"><g:actionSubmit class="save" action="update"
                                             value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
        <span class="button"><g:actionSubmit class="delete" action="delete"
                                             value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                             onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
    </div>
</g:form>
</div>
</body>
</html>
