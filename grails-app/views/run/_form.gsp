<f:with bean="run">
    <g:hiddenField name="day.id" value="${session["currentDay"].id}"/>
    <f:field property="name" />
    <f:field property="obstacleCount"/>
    <f:field property="length"/>
    <f:field property="referee"/>
</f:with>