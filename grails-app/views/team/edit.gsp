<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

<g:render template="/shared/validationErrorsTemplate" model="[theBean: this.team]"/>

<g:form resource="${this.team}" method="PUT" class="form-horizontal">
    <fieldset class="form">
        <g:render template="form" />
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="create" class="btn btn-default"
                        value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        <g:link class="btn btn-default" action="index">
            <g:message code="default.button.cancel.label"/></g:link>
    </fieldset>
</g:form>

</body>
</html>
