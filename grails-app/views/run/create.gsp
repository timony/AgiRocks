<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'run.label', default: 'Run')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<g:render template="/shared/validationErrorsTemplate" model="[theBean: this.run]"/>

<g:form action="save" class="form-horizontal">
    <fieldset class="form">
        <g:render template="form" />
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="create" class="btn btn-default"
                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
    </fieldset>
</g:form>

</body>
</html>
