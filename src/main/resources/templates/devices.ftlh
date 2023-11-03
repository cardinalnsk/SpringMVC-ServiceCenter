<#import 'template/add-device.ftlh' as addDevice>
<#import 'template/list-device.ftlh' as deviceList>
<#import 'template/content-devices.ftlh' as contentDevice>
<#import 'template/base.ftlh' as base>

<@base.template user!>
    <@addDevice.addDevice categories!/>
<#--    <@contentDevice.listDevices devices/>-->
    <@deviceList.listDevices devices/>
</@base.template>


