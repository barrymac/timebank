<%@ page import="timebank.Person" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
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
<h1><g:message code="default.show.label" args="[entityName]"/></h1>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<div class="dialog">
    <table>
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.id.label" default="Id"/></td>

            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "id")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.username.label" default="Username"/></td>

            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "username")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.password.label" default="Password"/></td>

            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "password")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.firstName.label" default="First Name"/></td>

            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "firstName")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.secondName.label" default="Second Name"/></td>

            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "secondName")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.dob.label" default="Dob"/></td>

            <td valign="top" class="value">${fieldValue(bean: personInstance, field: "dob")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.accountExpired.label" default="Account Expired"/></td>

            <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.accountExpired}"/></td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.accountLocked.label" default="Account Locked"/></td>

            <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.accountLocked}"/></td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.createRequests.label" default="Create Requests"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${personInstance.createRequests}" var="c">
                        <li><g:link controller="request" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.enabled.label" default="Enabled"/></td>

            <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.enabled}"/></td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.exchangesProvided.label"
                                                     default="Exchanges Provided"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${personInstance.exchangesProvided}" var="e">
                        <li><g:link controller="exchange" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.exchangesReceived.label"
                                                     default="Exchanges Received"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${personInstance.exchangesReceived}" var="e">
                        <li><g:link controller="exchange" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.jobs.label" default="Jobs"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${personInstance.jobs}" var="j">
                        <li><g:link controller="job" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.jobsDone.label" default="Jobs Done"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${personInstance.jobsDone}" var="j">
                        <li><g:link controller="job" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.offeredSkills.label" default="Offered Skills"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${personInstance.offeredSkills}" var="o">
                        <li><g:link controller="offer" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.openIds.label" default="Open Ids"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${personInstance.openIds}" var="o">
                        <li><g:link controller="openID" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.passwordExpired.label"
                                                     default="Password Expired"/></td>

            <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.passwordExpired}"/></td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.requests.label" default="Requests"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${personInstance.requests}" var="r">
                        <li><g:link controller="request" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="person.skills.label" default="Skills"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${personInstance.skills}" var="s">
                        <li><g:link controller="skill" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        </tbody>
    </table>
</div>

<div class="buttons">
    <g:form>
        <g:hiddenField name="id" value="${personInstance?.id}"/>
        <span class="button"><g:actionSubmit class="edit" action="edit"
                                             value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
        <span class="button"><g:actionSubmit class="delete" action="delete"
                                             value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                             onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
    </g:form>
</div>
</div>
</body>
</html>
