<%@ page import="timebank.Person" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}"/>
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
    <g:hasErrors bean="${personInstance}">
        <div class="errors">
            <g:renderErrors bean="${personInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${personInstance?.id}"/>
        <g:hiddenField name="version" value="${personInstance?.version}"/>
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
                        <label for="createRequests"><g:message code="person.createRequests.label"
                                                               default="Create Requests"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: personInstance, field: 'createRequests', 'errors')}">

                        <ul class="one-to-many">
                            <g:each in="${personInstance?.createRequests ?}" var="c">
                                <li><g:link controller="request" action="show"
                                            id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                            </g:each>
                            <li class="add">
                                <g:link controller="request" action="create"
                                        params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'request.label', default: 'Request')])}</g:link>
                            </li>
                        </ul>

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
                        <label for="jobs"><g:message code="person.jobs.label" default="Jobs"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'jobs', 'errors')}">

                        <ul class="one-to-many">
                            <g:each in="${personInstance?.jobs ?}" var="j">
                                <li><g:link controller="job" action="show"
                                            id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
                            </g:each>
                            <li class="add">
                                <g:link controller="job" action="create"
                                        params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'job.label', default: 'Job')])}</g:link>
                            </li>
                        </ul>

                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="jobsDone"><g:message code="person.jobsDone.label" default="Jobs Done"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'jobsDone', 'errors')}">

                        <ul class="one-to-many">
                            <g:each in="${personInstance?.jobsDone ?}" var="j">
                                <li><g:link controller="job" action="show"
                                            id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
                            </g:each>
                            <li class="add">
                                <g:link controller="job" action="create"
                                        params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'job.label', default: 'Job')])}</g:link>
                            </li>
                        </ul>

                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="openIds"><g:message code="person.openIds.label" default="Open Ids"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'openIds', 'errors')}">

                        <ul class="one-to-many">
                            <g:each in="${personInstance?.openIds ?}" var="o">
                                <li><g:link controller="openID" action="show"
                                            id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                            </g:each>
                            <li class="add">
                                <g:link controller="openID" action="create"
                                        params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'openID.label', default: 'OpenID')])}</g:link>
                            </li>
                        </ul>

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
