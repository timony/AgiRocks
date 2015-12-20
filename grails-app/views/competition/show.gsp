<%@ page import="org.aspectj.bridge.MessageUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'competition.label', default: 'Competition')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<g:form resource="${this.competition}" method="DELETE" class="form-horizontal">
    <div class="panel panel-default">
        <div class="panel-body">
            <f:with bean="competition">
                <f:display property="name"/>
                <f:display property="days"/>
            </f:with>
        </div>

        <div class="panel-footer">
            <fieldset class="buttons">
                <g:link action="setCurrrentCompetition" resource="${this.competition}"
                        class="btn btn-default"><g:message
                        code="default.button.select.label"
                        default="Select"/></g:link>
                <g:link action="edit" resource="${this.competition}" class="btn btn-default"><g:message
                        code="default.button.edit.label"
                        default="Edit"/></g:link>
                <g:link controller="day" action="create" class="btn btn-default" params="[competitionId: this.competition.id]" ><g:message
                        code="default.button.add.label" args="[message(code: 'day.label')]"
                        default="Edit"/></g:link>
                <input class="btn btn-default" type="submit"
                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </div>
    </div>
</g:form>

</body>
</html>
