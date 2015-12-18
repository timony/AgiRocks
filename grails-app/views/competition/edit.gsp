<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'competition.label', default: 'Competition')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="panel panel-default">
    <g:form resource="${this.competition}" method="PUT" class="form-horizontal">
        <div class="panel-body">
            <g:hiddenField name="version" value="${this.competition?.version}"/>
            <fieldset class="form">
                <f:with bean="competition">
                    <f:field property="name"/>
                </f:with>
            </fieldset>
        </div>
        <div class="panel-footer">
            <fieldset class="buttons">
                <input class="btn btn-default" type="submit"
                       value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                <g:link class="btn btn-default" action="show" id="${this.competition.id}"><g:message code="default.button.cancel.label" /></g:link>
            </fieldset>
        </div>
    </g:form>
</div>
</body>
</html>
