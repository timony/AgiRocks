<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<g:render template="/shared/validationErrorsTemplate" model="[theBean: this.team]"/>

<g:form action="save" class="form-horizontal">
    <f:with bean="team">
        <fieldset class="form">
            <g:hiddenField name="competition.id" value="${session["currentCompetition"].id}" />
            <f:field property="firstName" value="Xx"/>
            <f:field property="sureName" value="Yy"/>
            <f:field property="dogName" value="SomeDog"/>
            <f:field property="nick"/>
            <f:field property="breed"/>
            <f:field property="category" value="A2"/>
            <f:field property="size" value="M"/>
            <f:field property="osa"/>
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
