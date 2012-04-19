<%@ page import="timebank.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
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
                <td valign="top" class="name"><g:message code="user.id.label" default="Id"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "id")}</td>

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
                <td valign="top" class="name"><g:message code="user.address.label" default="Address"/></td>

                <td valign="top" class="value"><g:link controller="address" action="show"
                                                       id="${userInstance?.address?.id}">${userInstance?.address?.encodeAsHTML()}</g:link></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.dob.label" default="Dob"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "dob")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.offeredSkills.label" default="Offered Skills"/></td>

                <td valign="top" style="text-align: left;" class="value">
                    <ul>
                        <g:each in="${userInstance.offeredSkills}" var="o">
                            <li><g:link controller="userSkill" action="show"
                                        id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                        </g:each>
                    </ul>
                </td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.username.label" default="Username"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "username")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.password.label" default="Password"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "password")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.type.label" default="Type"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "type")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.phoneNumber.label" default="Phone Number"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "phoneNumber")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.email.label" default="Email"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "email")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.accountExpired.label"
                                                         default="Account Expired"/></td>

                <td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.accountExpired}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.accountLocked.label" default="Account Locked"/></td>

                <td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.accountLocked}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.createdRequests.label"
                                                         default="Created Requests"/></td>

                <td valign="top" style="text-align: left;" class="value">
                    <ul>
                        <g:each in="${userInstance.createdRequests}" var="c">
                            <li><g:link controller="request" action="show"
                                        id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                        </g:each>
                    </ul>
                </td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.enabled.label" default="Enabled"/></td>

                <td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.enabled}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.exchangesProvided.label"
                                                         default="Exchanges Provided"/></td>

                <td valign="top" style="text-align: left;" class="value">
                    <ul>
                        <g:each in="${userInstance.exchangesProvided}" var="e">
                            <li><g:link controller="exchange" action="show"
                                        id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                        </g:each>
                    </ul>
                </td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.exchangesReceived.label"
                                                         default="Exchanges Received"/></td>

                <td valign="top" style="text-align: left;" class="value">
                    <ul>
                        <g:each in="${userInstance.exchangesReceived}" var="e">
                            <li><g:link controller="exchange" action="show"
                                        id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                        </g:each>
                    </ul>
                </td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.openIds.label" default="Open Ids"/></td>

                <td valign="top" style="text-align: left;" class="value">
                    <ul>
                        <g:each in="${userInstance.openIds}" var="o">
                            <li><g:link controller="openID" action="show"
                                        id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                        </g:each>
                    </ul>
                </td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.passwordExpired.label"
                                                         default="Password Expired"/></td>

                <td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.passwordExpired}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.referees.label" default="Referees"/></td>

                <td valign="top" style="text-align: left;" class="value">
                    <ul>
                        <g:each in="${userInstance.referees}" var="r">
                            <li><g:link controller="referee" action="show"
                                        id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                        </g:each>
                    </ul>
                </td>

            </tr>

            </tbody>
        </table>
    </div>

    <div class="buttons">
        <g:form>
            <g:hiddenField name="id" value="${userInstance?.id}"/>
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
