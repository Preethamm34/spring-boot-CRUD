<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Add Orders</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.gradient-custom {
	background: -webkit-linear-gradient(left, #3931af, #00c6ff);
}

.card-custom {
	border-bottom-left-radius: 10% 50%;
	border-top-left-radius: 10% 50%;
	background-color: #f8f9fa;
}

.input-custom {
	background-color: white;
}

.white-text {
	color: hsl(52, 0%, 98%);
	font-weight: 100;
	font-size: 14px;
}

.back-button {
	background-color: hsl(52, 0%, 98%);
	font-weight: 700;
	color: black;
	margin-top: 50px;
}
</style>
<script>
function addRow() {
    var idx = parseFloat($("#totalNumberOfRows").val());
    $("#designtable").append(
        '<tr>' +
        '   <input type="hidden" name="totalNumberOfRows" id="totalNumberOfRows" value="1"/>' +
        '   <td>' +
        '       <div data-mdb-input-init class="form-outline">' +
        '           <input type="text" id="products.name_'+ idx +'" name="products['+ idx +'].name" class="form-control input-custom" />' +
        '       </div>' +
        '   </td>' +
        '   <td>' +
        '       <div data-mdb-input-init class="form-outline">' +
        '           <input type="text" id="products.discriptions_'+ idx +'" name="products['+ idx +'].discriptions" class="form-control input-custom" />' +
        '       </div>' +
        '   </td>' +
        '   <td>' +
        '       <div data-mdb-input-init class="form-outline">' +
        '           <input type="text" id="products.qty_'+ idx +'" name="products['+ idx +'].qty" class="form-control input-custom" />' +
        '       </div>' +
        '   </td>' +
        '   <td>' +
        '       <div data-mdb-input-init class="form-outline">' +
        '           <input type="text" id="products.units_'+ idx +'" name="products['+ idx +'].units" class="form-control input-custom" />' +
        '       </div>' +
        '   </td>' +
        '   <td>' +
        '       <div data-mdb-input-init class="form-outline">' +
        '           <input type="text" id="products.price_'+ idx +'" name="products['+ idx +'].price" class="form-control input-custom" />' +
        '       </div>' +
        '   </td>' +
        '   <td>' +
        '       <div data-mdb-input-init class="form-outline">' +
        '           <button type="button" class="remove">-</button> '+
        '       </div>' +
        '   </td>' +
        '</tr>'
    );
    idx++;
    $("#totalNumberOfRows").val(idx);
    getIndex();
}

$(document).ready(function() {
    // Delegate the click event for dynamically added remove buttons
    $("#designtable").on("click", ".remove", function (e) {
        e.preventDefault();
        $(this).closest("tr").remove(); // Changed from parents("tr") to closest("tr")
        getIndex();
    });
});

</script>
</head>
<body>

	<div class="row mt-3 mx-3" style="margin-top: 25px;">
		<div class="col-md-3">
			<div style="margin-top: 50px; margin-left: 10px;" class="text-center">
				<i id="animationDemo" data-mdb-animation="slide-right"
					data-mdb-toggle="animation" data-mdb-animation-reset="true"
					data-mdb-animation-start="onScroll"
					data-mdb-animation-on-scroll="repeat"
					class="fas fa-3x fa-shipping-fast text-white"></i>
				<h3 class="mt-3 text-white">Welcome</h3>
				<p class="white-text">You are 30 seconds away from compleating
					your order!</p>
			</div>
			<div class="text-center">
				<button type="submit" data-mdb-button-init data-mdb-ripple-init
					class="btn btn-white btn-rounded back-button">Go back</button>
			</div>


		</div>
		<div class="col-md-9 justify-content-center">
			<div class="card card-custom pb-4">
				<div class="card-body mt-0 mx-5">
					<div class="text-center mb-3 pb-2 mt-3">
						<h4 style="color: #495057;">Order Details</h4>
					</div>

					<form class="mb-0"
						action="${pageContext.request.contextPath}/orders/saveOrders"
						method="post">

						<div class="row mb-4">
							<div class="col">
								<div data-mdb-input-init class="form-outline">
									<input type="text" id="name" name="name"
										class="form-control input-custom" /> <label
										class="form-label" for="form9Example1">Customer Name</label>
								</div>
							</div>
							<div class="col">
								<div data-mdb-input-init class="form-outline">
									<input type="text" id="phoneNum"
										name="phoneNum" class="form-control input-custom" />
									<label class="form-label" for="form9Example2">Phone
										Number</label>
								</div>
							</div>
						</div>
						<div class="row mb-4">
							<div class="col">
								<div data-mdb-input-init class="form-outline">
									<input type="text" class="form-control" id="address"
										name="address" placeholder=" "> <label
										class="form-label" for="form9Example6">Address</label>
								</div>
							</div>
						</div>
						<div class="row mb-4">
							<div class="col">
								<div data-mdb-input-init class="form-outline">
									<input type="text" id="city" name="city"
										class="form-control input-custom" /> <label
										class="form-label" for="form9Example3">City</label>
								</div>
							</div>
							<div class="col">
								<div data-mdb-input-init class="form-outline">
									<input type="text" id="state" name="state"
										class="form-control input-custom" /> <label
										class="form-label" for="form9Example3">State</label>
								</div>
							</div>
							<div class="col">
								<div data-mdb-input-init class="form-outline">
									<input type="text" id="customer.zip" name="zip"
										class="form-control input-custom" /> <label
										class="form-label" for="form9Example4">Zip</label>
								</div>
							</div>
						</div>

						<div class="text-center mb-3 pb-2 mt-3">
							<h4 style="color: #495057;">Product Details</h4>
						</div>
						<table id="designtable" class="table">
							<thead>
								<tr>
									<th>Product Name</th>
									<th>Description</th>
									<th>Quantity</th>
									<th>Unit</th>
									<th>Price / Unit</th>
									<th>Add More</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<input type="hidden" name="totalNumberOfRows"
										id="totalNumberOfRows" value="1" />
									<td>
										<div data-mdb-input-init class="form-outline">
											<input type="text" id="products.name_0" name="products[0].name"
												class="form-control input-custom" />
										</div>
									</td>
									<td>
										<div data-mdb-input-init class="form-outline">
											<input type="text" id="products.discriptions_0"
												name="products[0].discriptions" class="form-control input-custom" />
										</div>
									</td>
									<td>
										<div data-mdb-input-init class="form-outline">
											<input type="text" id="products.qty_0"
												name="products[0].qty" class="form-control input-custom" />
										</div>
									</td>
									<td>
										<div data-mdb-input-init class="form-outline">
											<input type="text" id="products.units_0" name="products[0].units"
												class="form-control input-custom" />
										</div>
									</td>
									<td>
										<div data-mdb-input-init class="form-outline">
											<input type="text" id="products.price_0" name="products[0].price"
												class="form-control input-custom" />
										</div>
									</td>
									<td>
										<div data-mdb-input-init class="form-outline">
											<button type="button" onclick="addRow()">+</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>

						<div class="text-center">
							<!-- Centering container -->
							<button type="submit" data-mdb-button-init data-mdb-ripple-init
								class="btn btn-primary btn-rounded"
								style="background-color: #0062CC;">Place order</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>