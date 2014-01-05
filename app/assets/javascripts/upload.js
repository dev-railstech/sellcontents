$(function () {
    $('#fileupload')
        .fileupload({
            dataType: 'script',
            add: function (e, data) {
                return data.submit();
            },
            progress: function (e, data) {
                var progress;
                progress = parseInt(data.loaded / data.total * 100, 10);
                console.log(progress);
                $('.bar').css('width', progress + '%');
            },
            done: function (e, data) {
                $('#code').val(data.code);
                $('#submit').show();
            }
        });
})