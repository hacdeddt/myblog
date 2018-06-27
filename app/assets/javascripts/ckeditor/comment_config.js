CKEDITOR.editorConfig = function (config) {
  config.toolbar = [
    { name: 'basicstyles', items : [ 'Bold', 'Italic', 'Underline', 'Strike' ] },
    { name: 'colors', items : [ 'Subscript', 'Superscript' , 'RemoveFormat', 'TextColor', 'BGColor' ] },
    { name: 'styles', items : [ 'Styles', 'Format', 'Font', 'FontSize' ] },
    { name: 'insert', items : [ 'Image'] }
  ];
  config.height = 100;
}