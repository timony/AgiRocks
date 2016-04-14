<div class="form-group ${hasErrors(bean:bean,field:property,'has-error')}">
    <label for="${property}id" class="col-sm-4 control-label">${label} <g:if test="required">*</g:if></label>
    <div class="col-sm-8">
        ${raw(body())}
    </div>
</div>