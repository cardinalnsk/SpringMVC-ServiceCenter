<#macro listDevices devices>
    <#list devices as device>
    <div class="row-columns m-4" data-masonry='{"percentPosition": true }'>
            <a href="/device/${device.id}" class="btn">

                <div class="card text-center">
                   <#if device.filename??> <img src="/img/${device.filename}"
                         class="card-img-top" height=150></#if>
                    <div class="card-body">
                        <h5 class="card-title">${device.deviceName}</h5>
                        <p class="card-text">${device.description}</p>
                        <p class="card-text">${device.trouble}</p>
                    </div>
                    <div class="card-footer">
                        ${device.client.name}
                        <br>
                        ${device.createdAt}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Нет устройств в ремонте</h1>
        </#list>
    </div>




</#macro>