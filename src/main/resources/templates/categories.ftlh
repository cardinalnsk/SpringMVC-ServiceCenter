<#import 'template/base.ftlh' as t>
<#import 'template/list-categories.ftlh' as listCat>


<@t.template user!>
    <@listCat.catList categories/>
</@t.template>