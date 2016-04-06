<g:render template="/shared/wrapperTemplate">
    <g:set var="sdf" value="${new java.text.SimpleDateFormat('dd. MM. yyyy')}"/>
    <g:select class="form-control" name="${property}" optionKey="id"  from="${dayList}" value="${value?.id}"/>
</g:render>