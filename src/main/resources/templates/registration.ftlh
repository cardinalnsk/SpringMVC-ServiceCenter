<#import 'template/base.ftlh' as t>
<#import 'template/registration-form.ftlh' as reg>

<@t.template user?if_exists>
    <@reg.registrationForm/>
</@t.template>