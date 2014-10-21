//= require active_admin/base

//= require ckeditor/init

//= require jquery.mask.min


$(document).ready(function () {
    //valido para o Brasil apenas
//    todo now - arrumar pra pegar pelo keyup e fazer a mascara dos tel a medida q a pessoa dgita
    $("#home_bar_cellphone_number").mask("(000) 0000-00009");
    $("#home_bar_phone_number").mask("(000) 0000-00009");
    $("#home_bar_zip").mask("00.000-000");
});

