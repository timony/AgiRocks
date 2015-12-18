<g:hasErrors bean="${theBean}">
    <g:eachError bean="${theBean}" var="error">
        <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <g:message error="${error}"/>
        </div>
    </g:eachError>
</g:hasErrors>