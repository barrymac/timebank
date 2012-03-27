<%@ page import="timebank.Exchange" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'exchange.label', default: 'Exchange')}"/>
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
    <g:hasErrors bean="${exchangeInstance}">
        <div class="errors">
            <g:renderErrors bean="${exchangeInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${exchangeInstance?.id}"/>
        <g:hiddenField name="version" value="${exchangeInstance?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="endTime"><g:message code="exchange.endTime.label" default="End Time"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: exchangeInstance, field: 'endTime', 'errors')}">
                        <joda:dateTimePicker name="endTime" value="${exchangeInstance?.endTime}"></joda:dateTimePicker>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="provider"><g:message code="exchange.provider.label" default="Provider"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: exchangeInstance, field: 'provider', 'errors')}">
                        <g:select id="provider" name="provider.id" from="${timebank.User.list()}" optionKey="id"
                                  required="" value="${exchangeInstance?.provider?.id}" class="many-to-one"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="receiver"><g:message code="exchange.receiver.label" default="Receiver"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: exchangeInstance, field: 'receiver', 'errors')}">
                        <g:select id="receiver" name="receiver.id" from="${timebank.User.list()}" optionKey="id"
                                  required="" value="${exchangeInstance?.receiver?.id}" class="many-to-one"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="startTime"><g:message code="exchange.startTime.label" default="Start Time"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: exchangeInstance, field: 'startTime', 'errors')}">
                        <joda:dateTimePicker name="startTime"
                                             value="${exchangeInstance?.startTime}"></joda:dateTimePicker>
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
