<%@ page import="timebank.Request" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'request.label', default: 'Request')}"/>
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
    <g:hasErrors bean="${requestInstance}">
        <div class="errors">
            <g:renderErrors bean="${requestInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="complete"><g:message code="request.complete.label" default="Complete"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: requestInstance, field: 'complete', 'errors')}">
                        <g:checkBox name="complete" value="${requestInstance?.complete}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="description"><g:message code="request.description.label"
                                                            default="Description"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: requestInstance, field: 'description', 'errors')}">
                        <g:textField name="description" value="${requestInstance?.description}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="requester"><g:message code="request.requester.label" default="Requester"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: requestInstance, field: 'requester', 'errors')}">
                        <g:select id="requester" name="requester.id" from="${timebank.User.list()}" optionKey="id"
                                  required="" value="${requestInstance?.requester?.id}" class="many-to-one"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="timeEstimate"><g:message code="request.timeEstimate.label"
                                                             default="Time Estimate"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: requestInstance, field: 'timeEstimate', 'errors')}">
                        <joda:periodPicker name="timeEstimate"
                                           value="${requestInstance?.timeEstimate}"></joda:periodPicker>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="title"><g:message code="request.title.label" default="Title"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: requestInstance, field: 'title', 'errors')}">
                        <g:textField name="title" value="${requestInstance?.title}"/>
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
