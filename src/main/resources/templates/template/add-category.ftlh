<#macro addCategory method>
    <!-- Модальное окно -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Редактировать категорию</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                </div>
                <div class="modal-body">
                    <form enctype="multipart/form-data" method="post" action="/category/${method}">
                        <div class="row mb-3">
                            <label for="categoryName" class="col-sm-3 col-form-label m-4">Название</label>
                            <div class="col-sm m-4">
                                <input type="text" class="form-control " id="categoryName" name="name"
                                       placeholder="Название категории">
                            </div>
                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <div class="modal-footer">
                            <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Отмена</button>
                            <button type="submit" class="btn btn-primary">Сохранить</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</#macro>