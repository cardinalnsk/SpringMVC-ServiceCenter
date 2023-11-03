<#macro catList categories>
    <#import 'add-category.ftlh' as modal>
    <div class="container-fluid col-sm-12">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Название</th>
            <th scope="col">Действие</th>
        </tr>
        </thead>
        <tbody>
        <#list categories as category>
            <tr>
                <td>
                    <div class="row text-center">
                        <a class="text-center" href="/category/${category.id}">
                            ${category.name}
                        </a>
                    </div>
                </td>
                <td>
                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                        <@modal.addCategory method="put/${category.id}"/>
                        <button type="button" class="btn btn-success m-1" data-bs-toggle="modal" data-bs-target="#exampleModal">Редактировать</button>
                        <a href="/category/delete/${category.id}">
                            <button type="button" class="btn btn-danger m-1">Удалить</button>
                        </a>
                    </div>
                </td>
            </tr>
        <#else>
            <h3>Нет категорий</h3>
        </#list>
        </tbody>
    </table>
    </div>

    <div class="accordion " id="accordionExample">
        <div class="accordion-item collapsed">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne"
                        aria-expanded="true" aria-controls="collapseOne">
                    Добавить категорию
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
                 data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <div class="container-fluid col justify-content-center m-3">
                        <form enctype="multipart/form-data" method="post" action="/category/add">
                            <div class="row mb-3">
                                <label for="name" class="col-sm-2 col-form-label">Название</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control " id="name" name="name"
                                           placeholder="Магнитола">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Добавить</button>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</#macro>