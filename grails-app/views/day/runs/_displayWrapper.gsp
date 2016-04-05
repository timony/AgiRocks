<g:render template="/shared/wrapperTemplate">
    <table class="table table-condensed table-striped table-hover">
        <thead>
        <tr>
            <g:sortableColumn property="name" title="Name"/>
            <th><g:message code="property.obstacleCount.label"/></th>
            <th><g:message code="property.length.label"/></th>
            <th><g:message code="property.referee.label"/></th>
            <th><g:message code="default.actions.label"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${value}" status="i" var="run">
            <tr>
                <td><g:link controller="run" action="show"
                            id="${run.id}">${run.name}</g:link></td>
                <td>${run.obstacleCount}</td>
                <td>${run.length}</td>
                <td>${run.referee}</td>
                <td>
                    <g:link controller="run" action="setCurrrentRun" id="${run.id}"
                            class="btn btn-xs btn-default"><g:message code="default.button.select.label"/>
                    </g:link>
                    <g:link controller="run" action="edit" id="${day.id}" class="btn btn-xs btn-default"><g:message
                            code="default.button.edit.label"/></g:link>
                </td>
            </tr>
        </g:each>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="5">
                <g:link controller="run" action="create" class="btn btn-default"
                        params="[dayId: day.id]"><g:message
                        code="default.button.add.label" args="[message(code: 'run.label')]"
                        default="Add"/></g:link>
            </td>
        </tr>
        </tfoot>
    </table>
</g:render>