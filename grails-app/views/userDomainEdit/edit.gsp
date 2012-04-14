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
                    <td valign="top" class="name">
                        <label for="username"><g:message code="user.username.label" default="Username"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                        <g:textField name="username" required="" value="${userInstance?.username}"/>
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
                        <label for="balance"><g:message code="user.balance.label" default="Balance"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'balance', 'errors')}">
                        <joda:periodPicker name="balance" value="${userInstance?.balance}"></joda:periodPicker>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="createdRequests"><g:message code="user.createdRequests.label"
                                                                default="Created Requests"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'createdRequests', 'errors')}">

                        <ul class="one-to-many">
                            <g:each in="${userInstance?.createdRequests ?}" var="c">
                                <li><g:link controller="request" action="show"
                                            id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                            </g:each>
                            <li class="add">
                                <g:link controller="request" action="create"
                                        params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'request.label', default: 'Request')])}</g:link>
                            </li>
                        </ul>

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
                        <label for="exchangesProvided"><g:message code="user.exchangesProvided.label"
                                                                  default="Exchanges Provided"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: userInstance, field: 'exchangesProvided', 'errors')}">

                        <ul class="one-to-many">
                            <g:each in="${userInstance?.exchangesProvided ?}" var="e">
                                <li><g:link controller="exchange" action="show"
                                            id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                            </g:each>
                            <li class="add">
                                <g:link controller="exchange" action="create"
                                        params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'exchange.label', default: 'Exchange')])}</g:link>
                            </li>
                        </ul>

                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="exchangesReceived"><g:message code="user.exchangesReceived.label"
                                                                  default="Exchanges Received"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: userInstance, field: 'exchangesReceived', 'errors')}">

                        <ul class="one-to-many">
                            <g:each in="${userInstance?.exchangesReceived ?}" var="e">
                                <li><g:link controller="exchange" action="show"
                                            id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                            </g:each>
                            <li class="add">
                                <g:link controller="exchange" action="create"
                                        params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'exchange.label', default: 'Exchange')])}</g:link>
                            </li>
                        </ul>

                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="offeredSkills"><g:message code="user.offeredSkills.label"
                                                              default="Offered Skills"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'offeredSkills', 'errors')}">
                        <g:select name="offeredSkills" from="${timebank.Skill.list()}" multiple="multiple"
                                  optionKey="id" size="5" value="${userInstance?.offeredSkills*.id}"
                                  class="many-to-many"/>
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
