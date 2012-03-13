<%@ page import="timebank.Person" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}"/>
    %{--<title><g:message code="default.edit.label" args="[entityName]"/></title>--}%
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
</div>

<div class="body align_center">
    <br>

    <h3>Edit Your Profile</h3>
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
                        <label for="offeredSkills"><g:message code="person.offeredSkills.label"
                                                              default="Offer Skills"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: personInstance, field: 'offeredSkills', 'errors')}">

                        <ul class="one-to-many">
                            <g:each in="${personInstance?.offeredSkills ?}" var="c">
                                <li><g:link controller="request" action="show"
                                            id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                            </g:each>
                            <li class="add">
                                <g:link controller="offer" action="create"
                                        params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'request.label', default: 'Offer')])}</g:link>
                            </li>
                        </ul>

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
                        <label for="offeredSkills"><g:message code="person.offeredSkills.label"
                                                              default="Offered Skills"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'offeredSkills', 'errors')}">
                        <g:select name="offeredSkills" from="${timebank.Offer.list()}" multiple="multiple"
                                  optionKey="id" size="5"
                                  value="${personInstance?.offeredSkills*.id}" class="many-to-many"/>
                        <g:link controller="skill" action="create">Create New Skill</g:link>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button"><g:actionSubmit class="save" action="update"
                                                 value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
        </div>
    </g:form>
</div>
</body>
</html>
