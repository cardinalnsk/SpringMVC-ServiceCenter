<#import 'template/base.ftlh' as t>
<#import 'template/login-form.ftlh' as login>

<@t.template user!>
    <@login.loginForm/>
</@t.template>