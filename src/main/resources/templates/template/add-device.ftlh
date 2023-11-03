<#macro addDevice categories>
    <#import 'add-category.ftlh' as categoryAddForm>
    <@categoryAddForm.addCategory method="add"/>
    <div class="accordion " id="accordionExample">
        <div class="accordion-item collapsed">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne"
                        aria-expanded="true" aria-controls="collapseOne">
                    Добавить устройство
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
                 data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <div class="container-fluid col justify-content-center m-3 ">
                        <div class="row text-center justify-content-center m-3">
                            <h1>Добавление нового устройства</h1>
                        </div>
                        <form enctype="multipart/form-data" method="post" action="/device/add" id="#addForm">
                            <div class="row mb-3">
                                <label for="category" class="col-sm-3 col-form-label">Категория</label>
                                <div class="col-sm-8">
                                    <select class="form-select" id="category" name="category">
                                        <#list categories as category>
                                            <option  value="${category.id}" name="category" >${category.name}</option>
                                        </#list>
                                    </select>
                                </div>
                                <div class="col-sm-1">
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        +
                                    </button>
                                </div>

                            </div>
                            <div class="row mb-3">
                                <label for="name" class="col-sm-3 col-form-label">Название</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control " id="#deviceName" name="deviceName"
                                           placeholder="TopWay Ts18 3/32">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="client" class="col-sm-3 col-form-label ">Клиент</label>
                                <div class="col-sm-4 ">
                                    <input type="text" class="form-control" id="client" name="name"
                                           placeholder="Имя">
                                </div>
                                <div class="col-sm-4">
                                    <input type="tel" class="form-control" id="client" name="phone"
                                           placeholder="Телефон">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="description" class="col-sm-3 col-form-label ">Описание</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control " id="description" name="description"
                                           placeholder="Some description">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="trouble" class="col-sm-3 col-form-label ">Неисправность </label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control " id="trouble" name="trouble"
                                           placeholder="All trouble">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="formFile" class="col-sm-3 col-form-label">Фотографии</label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="file" id="formFile" name="file" accept="image/png, image/jpeg">
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