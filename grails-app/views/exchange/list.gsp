<%@ page import="timebank.Exchange" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'exchange.label', default: 'Exchange')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                               args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="${message(code: 'exchange.id.label', default: 'Id')}"/>

                <g:sortableColumn property="endTime"
                                  title="${message(code: 'exchange.endTime.label', default: 'End Time')}"/>

                <th><g:message code="exchange.provider.label" default="Provider"/></th>

                <th><g:message code="exchange.receiver.label" default="Receiver"/></th>

                <g:sortableColumn property="startTime"
                                  title="${message(code: 'exchange.startTime.label', default: 'Start Time')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${exchangeInstanceList}" status="i" var="exchangeInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${exchangeInstance.id}">${fieldValue(bean: exchangeInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: exchangeInstance, field: "endTime")}</td>

                    <td>${fieldValue(bean: exchangeInstance, field: "provider")}</td>

                    <td>${fieldValue(bean: exchangeInstance, field: "receiver")}</td>

                    <td>${fieldValue(bean: exchangeInstance, field: "startTime")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${exchangeInstanceTotal}"/>
    </div>
</div>
</body>
</html>
