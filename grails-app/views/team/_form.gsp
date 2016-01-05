<f:with bean="team">
    <g:hiddenField name="competition.id" value="${session["currentCompetition"].id}"/>
    <f:field property="firstName"/>
    <f:field property="sureName"/>
    <f:field property="dogName"/>
    <f:field property="nick"/>
    <f:field property="breed"/>
    <f:field property="category"/>
    <f:field property="size"/>
    <f:field property="osa"/>
</f:with>