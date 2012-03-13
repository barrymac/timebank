<%@ page import="timebank.Person" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                           args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${personInstance}">
        <div class="errors">
            <g:renderErrors bean="${personInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="username"><g:message code="person.username.label" default="Username"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'username', 'errors')}">
                        <g:textField name="username" required="" value="${personInstance?.username}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="password"><g:message code="person.password.label" default="Password"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'password', 'errors')}">
                        <g:textField name="password" value="${personInstance?.password}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="firstName"><g:message code="person.firstName.label" default="First Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'firstName', 'errors')}">
                        <g:textField name="firstName" value="${personInstance?.firstName}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="secondName"><g:message code="person.secondName.label"
                                                           default="Second Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'secondName', 'errors')}">
                        <g:textField name="secondName" value="${personInstance?.secondName}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="dob"><g:message code="person.dob.label" default="Dob"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'dob', 'errors')}">
                        <joda:dateTimePicker name="dob" value="${personInstance?.dob}"
                                             noSelection="['': '']"></joda:dateTimePicker>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="accountExpired"><g:message code="person.accountExpired.label"
                                                               default="Account Expired"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: personInstance, field: 'accountExpired', 'errors')}">
                        <g:checkBox name="accountExpired" value="${personInstance?.accountExpired}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="accountLocked"><g:message code="person.accountLocked.label"
                                                              default="Account Locked"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'accountLocked', 'errors')}">
                        <g:checkBox name="accountLocked" value="${personInstance?.accountLocked}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="enabled"><g:message code="person.enabled.label" default="Enabled"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'enabled', 'errors')}">
                        <g:checkBox name="enabled" value="${personInstance?.enabled}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="passwordExpired"><g:message code="person.passwordExpired.label"
                                                                default="Password Expired"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: personInstance, field: 'passwordExpired', 'errors')}">
                        <g:checkBox name="passwordExpired" value="${personInstance?.passwordExpired}"/>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save"
                                                 value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
        </div>
    </g:form>
</div>
</body>
</html>
