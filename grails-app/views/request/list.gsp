<%@ page import="timebank.Request" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'request.label', default: 'Request')}"/>
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

                <g:sortableColumn property="id" title="${message(code: 'request.id.label', default: 'Id')}"/>

                <g:sortableColumn property="complete"
                                  title="${message(code: 'request.complete.label', default: 'Complete')}"/>

                <g:sortableColumn property="dateCreated"
                                  title="${message(code: 'request.dateCreated.label', default: 'Date Created')}"/>

                <g:sortableColumn property="description"
                                  title="${message(code: 'request.description.label', default: 'Description')}"/>

                <g:sortableColumn property="lastUpdated"
                                  title="${message(code: 'request.lastUpdated.label', default: 'Last Updated')}"/>

                <th><g:message code="request.requester.label" default="Requester"/></th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${requestInstanceList}" status="i" var="requestInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${requestInstance.id}">${fieldValue(bean: requestInstance, field: "id")}</g:link></td>

                    <td><g:formatBoolean boolean="${requestInstance.complete}"/></td>

                    <td>${fieldValue(bean: requestInstance, field: "dateCreated")}</td>

                    <td>${fieldValue(bean: requestInstance, field: "description")}</td>

                    <td>${fieldValue(bean: requestInstance, field: "lastUpdated")}</td>

                    <td>${fieldValue(bean: requestInstance, field: "requester")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${requestInstanceTotal}"/>
    </div>
</div>
</body>
</html>
