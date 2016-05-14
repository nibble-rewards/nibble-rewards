$('#sign-in').on('click', function(e) { 
  e.preventDefault();    //single page app ajax the form
  var api = new API({username: $('#user').val(), 
                     password: $('#password').val(), 
                     host: 'http://upload.dragonwrench.com:3000'}); //use facebook id

  //a much more detailed renderer should happen here
  //for now simple hide & show ... 
  api.sign_in(function() {
    //render logic
    $('.form-signin').hide(); 
    $('.email').show();
    $('.alert').hide();

    CKEDITOR.replace( 'email' ); 
    $('#send').on('click', function() {
      api.fetch({ url: api.host +'/api/email', 
        data: form_to_json('#form'),  //see util.js
        method: 'POST'
      }, function(reply) {
        console.log(reply);
      });
    });
  });
  //should have some message if the creds don't work
});
