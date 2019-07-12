( function( $ ){
    $('#error').hide();
    $('#success').hide();
  
    $('#contact-form').submit(function(event){
      var form = this;
      $('#error').hide();
      $('#success').hide();
      event.preventDefault();
      $('#preloader').fadeIn(300);
      $.ajax({
        url: "/api/api_submit/submitContact/",
        method: 'POST',
        data: {
          email:$('#email').val(),
          phone:$('#phone').val(),
          name:$('#name').val(),
          messagge:$('#messagge').val(),
        },
        dataType: 'json',})
        .done(function (data) {
            if(data==true){
                $('#email').val('');
                $('#phone').val('');
                $('#name').val('');
                $('#messagge').val('');
                $('#success').show();
                $('#preloader').fadeOut(300);
            }else{
                $('#error').show();
                $('#preloader').fadeOut(300);

            }
        })
        .fail(function (jqXHR, textStatus) {
            $('#error').show();
            $('#preloader').fadeOut(300);
        });

    });
} )( jQuery );