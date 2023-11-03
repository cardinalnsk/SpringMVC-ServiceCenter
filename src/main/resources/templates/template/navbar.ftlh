<#macro navbar user>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a href="/"> <img src="/images/logo.png" class="navbar-brand" height="45" alt="ServiceCentr"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Переключатель навигации">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/device">Главная</a>
                    </li>
                    <#if !user.username??>
                        <li class="nav-item">
                            <a class="nav-link" href="/registration">Регистрация</a>
                        </li>
                    </#if>
                    <#if user.username??>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="/category" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Категории
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/category">Список категории</a></li>
                                <li><a class="dropdown-item" href="#">Другое действие</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="/category/add">Добавить категорию</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/client">Клиенты</a>
                        </li>
                        <#list user.roles as role>
                            <#if role="ADMIN">
                                <li class="nav-item">
                                    <a class="nav-link" href="/admin">ADMINCONTROL</a>
                                </li>
                            </#if>
                        </#list>



<#--                        </#if>-->
                    </#if>
<#--                    <li class="nav-item">-->
<#--                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Отключенная</a>-->
<#--                    </li>-->
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Поиск" aria-label="Поиск">
                    <button class="btn btn-outline-primary" type="submit">Поиск</button>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                </form>
                <#if user.username??>
                    <form class="d-flex m-2" action="/logout" method="post">
                        <button class="btn btn-outline-primary" type="submit" >Logout</button>
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                    </form>
                </#if>
            </div>
        </div>
    </nav>

</#macro>