<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'competition.label', default: 'Competition')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<g:render template="/shared/validationErrorsTemplate" model="[theBean: this.competition]"/>

<g:form action="save" class="form-horizontal">
    <f:with bean="competition">
        <fieldset class="form">
            <f:field property="name"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="btn btn-default"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            <g:link class="btn btn-default" action="index"><g:message code="default.button.cancel.label" /></g:link>
        </fieldset>
    </f:with>
</g:form>

</body>
</html>
