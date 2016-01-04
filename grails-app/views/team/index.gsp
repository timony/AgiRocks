<%@ page import="agirocks.Competition" %>
<!DOCTYPE html>
<html>
<head>
    <export:resource />
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'team.label', default: 'Competition')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>

    <script type="text/javascript">
        $(document).ready(function () {

            (function ($) {

                $('#filter').keyup(function () {

                    var rex = new RegExp($(this).val(), 'i');
                    $('.searchable tr').hide();
                    $('.searchable tr').filter(function () {
                        return rex.test($(this).text());
                    }).show();

                })

            }(jQuery));

        });

        $(function () {
            $("[data-toggle='tooltip']").tooltip();
        });
    </script>

</head>

<body>

<table class="table table-striped table-hover table-condensed   ">
    <thead>
    <tr>
        <th></th>
        <g:sortableColumn property="size" titleKey="size.label"/>
        <g:sortableColumn property="category" titleKey="category.label"/>
        <g:sortableColumn property="firstName" titleKey="property.firstName.label"/>
        <g:sortableColumn property="sureName" titleKey="property.sureName.label"/>
        <g:sortableColumn property="dogName" titleKey="property.dogName.label"/>
        <g:sortableColumn property="breed" titleKey="property.breed.label"/>
        <th>
            <div class="input-group input-group-sm" style="width: 150px;">
                <span class="input-group-addon" id="addon1">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </span>

                <input id="filter" type="text" class="input-lg form-control"
                       placeholder="${message(code: 'type.here.label')}" aria-describedby="addon1" style="width: 100%;">
            </div>
        </th>
    </tr>
    </thead>
    <tbody class="searchable">
    <g:each in="${teamList}" status="i" var="team">
        <tr>
            <td>
                <g:each in="${days}" var="day" status="j">
                    <g:checkBox name="myCheckbox" value="${false}" data-toggle="tooltip" data-original-title="${day}"/>
                </g:each>
            </td>
            <td align="right">${fieldValue(bean: team, field: 'size')}</td>
            <td>${fieldValue(bean: team, field: 'category')}</td>
            <td><g:link action="show"
                        id="${team.id}">${fieldValue(bean: team, field: "firstName")}</g:link></td>
            <td>${fieldValue(bean: team, field: 'sureName')}</td>
            <td>${fieldValue(bean: team, field: 'dogName')}</td>
            <td>${fieldValue(bean: team, field: 'breed')}</td>
            <td>
                <g:link action="show" id="${team.id}" class="btn btn-xs btn-default"><g:message
                        code="default.button.view.label"/></g:link>
                <g:link action="edit" id="${team.id}" class="btn btn-xs btn-default"><g:message
                        code="default.button.edit.label"/></g:link>
            </td>
        </tr>
    </g:each>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="8">
            <g:link class="btn btn-default" action="create"><g:message code="default.new.label"
                                                                       args="[entityName]"/></g:link>
            <g:link class="btn btn-default" action="json">JSON</g:link>
            <export:formats action="testPrintPdf" formats="['pdf','csv']" />
        </td>
    </tr>
    </tfoot>
</table>

<div class="pagination">
    <g:paginate total="${teamCount ?: 0}"/>
</div>
</body>
</html>