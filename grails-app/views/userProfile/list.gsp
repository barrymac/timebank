<%@ page import="timebank.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="create" controller="user" action="create"><g:message
            code="default.new.label"
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

                <g:sortableColumn property="username"
                                  title="${message(code: 'user.username.label', default: 'Username')}"/>
                <g:sortableColumn property="firstName"
                                  title="${message(code: 'user.firstName.label', default: 'First Name')}"/>
                <g:sortableColumn property="secondName"
                                  title="${message(code: 'user.secondName.label', default: 'Second Name')}"/>

                <g:sortableColumn property="balance"
                                  title="${message(code: 'user.secondName.label', default: 'Balance')}"/>
                <td></td>
                <td></td>

            </tr>
            </thead>
            <tbody>
            <g:each in="${userInstanceList}" status="i" var="userInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td>${fieldValue(bean: userInstance, field: "username")}</td>
                    <td>${fieldValue(bean: userInstance, field: "firstName")}</td>
                    <td>${fieldValue(bean: userInstance, field: "secondName")}</td>
                    <td>${fieldValue(bean: userInstance, field: "balance")}</td>
                    <td><g:link action="showBalance"
                                id="${userInstance.id}">Update Balance</g:link></td>
                    <td><g:link action="editUserProfile"
                                id="${userInstance.id}">Edit Profile</g:link></td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${userInstanceTotal}"/>
    </div>
</div>
</body>
</html>
