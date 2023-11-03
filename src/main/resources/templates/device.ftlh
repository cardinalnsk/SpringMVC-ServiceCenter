<#import 'template/base.ftlh' as t>

<@t.template user!>

    <div class="card text-center">
        <div class="card-header">
            <h3>${device.deviceName}</h3>
        </div>
        <img src="/img/${device.filename}" class="card-img-top" alt="...">
        <div class="card-body">
            <p class="card-text">${device.description}</p>
            <p/>
            <p class="card-text">${device.trouble}</p>
        </div>
        <div class="card-footer text-muted">
           <div class="footer-text">
               ${device.client.name}
              <p/>
               ${device.createdAt}
           </div>
        </div>
    </div>



<#--    <div class="card text-center">-->
<#--        <div class="card-header">-->
<#--            id: ${device.id} - ${device.name}-->
<#--        </div>-->
<#--        <div class="card-body">-->
<#--            <h5 class="card-title">${device.description}</h5>-->
<#--            <p class="card-text">${device.trouble}</p>-->
<#--            <a href="#" class="btn btn-primary">More</a>-->
<#--        </div>-->
<#--        <img src="/img/${device.filename}" class="card-img-top" height="150" width="150">-->

<#--        <div class="card-footer text-muted">-->
<#--            ${device.client.name} ${device.createdAt}-->
<#--        </div>-->
<#--    </div>-->
</@t.template>

