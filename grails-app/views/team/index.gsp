<%@ page import="agirocks.Registration; agirocks.Competition" %>
<!DOCTYPE html>

<g:set var="registrationService" bean="registrationService"/>
<html>
<head>
    <export:resource />
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'team.label', default: 'Competition')}"/>
    <title>
        <g:message code="default.list.label" args="[entityName]"/>
    </title>

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
<div class="modal fade" id="statisticModal" tabindex="-1" role="dialog" aria-labelledby="Statistics" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><g:message code="statistics.label"/></h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-4 "><strong><g:message code="overall.label" /></strong></div>
                    <div class="col-md-4 col-md-offset-4">${teamCount}</div>
                </div>
                <div class="row">
                    <div class="col-md-4 "><strong><g:message code="size.label" /></strong></div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1"><strong><g:message message="${agirocks.Size.S.toString()}" /></strong></div>
                    <div class="col-md-4 col-md-offset-3">${teamSCount}</div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1"><strong><g:message message="${agirocks.Size.M.toString()}" /></strong></div>
                    <div class="col-md-4 col-md-offset-3">${teamMCount}</div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1"><strong><g:message message="${agirocks.Size.L.toString()}" /></strong></div>
                    <div class="col-md-4 col-md-offset-3">${teamLCount}</div>
                </div>
                <div class="row">
                    <div class="col-md-4 "><strong><g:message code="category.label" /></strong></div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1"><strong><g:message message="${agirocks.Category.A1.toString()}" /></strong></div>
                    <div class="col-md-4 col-md-offset-3">${teamA1Count}</div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1"><strong><g:message message="${agirocks.Category.A2.toString()}" /></strong></div>
                    <div class="col-md-4 col-md-offset-3">${teamA2Count}</div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1"><strong><g:message message="${agirocks.Category.A3.toString()}" /></strong></div>
                    <div class="col-md-4 col-md-offset-3">${teamA3Count}</div>
                </div>
                <div class="row">
                    <div class="col-md-4 "><strong><g:message code="billing.label" /></strong></div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1"><strong><g:message code="overall.label" /></strong></div>
                    <div class="col-md-4 col-md-offset-3">${paidSum}</div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1"><strong><g:message code="billing.already.paid.label" /></strong></div>
                    <div class="col-md-4 col-md-offset-3">${paidCount}</div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1"><strong><g:message code="billing.not.yet.paid.label" /></strong></div>
                    <div class="col-md-4 col-md-offset-3">${notPaidCount}</div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><g:message code="default.button.close.label" /></button>
            </div>
        </div>
    </div>
</div>

<table class="table table-striped table-hover table-condensed">
    <thead>
    <tr>
        <th>
            <span class="glyphicon glyphicon-scale" data-toggle="modal" data-target="#statisticModal" />
        </th>
        <g:sortableColumn property="paid" titleKey="paid.label"/>
        <g:sortableColumn property="size" titleKey="size.label"/>
        <g:sortableColumn property="category" titleKey="category.label"/>
        <g:sortableColumn property="workingBookNumber" titleKey="property.workingBookNumber.label"/>
        <g:sortableColumn property="firstName" titleKey="property.firstName.label"/>
        <g:sortableColumn property="sureName" titleKey="property.sureName.label"/>
        <g:sortableColumn property="dogName" titleKey="property.dogName.label"/>
        <g:sortableColumn property="paid" titleKey="property.paid.label"/>
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

                    <g:checkBox name='registredToDay'
                                id="register_${team.id}_${day.id}"
                                value="${registrations.get(team.id).get(day.id)}"
                                data-toggle="tooltip" data-original-title="${day}"
                                onclick="${remoteFunction(
                                            controller: 'team',
                                            action: 'toggleRegistered',
                                            id: team.id,
                                            update: 'register_'+team.id+'_'+day.id,
                                            params: '\'registered=\' + this.checked + \'&dayId=\' + ' + day.id
                                )}" />
                </g:each>
            </td>
            <td>${fieldValue(bean: team, field: 'paid')}</td>
            <td align="right">${fieldValue(bean: team, field: 'size')}</td>
            <td>${fieldValue(bean: team, field: 'category')}</td>
            <td>${fieldValue(bean: team, field: 'workingBookNumber')}</td>
            <td><g:link action="show"
                        id="${team.id}">${fieldValue(bean: team, field: "firstName")}</g:link></td>
            <td>${fieldValue(bean: team, field: 'sureName')}</td>
            <td><div data-toggle="tooltip" data-original-title="${team.breed}">${fieldValue(bean: team, field: 'dogName')}</div></td>
            <td>${fieldValue(bean: team, field: 'paid')}</td>
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
        <td colspan="10">
            <g:link class="btn btn-default" action="create"><g:message code="default.new.label"
                                                                       args="[entityName]"/></g:link>

            <g:link class="btn btn-default" action="importTeams"><g:message code="default.button.import.label"
                                                                       args="['Kacr']"/></g:link>

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