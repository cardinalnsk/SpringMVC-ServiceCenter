<#macro listClients clients>
<div class="container-fluid">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Имя</th>
            <th scope="col">Телефон</th>
            <th scope="col">Действие</th>
        </tr>
        </thead>
        <tbody>
        <#list clients as client>
            <tr>
                <td>
                    <div class="row text-center">
                        <a class="text-center" href="/client/${client.id}">
                            ${client.name}
                        </a>
                    </div>
                </td>
                <td>${client.phone}</td>
                <td>
                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                        <a href="/client/delete/${client.id}">
                            <button type="button" class="btn btn-danger m-1">Удалить</button>
                        </a>
                    </div>
                </td>
            </tr>
        <#else>
            <h3>Нет клиентов</h3>
        </#list>
        </tbody>
    </table>
</div>
</#macro>