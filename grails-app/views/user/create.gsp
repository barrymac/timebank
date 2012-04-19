<head>
    <meta name='layout' content='main'/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<br>

<h3><g:message code="default.add.user.label"/></h3>

<g:form action="save" name='userCreateForm'>

    <%
        def tabData = []
        tabData << [name: 'userinfo', icon: 'icon_user', messageCode: 'spring.security.ui.user.info']
    %>

    <table>
        <tbody>

        <s2ui:textFieldRow name='username' labelCode='user.username.label' bean="${user}"
                           labelCodeDefault='Username' value="${user?.username}"/>

        <s2ui:passwordFieldRow name='password' labelCode='user.password.label' bean="${user}"
                               labelCodeDefault='Password' value="${user?.password}"/>

        <tr class="prop">
            <td valign="top" class="name">
                <label for="firstName"><g:message code="user.firstName.label" default="First Name"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'firstName', 'errors')}">
                <g:textField name="firstName" value="${userInstance?.firstName}"/>
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name">
                <label for="secondName"><g:message code="user.secondName.label" default="Second Name"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'secondName', 'errors')}">
                <g:textField name="secondName" value="${userInstance?.secondName}"/>
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name">
                <label for="dob"><g:message code="user.dob.label" default="Dob"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'dob', 'errors')}">
                <joda:datePicker name="dob" value="${userInstance?.dob}"
                                 noSelection="['': '']"></joda:datePicker>
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name">
                <label for="balance"><g:message code="user.starting.balance.label" default="Balance"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'balance', 'errors')}">
                %{--<joda:periodPicker name="balance" value="${userInstance?.balance}"></joda:periodPicker>--}%
                <g:textField name="balance" value="${userInstance?.balance}"/>
                %{--<joda:timePicker name="balance" value="${userInstance?.balance}"/>--}%
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name">
                <label for="phoneNumber"><g:message code="user.phoneNumber.label" default="Phone Number"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'phoneNumber', 'errors')}">
                <g:textField name="phoneNumber" value="${userInstance?.phoneNumber}"/>
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name">
                <label for="email"><g:message code="user.email.label" default="Email"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                <g:field type="email" name="email" value="${userInstance?.email}"/>
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name">
                <label for="address"><g:message code="user.address.label" default="Address"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'address', 'errors')}">
                <g:select id="address" name="address.id" from="${timebank.Address.list()}" optionKey="id"
                          value="${userInstance?.address?.id}" class="many-to-one" noSelection="['null': '']"/>
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name">
                <label for="createdRequests"><g:message code="user.createdRequests.label"
                                                        default="Created Requests"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'createdRequests', 'errors')}">

                <ul class="one-to-many">
                    <g:each in="${userInstance?.createdRequests ?}" var="c">
                        <li><g:link controller="request" action="show"
                                    id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                    </g:each>
                    <li class="add">
                        <g:link controller="request" action="create"
                                params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'request.label', default: 'Request')])}</g:link>
                    </li>
                </ul>

            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name">
                <label for="exchangesProvided"><g:message code="user.exchangesProvided.label"
                                                          default="Exchanges Provided"/></label>
            </td>
            <td valign="top"
                class="value ${hasErrors(bean: userInstance, field: 'exchangesProvided', 'errors')}">

                <ul class="one-to-many">
                    <g:each in="${userInstance?.exchangesProvided ?}" var="e">
                        <li><g:link controller="exchange" action="show"
                                    id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                    </g:each>
                    <li class="add">
                        <g:link controller="exchange" action="create"
                                params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'exchange.label', default: 'Exchange')])}</g:link>
                    </li>
                </ul>

            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name">
                <label for="exchangesReceived"><g:message code="user.exchangesReceived.label"
                                                          default="Exchanges Received"/></label>
            </td>
            <td valign="top"
                class="value ${hasErrors(bean: userInstance, field: 'exchangesReceived', 'errors')}">

                <ul class="one-to-many">
                    <g:each in="${userInstance?.exchangesReceived ?}" var="e">
                        <li><g:link controller="exchange" action="show"
                                    id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                    </g:each>
                    <li class="add">
                        <g:link controller="exchange" action="create"
                                params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'exchange.label', default: 'Exchange')])}</g:link>
                    </li>
                </ul>

            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name">
                <label for="offeredSkills"><g:message code="user.offeredSkills.label"
                                                      default="Offered Skills"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'offeredSkills', 'errors')}">
                <g:select name="offeredSkills" from="${timebank.Skill.list()}" multiple="multiple"
                          optionKey="id" size="5" value="${userInstance?.offeredSkills*.id}"
                          class="many-to-many"/>
            </td>
        </tr>
        </tbody>
    </table>

    <div class="buttons">
        <span class="button">
            <g:actionSubmit class="save" action="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </span>
    </div>

</g:form>

<script>
    $(document).ready(function () {
        $('#username').focus();
        <s2ui:initCheckboxes/>
    });
</script>

</body>
