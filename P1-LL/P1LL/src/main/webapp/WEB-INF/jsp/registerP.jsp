<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %> -->
<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <title>Signin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    .bg-image-vertical {
position: relative;
overflow: hidden;
background-repeat: no-repeat;
background-position: right center;
background-size: auto 100%;
}

@media (min-width: 1025px) {
.h-custom-2 {
height: 100%;
}
}
.container form {
      width: 250px;
      margin: 20px auto;
    }
    i {
      cursor: pointer;
    }
</style>
<script>
 $(function(){
      $('#togglePassword').click(function(){
        var passwordField = $('#password');
        var passwordToggle = $(this);
        if(passwordField.attr('type') === 'password'){
          passwordField.attr('type', 'text');
          passwordToggle.removeClass('bi-eye-slash').addClass('bi-eye');
        }else{
          passwordField.attr('type', 'password');
          passwordToggle.removeClass('bi-eye').addClass('bi-eye-slash');
        }
      });
    });

document.getElementById("submitButton").addEventListener("click", function(event) {
        var password = document.getElementById("password").value;
        var hasUppercase = /[A-Z]/.test(password);
        var hasLowercase = /[a-z]/.test(password);
        var hasSpecialChar = /[!@#$%^&*()_+]/.test(password);
        
        if (hasUppercase && !hasLowercase && !hasSpecialChar) {
            event.preventDefault();
            document.getElementById("passwordRequirements").innerText = "Password must contain at least one lowercase letter and one special character (!@#$%^&*()_+)";
        } else if (!hasUppercase || !hasLowercase || !hasSpecialChar) {
            event.preventDefault();
            document.getElementById("passwordRequirements").innerText = "Password must contain at least one uppercase letter, one lowercase letter, and one special character (!@#$%^&*()_+)";
        }
    });
   
    document.getElementById("signInForm").addEventListener("submit", function(event) {
        var userName = document.getElementById("userName").value;
        var phoneNumber = document.getElementById("phoneNumber").value;
        var email = document.getElementById("emailadd").value;
        var password = document.getElementById("password").value;

        // Basic validation for all fields being filled
        if (!userName || !phoneNumber || !email || !password) {
            alert("All fields are required.");
            event.preventDefault(); // Prevent form submission
            return;
        }

        // Validation for phone number format (10 digits only)
        var phoneRegex = /^\d{10}$/;
        if (!phoneNumber.match(phoneRegex)) {
            alert("Please enter a valid 10-digit phone number.");
            event.preventDefault(); // Prevent form submission
            return;
        }
    });

</script>
</head>
<body>

    <section class="vh-100">
        <div class="container py-5 h-100">
          <div class="row">
            <div class="col-sm-6 text-black">
      
              <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">
      
                <form id="signInForm" style="width: 23rem;" action="/lgn/saveUser" method="post">

                  <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;"> Sign In</h3>
              
                  <input type="hidden" name="userId" id="userId" value="${user.userId}"/>
              
                  <div data-mdb-input-init class="form-outline mb-4">
                      <input type="text" id="userName" name="userName"  class="form-control form-control-lg" value="${user.userName}" required/>
                      <label class="form-label" for="userName">User Name<span style="color: red;">*</span></label>
                  </div>  
                  <!-- onchange="checkUserNameAndEmail()" -->
              
                  <div data-mdb-input-init class="form-outline mb-4">
                      <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control form-control-lg" pattern="[0-9]{10}" required/>
                      <label class="form-label" for="phoneNumber">Phone Number<span style="color: red;">*</span></label>
                  </div>
              
                  <div data-mdb-input-init class="form-outline mb-4">
                      <input type="email" id="emailadd" name="emailadd" class="form-control form-control-lg" required/>
                      <label class="form-label" for="emailadd">Email Id<span style="color: red;">*</span></label>
                  </div>
                  <!-- onchange="checkUserNameAndEmail()" -->
                  
                  <div data-mdb-input-init class="form-outline mb-4 password-container">
                      <div style="position: relative;">
                          <input type="password" id="password" name="password" class="form-control form-control-lg" required/>
                          <i id="togglePassword" class="bi bi-eye-slash toggle-password" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%);"></i>
                      </div>
                      <label class="form-label" for="password">Password<span style="color: red;">*</span></label>
                  </div>
                  <div id="passwordRequirements" class="text-danger"></div>
                  
                  <div class="pt-1 mb-4">
                      <button data-mdb-button-init data-mdb-ripple-init id="submitButton" class="btn btn-info btn-lg btn-block" type="submit">Sign in</button>
                  </div>
              
              </form>
      
              </div>
      
            </div>
            <div class="col-sm-6 px-0 d-none d-sm-block">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img3.webp"
                alt="Login image" class="w-100 vh-100" style="object-fit: scale-down; object-position: left; height: 50px;">
            </div>
          </div>
        </div>
      </section>


      
</body>
</html>
