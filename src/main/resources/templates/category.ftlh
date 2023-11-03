<#import 'template/list-device.ftlh' as deviceList>
<#import 'template/base.ftlh' as base>

<@base.template user!>
    <@deviceList.listDevices devices/>
</@base.template>