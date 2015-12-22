<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${this.day}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<g:form resource="${this.day}" method="DELETE" class="form-horizontal">
    <div class="panel panel-default">
        <div class="panel-body">
            <f:with bean="day">
                <f:display property="competition" />
                <f:display property="date"/>
            </f:with>
        </div>

        <div class="panel-footer">

            <fieldset class="buttons">
                <g:link action="edit" resource="${this.day}" class="btn btn-default">
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
