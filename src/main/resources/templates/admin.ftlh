<#import 'template/base.ftlh' as t>
<#include 'template/list-device.ftlh'>
<#include 'template/list-categories.ftlh'>
<#include 'template/list-clients.ftlh'>
<#include 'template/list-users.ftlh'>


<@t.template user!>

    <div class="d-flex align-items-start  col-sm-2">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">Пользователи</button>
            <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">Клиенты</button>
            <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">Устройства</button>
            <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">Категории</button>
        </div>
        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active col-sm" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab"><@listUsers users!/></div>
            <div class="tab-pane fade col-sm" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab"><@listClients clients!/></div>
            <div class="tab-pane fade col-sm" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab"><@listDevices devices!/></div>
            <div class="tab-pane fade col-sm" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab"><@catList categories!/></div>
        </div>
    </div>

</@t.template>