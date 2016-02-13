<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${this.team}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<g:form resource="${this.team}" method="DELETE" class="form-horizontal">
    <div class="panel panel-default">
        <div class="panel-body">
            <f:with bean="team">
                <f:display property="workingBookNumber"/>
                <f:display property="firstName" />
                <f:display property="sureName"/>
                <f:display property="nickName"/>
                <f:display property="breed"/>
                <f:display property="osa"/>
                <f:display property="kennel"/>
            </f:with>
        </div>

        <div class="panel-footer">

            <fieldset class="buttons">
                <g:link action="edit" resource="${this.team}" class="btn btn-default">
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
