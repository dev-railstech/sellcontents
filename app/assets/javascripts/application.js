// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery-fileupload/basic
//= require dropzone
//= require_tree .


Dropzone.options.coverDropzone = {
    paramName: "image[attachment]",
    maxFilesize: 1,
    addRemoveLinks: true,
    init: function () {
        return this.on('removedfile', function (file) {
            if (file.xhr) {
                return $.ajax({
                    url: "" + ($("#cover-dropzone").attr("action")) + "/" + (JSON.parse(file.xhr.response).id),
                    type: 'DELETE'
                });
            }
        });
    }
};
Dropzone.options.contentDropzone = {
    paramName: "content[attachment]",
    maxFilesize: 2,
    addRemoveLinks: true,
    init: function () {
        return this.on('removedfile', function (file) {
            if (file.xhr) {
                return $.ajax({
                    url: "" + ($("#content-dropzone").attr("action")) + "/" + (JSON.parse(file.xhr.response).id),
                    type: 'DELETE'
                });
            }
        });
    }
};

