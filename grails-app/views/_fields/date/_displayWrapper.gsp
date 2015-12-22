<g:render template="/shared/wrapperTemplate">
    <p id="${property}id" class="form-control-static">
        <g:formatDate date="${value}" format="${cz.timony.agiRocks.AppConstants.DATE_FORMAT}"/>
    </p>
</g:render>