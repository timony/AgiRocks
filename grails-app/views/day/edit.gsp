<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'day.label', default: 'Day')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

<g:render template="/shared/validationErrorsTemplate" model="[theBean: this.day]"/>

<g:form resource="${this.day}" method="PUT" class="form-horizontal">
    <fieldset class="form">
        <f:with bean="day">
            <f:display property="competition"/>
            <f:field property="date"/>
        </f:with>
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="create" class="btn btn-default"
                        value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        <g:link class="btn btn-default" controller="competition" action="show" id="${day.competition.id}">
            <g:message code="default.button.cancel.label"/></g:link>
    </fieldset>
</g:form>
</body>
</html>
