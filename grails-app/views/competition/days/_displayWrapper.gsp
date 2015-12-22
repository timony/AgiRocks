<g:render template="/shared/wrapperTemplate">
    <table class="table table-condensed table-striped table-hover">
        <thead>
        <tr>
            <g:sortableColumn property="date" title="Date"/>
            <th>
                <g:message code="default.actions.label"/>
            </th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${value}" status="i" var="day">
            <tr>
                <td><g:link controller="day" action="show"
                            id="${day.id}">${fieldValue(bean: day, field: "date")}</g:link></td>
                <td>
                    <g:link controller="day" action="setCurrrentDay" id="${day.id}"
                            class="btn btn-xs btn-default"><g:message code="default.button.select.label"/>
                    </g:link>
                    <g:link controller="day" action="edit" id="${day.id}" class="btn btn-xs btn-default"><g:message
                            code="default.button.edit.label"/></g:link>
                    <g:form resource="${day}" method="DELETE" class="form-horizontal">
                        <input class="btn btn-xs btn-default" type="submit"
                               value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                               onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                    </g:form>
                </td>
            </tr>
        </g:each>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="2">
                <g:link controller="day" action="create" class="btn btn-default"
                        params="[competitionId: competition.id]"><g:message
                        code="default.button.add.label" args="[message(code: 'day.label')]"
                        default="Add"/></g:link>
            </td>
        </tr>
        </tfoot>
    </table>
</g:render>