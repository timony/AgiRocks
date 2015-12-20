<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'competition.label', default: 'Competition')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<table class="table table-striped table-hover">
    <thead>
    <tr>
        <g:sortableColumn property="name" title="Name"/>
        <th>
            <g:message code="default.actions.label"/>
        </th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${competitionList}" status="i" var="competition">
        <tr>
            <td><g:link action="show"
                        id="${competition.id}">${fieldValue(bean: competition, field: "name")}</g:link></td>
            <td>
                <g:link action="setCurrrentCompetition" id="${competition.id}"
                        class="btn btn-sm btn-default"><g:message code="default.button.select.label"/>
                </g:link>
                <g:link action="show" id="${competition.id}" class="btn btn-sm btn-default"><g:message
                        code="default.button.view.label"/></g:link>
                <g:link action="edit" id="${competition.id}" class="btn btn-sm btn-default"><g:message
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
    <g:paginate total="${competitionCount ?: 0}"/>
</div>
</body>
</html>