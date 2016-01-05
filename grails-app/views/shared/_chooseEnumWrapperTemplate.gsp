<g:render template="/shared/wrapperTemplate">
    <g:each in="${values}">
        <div class="checkbox-inline">
            <label>
                <g:radio name="${property}" id="${property}${it}" value="${it}" checked="${value == it}" />
                ${it.name()}
            </label>
        </div>

    </g:each>
</g:render>