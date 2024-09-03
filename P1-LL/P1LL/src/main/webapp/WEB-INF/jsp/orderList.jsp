<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User List</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"    
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	color: #404E67;
	background: #F5F7FA;
	font-family: 'Open Sans', sans-serif;
}

.table-wrapper {
	width: auto;
	margin: 30px auto;
	background: #fff;
	padding: 20px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 10px;
	margin: 0 0 10px;
}

.table-title h2 {
	margin: 6px 0 0;
	font-size: 22px;
}

.table-title .add-new {
	font-weight: bold;
	font-size: 12px;
	text-shadow: none;
	min-width: 100px;
	border-radius: 50px;
	line-height: 13px;
}

.table-title .add-new i {
	margin-right: 4px;
}

table.table {
	table-layout: auto;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table th:last-child {
	width: 100px;
}

table.table td a {
	cursor: pointer;
	display: inline-block;
	margin: 0 5px;
	min-width: 24px;
}

table.table td a.add {
	color: #27C46B;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #E34724;
}

table.table td i {
	font-size: 19px;
}

table.table td a.add i {
	font-size: 24px;
	margin-right: -1px;
	position: relative;
	top: 3px;
}

table.table .form-control {
	height: 32px;
	line-height: 32px;
	box-shadow: none;
	border-radius: 2px;
}

table.table .form-control.error {
	border-color: #f50000;
}

table.table td .add {
	display: none;
}

.alert {
	margin-bottom: 20px;
}
.container .table-title {
    width: 100%;
      margin: 0 20px;
      padding: 20px;
      box-sizing: border-box;
    }
</style>
</head>
<body>


    <div class="container">

        <%-- Display success message --%>
		<c:if test="${not empty message}">
			<div class="alert alert-success alert-dismissible fade show py-2"
				role="alert">
				<i class="fa fa-check-circle mr-2"></i>
				<!-- Success icon -->
				${message}
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if> 

		<%-- Display error message --%>
		<c:if test="${not empty error}">
			<div class="alert alert-danger alert-dismissible fade show py-2"
				role="alert">
				<i class="fa fa-exclamation-circle mr-2"></i>
				<!-- Error icon -->
				${error}
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>

    <div class="table-title" style="margin-top: 20px;">
        <div class="row">
            <div class="col-sm-8">
                <h2>
                    Order <b>Details</b>
                </h2>
            </div>
            <hr>
            ${user}
            <div class="col-sm-4">
                <button type="button" class="btn btn-info add-new">
                    <a href="${pageContext.request.contextPath}/orders/orderPge"
                        style="text-decoration: none; color: whitesmoke;"> <i
                        class="fa fa-plus"></i> New Order
                    </a>
                </button>
            </div>
        </div>
    </div>

    
    <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/orders/searchorderList" method="post">
        <select class="form-control mr-sm-2" id="costomerId" name="costomerId" aria-label="Select Customer">
            <option value="">Select Customer</option>
            <c:forEach var="customer" items="${allCustomers}">
                <option value="${customer.costomerId}">${customer.name}</option>
            </c:forEach>
        </select>
    
        <select class="form-control mr-sm-2" id="productId" name="productId" aria-label="Select Product">
            <option value="">Select Product</option>
            <c:forEach var="customer" items="${customers}">
                <c:forEach var="product" items="${customer.products}">
                    <option value="${product.productId}">${product.name}</option>
                </c:forEach>
            </c:forEach>
        </select>
    
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>

    <br>

    <form   action ="${pageContext.request.contextPath}/xls/uploadFile" method = "POST" enctype = "multipart/form-data">
        <br /> <br />
           Please select a file to upload : 
           <input type = "file" name = "file" value = "Browse File" /> <br /> <br />
           Press here to upload the file :
           <input type = "submit" value = "upload" /> <br /> <br /> 
           
           <h4 style="color: green">${message}</h4> <br /> 
           
           Do you want to save excel data into database ? <a href="saveData"><b>Yes</b></a> &nbsp &nbsp <a href="/"><b>No</b></a>
        </form>
        
    <br>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th rowspan="2">Sl No</th>
                <th colspan="4" style="align-items: center; text-align: center;">Customer
                    Details</th>
                <th colspan="5" style="align-items: center; text-align: center;">Product
                    Details</th>
                <th rowspan="2" colspan="2"
                    style="align-items: center; text-align: center; vertical-align: middle;">Action</th>
            </tr>
            <tr>
                <th>Customer Name</th>
                <th>Phone Number</th>
                <th>Delivery Address</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Units</th>
                <th>Price</th>
                <th>Descriptions</th>
            </tr>
        </thead>
        <tbody>

            <c:if test="${customers.size() > 0}">
                <c:set var="slno" value="1" />
                <c:forEach var="customer" items="${customers}">
                    <c:forEach var="product" items="${customer.products}" varStatus="status">
                        <tr>
                            <c:if test="${status.first}">
                                <td rowspan="${customer.products.size()}">${slno}</td>
                                <td rowspan="${customer.products.size()}">${customer.name}</td>
                                <td rowspan="${customer.products.size()}">${customer.phoneNum}</td>
                                <td rowspan="${customer.products.size()}">${customer.address},<br>${customer.city}-${customer.zip},<br>${customer.state}</td>
                                <c:set var="slno" value="${slno + 1}" />
                            </c:if>
                            <td>${product.name}</td>
                            <td>${product.qty}</td>
                            <td>${product.units}</td>
                            <td>${product.price}</td>
                            <td>${product.discriptions}</td>
                            <td><a
                                href="${pageContext.request.contextPath}/orders/editorder/${user.userId}"
                                class="edit" title="Edit" data-toggle="tooltip"> <i
                                    class="material-icons" style="font-size: 30px;">&#xE254;</i></a></td>
                            <td><a
                                href="${pageContext.request.contextPath}/orders/deleteorder/${user.userId}"
                                class="delete" title="Delete" data-toggle="tooltip"
                                onclick="return confirm('Are you sure you want to delete this user?');">
                                    <i class="material-icons" style="font-size: 30px;">&#xE872;</i>
                            </a></td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </c:if>

            <c:if test="${customers.size() == 0}">
                <tr>
                    <td colspan="10" style="color: red;"><p>No Record Found</p></td>
                </tr>
            </c:if>

            <!-- Add Pagination Section Below Table -->

        </tbody>
    </table>

</div>




</body>
</html>
