// new-user.js
function bindListenerAndCreateUser(){
  $("#create-new").click(function(event){
    event.preventDefault();
    createUser();
    document.forms["new-user"].reset();
  })
}

$(document).ready(function(){
  bindListenerAndCreateUser()
})

function createUser(){
  var userData = {
    user: {
            first_name: $("#first-name").val(),
            last_name: $("#last-name").val(),
            email: $("#email").val(),
            ssn: $("#ssn").val()
    }
  }
  $.ajax({
          url: "/api/v1/users",
          method: "POST",
          data: userData
          })
          .success(function(user){
            alert("User successfully created")
            $("#users").prepend(user)
          })
          .fail(function(error){
            alert("Please check that all fields were filled in correctly")
          })
}
