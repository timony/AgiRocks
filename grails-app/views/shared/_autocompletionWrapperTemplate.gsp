<g:render template="/shared/wrapperTemplate">
    <script type="text/javascript">
        $(document).ready(function() {
            $("input[name='${property}']").autocomplete({
                source: function(request, response){
                    $.ajax({
                        url: "${source}", // remote datasource
                        data: request,
                        success: function(data){
                            response(data); // set the response
                        },
                        error: function(){ // handle server errors
                            console.log("Cannot ajax values for the field: ${property}")
                        }
                    });
                },
                autoFocus: true,
                delay: 0,
                minLength: 2 // triggered only after minimum 2 characters have been entered.

            });
        });
    </script>
    <g:textField name="${property}" value="${value}" id="${property}id" class="form-control"/>
</g:render>