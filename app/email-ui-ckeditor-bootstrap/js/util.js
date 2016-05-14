

//depends on jQuery

var form_to_json = function(selector) {
  var res =  $(selector).serialize().split('&').reduce(function(obj, pairs) {
    var o = {}, pair = pairs.split("=");
    o[pair[0]] = pair[1];
    return $.extend(obj, o);
  }, {});

  var neuter_body = function(body) {
    var phone_number_regex = /([0-1]([\.\-])?)?(\(?[0-9]\d{2}\)?|[2-9]\d{3})([\.\-])?([0-9]{3}([\.\-])?[0-9]{4}|[a-zA-Z0-9]{7}|([0-9]{3}[-][a-zA-Z0-9]{4}))/g,
        email_regex = /\w+[\w\-\+\.]*\@\w+((-\w+)|(\w*))(?:\.\w{2,4})+/g;

    /*
    return body.replace(phone_number_regex, 'Muhahhhahhahha')
               .replace(email_regex, 'Muhhhhahahaha');
               */
    return body;
  }


  var payload = JSON.stringify($.extend(res, {body: neuter_body(CKEDITOR.instances.email.getData())}));
    
  //console.log(payload);

  return payload;
  //return JSON.stringify(res);
}



