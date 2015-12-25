<div class="form-group ${hasErrors(bean:bean,field:property,'has-error')}">
    <label for="${property}id" class="col-sm-2 control-label">${label} <g:if test="required">*</g:if></label>
    <div class="col-sm-10">
        ${raw(body())}
    </div>
</div>