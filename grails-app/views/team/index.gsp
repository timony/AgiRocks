<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'team.label', default: 'Competition')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<table class="table table-striped table-hover">
    <thead>
    <tr>
        <g:sortableColumn property="category" titleKey="category.label"/>
        <g:sortableColumn property="size" titleKey="size.label"/>
        <g:sortableColumn property="fullTeamName" titleKey="property.fullTeamName.label"/>
        <g:sortableColumn property="breed" titleKey="property.breed.label"/>
        <th>
            <g:message code="default.actions.label"/>
        </th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${teamList}" status="i" var="team">
        <tr>
            <td>${fieldValue(bean: team, field: 'category')}</td>
            <td>${fieldValue(bean: team, field: 'size')}</td>
            <td><g:link action="show"
                        id="${team.id}">${fieldValue(bean: team, field: "fullTeamName")}</g:link></td>
            <td>${fieldValue(bean: team, field: 'breed')}</td>
            <td>
                <g:link action="setCurrrentCompetition" id="${team.id}"
                        class="btn btn-sm btn-default"><g:message code="default.button.select.label"/>
                </g:link>
                <g:link action="show" id="${team.id}" class="btn btn-sm btn-default"><g:message
                        code="default.button.view.label"/></g:link>
                <g:link action="edit" id="${team.id}" class="btn btn-sm btn-default"><g:message
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
    <g:paginate total="${teamCount ?: 0}"/>
</div>
</body>
</html>