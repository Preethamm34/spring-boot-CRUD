<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>User List</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
    color: #404E67;
    background: #F5F7FA;
    font-family: 'Open Sans', sans-serif;
}
.logout-container {
        position: absolute;
        top: 10px; /* Adjust top position as needed */
        right: 10px; /* Adjust right position as needed */
    }
</style>
<script>
    


</script>
</head>
<body>
<div class="container-lg">
    
    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show py-2" role="alert">
            <i class="fa fa-check-circle mr-2"></i> <!-- Success icon -->
            ${message}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
          
    <form id="logoutForm" action="${pageContext.request.contextPath}/lgn/logout" method="get">
        <button type="submit" class="btn btn-outline-danger" title="LogOut">
            <i class="fa fa-sign-out" aria-hidden="true"></i>
        </button>
    </form>

    <h3>Welcome user</h3>

    <nav class="navbar navbar-expand-lg navbar-light bg-body-tertiary">
        <div class="container-fluid">
          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
              <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}">Home</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/orders/orderPge">Orders</a>
              <a class="nav-link" href="${pageContext.request.contextPath}/orders/orderList">Order List</a>
            </div>
          </div>
        </div>
      </nav>

</div>
    

</div>     
</body>
</html>