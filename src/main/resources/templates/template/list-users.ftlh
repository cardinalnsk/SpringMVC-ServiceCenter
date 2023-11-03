<#macro listUsers users>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Имя</th>
            <th scope="col">Роль</th>
            <th scope="col">Активен</th>
            <th scope="col">Действие</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>
                    <div class="row text-center">
                        <a class="text-center" href="/user/${user.id}">
                            ${user.username}
                        </a>
                    </div>
                </td>
                <td><#list user.roles as role>${role}</td></#list>
                <td> <#if user.isActive??>Активен <#else> Нет</#if></td>
                <td>
                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                        <a href="/user/change-state/${user.id}">
                            <button type="button" class="btn btn-danger m-1">Change</button>
                        </a>
                        <a href="/user/delete/${user.id}">
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
</#macro>