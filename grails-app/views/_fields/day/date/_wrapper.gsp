<!-- f:all in edits -->
<div class="form-group ${hasErrors(bean:bean,field:property,'has-error')}">
    <label for="${property}id" class="col-sm-2 control-label">${label}</label>
    <div class="col-sm-10">
        <g:datePicker name="${property}" value="${value}" precision="day" id="${property}id" class="form-control" />
    </div>
</div>
