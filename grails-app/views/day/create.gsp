<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'day.label', default: 'Day')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<g:render template="/shared/validationErrorsTemplate" model="[theBean: this.day]"/>

<g:form action="save" class="form-horizontal">
    <fieldset class="form">
        <f:with bean="day">
            <f:display property="competition"/>
            <f:field property="date"/>
            <g:hiddenField name="competition.id" value="${this.day.competition.id}" />
        </f:with>
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="create" class="btn btn-default"
                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        <g:link class="btn btn-default" controller="competition" action="show" id="${day.competition.id}">
            <g:message code="default.button.cancel.label"/></g:link>
    </fieldset>
</g:form>

</body>
</html>
