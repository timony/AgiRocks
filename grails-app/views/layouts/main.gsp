<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="generator" content="Bootply"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
</head>

<body>
<ol class="breadcrumb">
    <g:if test="${session.currentCompetition}">
        <li><g:link controller="competition" action="show"
                    id="${session.currentCompetition.id}">Competition: ${session.currentCompetition.name}</g:link></li>
    </g:if>
    <g:if test="${session.currentDay}">
        <li><g:link controller="day" action="show"
                    id="${session.currentDay.id}">Day: ${session.currentDay.date.format('dd. MM. yyyy')}</g:link></li>
    </g:if>
</ol>

<div class="navbar navbar-default">
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
                <li><g:link controller="competition">Competitions</g:link></li>
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
    </div>
    <g:layoutBody/>

</div>

</body>
</html>
