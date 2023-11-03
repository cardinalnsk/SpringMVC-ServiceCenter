<#import 'template/base.ftlh' as t>
<#import 'template/list-clients.ftlh' as listClients>


<@t.template user!>
    <@listClients.listClients clients!/>
</@t.template>