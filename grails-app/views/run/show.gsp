<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${this.run}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<g:form resource="${this.run}" method="DELETE" class="form-horizontal">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-md-3"><b><g:message code="property.name.label"/>:</b> ${run.name}</div>
                <div class="col-md-2"><b><g:message code="property.obstacleCount.label"/>:</b> ${run.obstacleCount}</div>
                <div class="col-md-2"><b><g:message code="property.length.label"/>:</b> ${run.length}</div>
                <div class="col-md-3"><b><g:message code="property.referee.label"/>:</b> ${run.referee}</div>
                <div class="col-md-2"><b><g:message code="property.date.label"/>:</b> <g:formatDate date="${run.day.date}" format="dd. MM. yyyy" /></div>
            </div>
        </div>
        <div class="panel-body">
            Content comes here
        </div>

        <div class="panel-footer">

            <fieldset class="buttons">
                <g:link action="edit" resource="${this.run}" class="btn btn-default">
                    <g:message code="default.button.edit.label" default="Edit"/>
                </g:link>
                <input class="btn btn-default" type="submit"
                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>

        </div>
    </div>
</g:form>
</body>
</html>
