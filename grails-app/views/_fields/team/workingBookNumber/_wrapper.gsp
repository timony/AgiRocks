<g:render template="/shared/wrapperTemplate">
    <script language="javascript">
        $(document).ready(function() {
            $("#${property}button").click(function() {
                var value = $("#${property}id").val();
                $.ajax({
                    type: "GET",
                    url: "http://www.kacr.info/books/xml?number=" + value,
                    crossDomain: true,
                    success: function(xml) {

                        var handler = $(xml).first('book').first('handler');
                        var dog = $(xml).first('book').find('dog');
                        var osa = handler.find('osa');
                        var size = $(xml).find('size').text();
                        $("#firstNameid").val(handler.find('first-name').text());
                        $("#sureNameid").val(handler.find('surname').text());
                        $("#osaid").val(osa.find('name').text());

                        if ('L'==size) {
                            $("#sizeL").prop("checked", true)
                        } else if ('M'==size) {
                            $("#sizeM").prop("checked", true)
                        } else if ('S'==size) {
                            $("#sizeS").prop("checked", true)
                        }

                        $("#dogNameid").val($(dog).children('name').text());

                        $("#breedid").val($(dog).find('breed').children('name').text());
                        $("#kennelid").val($(dog).children('kennel').text());


                    }
                })
            })
        });
    </script>

    <div class="input-group">
        <span class="input-group-btn">
            <button class="btn btn-default" type="button" id="${property}button">Kacr.info</button>
        </span>
        <g:textField name="${property}" value="${value}" id="${property}id" class="form-control" />
    </div>
</g:render>