<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'day.label', default: 'Day')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<table class="table table-striped table-hover">
    <thead>
    <tr>
        <g:sortableColumn property="date" title="Date"/>
        <th>
            <g:message code="default.actions.label"/>
        </th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${dayList}" status="i" var="day">
        <tr>
            <td><g:link action="show" id="${day.id}">${fieldValue(bean: day, field: "date")}</g:link></td>
            <td>
                <g:link action="setCurrrentDay" id="${day.id}"
                        class="btn btn-sm btn-default"><g:message code="default.button.select.label"/>
                </g:link>
                <g:link action="show" id="${day.id}" class="btn btn-sm btn-default"><g:message
                        code="default.button.view.label"/></g:link>
                <g:link action="edit" id="${day.id}" class="btn btn-sm btn-default"><g:message
                        code="default.button.edit.label"/></g:link>
            </td>

        </tr>
    </g:each>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="2">
            <g:link class="btn btn-default" action="create"><g:message code="default.new.label"
                                                                       args="[entityName]"/></g:link>
        </td>
    </tr>
    </tfoot>
</table>

<div class="pagination">
    <g:paginate total="${dayCount ?: 0}"/>
</div>

</body>
</html>