<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'run.label', default: 'Run')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

<g:render template="/shared/validationErrorsTemplate" model="[theBean: this.run]"/>

<g:form resource="${this.run}" method="PUT" class="form-horizontal">
    <fieldset class="form">
        <g:render template="form" />
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="create" class="btn btn-default"
                        value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        <g:link class="btn btn-default" controller="day" action="show" id="${run.day.id}">
            <g:message code="default.button.cancel.label"/></g:link>
    </fieldset>
</g:form>

</body>
</html>
