<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title><g:layoutTitle default="AgiRocks"/></title>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <script type="text/javascript">

        $(document).ready(function () {

            window.setTimeout(function () {
                $(".alert").fadeTo(1000, 0).slideUp(1000, function () {
                    $(this).remove();
                });
            }, 3000);

        });
    </script>
    <g:layoutHead/>
</head>

<body>
<ol class="breadcrumb">
    <g:if test="${session.currentCompetition}">
        <li><g:link controller="competition" action="show" class="btn btn-default"
                    id="${session.currentCompetition.id}">
                <g:message code="competition.label"/>: ${session.currentCompetition.name}
            </g:link>

        </li>
    </g:if>
    <g:if test="${session.currentDay}">
        <li><g:link controller="day" action="show" class="btn btn-default"
                    id="${session.currentDay.id}">
            <g:message code="day.label" />: ${session.currentDay.date.format('dd. MM. yyyy')}</g:link></li>
    </g:if>
    <g:if test="${session.currentRun}">
        <li><g:link controller="run" action="show" class="btn btn-default"
                    id="${session.currentRun.id}">
            <g:message code="run.label" />: ${session.currentRun.name}</g:link></li>
    </g:if>
</ol>

<div class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${createLink(uri: '/')}">
                <g:message code="default.home.label"/>
            </a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><g:link controller="competition"><g:message code="competitions.label"/></g:link></li>
                <li><g:link controller="team"><g:message code="teams.label"/></g:link></li>
            </ul>
        </div>

    </div>

</div>

<div class="container">

    <div class="page-header">
        <h3><g:layoutTitle default="Grails"/></h3>
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="alert">${flash.message}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger" role="alert">${flash.error}</div>
        </g:if>
    </div>
    <g:layoutBody/>

</div>

</body>
</html>
