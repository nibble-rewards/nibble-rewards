var API = function(options) {
  this.host = options.host || 'http://localhost:3000'; 
  this.user = {user: { email: options.username, password: options.password }}; 

  this.sign_in = function(callback) {
    var options = {
      url : [this.host, '/api/users/sign_in'].join(''), 
      method: 'POST',
      data: JSON.stringify(this.user)
    }, that = this;
    this.fetch(options, function(response) {
      that.token = response.user.authentication_token;
      (callback || function() {})();
    });
  }

  this.sign_out = function() {
    var options = {
      url : [this.host, '/api/users/sign_out'].join(''),
      method: 'DELETE'
    }
    this.fetch(options, function(response) {
      console.log(response);
    });
  }

  this.resource_all = function(resource_name, callback) {
    var options = {
      url : [this.host, '/api/', resource_name].join(''),
      method: 'GET'
    }
    this.fetch(options, function(response) {
      console.log(JSON.stringify(response));
      (callback || function() {})(response); //interate over the response via callback
    });
  }
  
  this.arbitrary = function(path, callback) {
    var options = {
      url : [this.host, '/api/', path].join(''),
      method: 'GET'
    }
    this.fetch(options, function(response) {
      (callback || function() {})(response); //interate over the response via callback
    });
  }

  this.fetch = function(options, callback) {
    var options = options || {},
        callback = callback || function() { return 'no callback';};
      $.ajax({
          type: options.method || 'GET',
          url: options.url,
          data: options.data || '',
          headers: {
              "Accept":"application/json",
              "Content-Type":"application/json",
              "x-auth-token": this.token || ''
          }
      }).done(function(response) { 
          callback(response);
      }).fail(function(response) {
         $('.alert').html('Login invalid').show();
      });
  }
}



