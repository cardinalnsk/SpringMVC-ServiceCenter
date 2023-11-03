<#macro listDevices devices>
    <div class="container-fluid">
    <table class="table">
        <thead>
        <tr>

            <th scope="col">Img</th>
            <th scope="col">Название</th>
            <th scope="col">Клиент</th>
            <th scope="col">Описание</th>
            <th scope="col">Неисправность</th>
            <th scope="col">Дата приема</th>
            <th scope="col">Категория</th>
            <th scope="col">Действие</th>
        </tr>
        </thead>
        <tbody>
        <#list devices as device>
            <tr>
                <td>
                    <#if device.filename??>
                        <img src="/img/${device.filename}" class="img-thumbnail" alt="" height="50">
                    </#if>
                </td>
                <td><a href="/device/${device.id}">${device.deviceName}</a></td>
                <td><a href="/client/${device.client.id}"> ${device.client.name}</a></td>
                <td>${device.description}</td>
                <td>${device.trouble}</td>
                <td>${device.createdAt}</td>
                <td><a href="/category/${device.category.id}">${device.category.name}</a></td>
                <td>
                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                        <button type="button" class="btn btn-success m-1" data-bs-toggle="modal" data-bs-target="#exampleModal">Редактировать</button>
                        <a href="/device/delete/${device.id}">
                            <button type="button" class="btn btn-danger m-1">Удалить</button>
                        </a>
                    </div>
                </td>
            </tr>
        <#else>
            <h3>Нет устройств в ремонте</h3>
        </#list>
        </tbody>
    </table>
    </div>
</#macro>