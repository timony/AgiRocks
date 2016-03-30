<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}"/>
    <title><g:message code="default.import.label" args="['Kacr']"/></title>
</head>

<body>

<g:render template="/shared/validationErrorsTemplate" model="[theBean: this.team]"/>
<g:uploadForm action="doImport">
    <fieldset class="form">
        <g:field type="file" name="inputFile" />
        <g:submitButton name="doImport" class="btn btn-default"
                        value="${message(code: 'default.button.import.label', args: ['Kacr'], default: 'Update')}"/>
    </fieldset>

</g:uploadForm>

</body>
</html>