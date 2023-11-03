<#macro loginForm>
    <div class="container-fluid col justify-content-center">

    <form action="/login" method="post">
        <div class="row mb-3">
            <label for="username" class="col-sm-1 col-form-label">Login:</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="username" name="username" placeholder="Name">
            </div>
        </div>
        <div class="row mb-3">
            <label for="password" class="col-sm-1 col-form-label">Password:</label>
            <div class="col-sm-5">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="row mb-3">
        <input type="submit" class="col-sm-2 text-center btn btn-primary" value="Вход"/>
            <div class="col-sm-2 me-3">
                <button type="button" class="btn btn-link">
                <a href="/registration">Зарегистрироваться</a></button>
            </div>
        </div>

    </form>
    </div>
</#macro>

