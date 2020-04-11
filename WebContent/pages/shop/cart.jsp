<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>LapTop Computadores</title>

  <!-- Pace -->
  <script src="/note-commerce/static/plugins/pace-progress/pace.min.js"></script>
  <link href="/note-commerce/static/plugins/pace-progress/themes/blue/pace-theme-flash.css" rel="stylesheet">

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/note-commerce/static/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link rel="preload" as="style" onload="this.onload=null; this.rel='stylesheet'"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700">
</head>

<body class="hold-transition layout-top-nav">
  <div class="wrapper">

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
      <div class="container">
        <a href="/note-commerce/pages/shop/products.jsp" class="navbar-brand">
          <!-- <img src="../../static/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> -->
          <span class="brand-text font-weight-light">LapTop Computadores</span>
        </a>

        <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse"
          aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse order-3" id="navbarCollapse">
          <!-- Left navbar links -->
          <ul class="navbar-nav">
            <li class="nav-item">
              <a href="/note-commerce/pages/shop/products.jsp" class="nav-link">Home</a>
            </li>

          </ul>

          <!-- SEARCH FORM -->
          <form id="form-header-search" action="/note-commerce/pages/shop/products.jsp" method="GET" class="form-inline ml-0 ml-md-3 w-100">
            <div class="input-group input-group-sm w-100">
              <input name="descricao" class="form-control form-control-navbar" type="search"
                placeholder="Pesquisar Laptops" aria-label="Pesquisar Laptops">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
              </div>
            </div>
          </form>
        </div>

        <!-- Right navbar links -->
        <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="#">
              Saldo digital: <strong>R$ 0,00</strong>
            </a>
          </li>
          <!-- Carrinho -->
          <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="fas fa-shopping-cart"></i>
              <span class="badge badge-danger navbar-badge"><c:out value="${sessionScope.cart.items.size()}"/></span>
            </a>
          </li>
          <!-- Perfil -->
          <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
              <span class="p-1">usuário</span>
              <i class="fas fa-user mr-2"></i>
              <!-- <img src="../../static/dist/img/avatar.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> -->
            </a>
            <div class="dropdown-menu dropdown-menu-md dropdown-menu-right">
              <!-- <span class="dropdown-header">Meu nome</span> -->
              <a href="/note-commerce/customer?operation=consult" class="dropdown-item">
                <i class="fas fa-user mr-2"></i> Meus dados
              </a>
              <a href="/note-commerce/customer/adresses?operation=consult" class="dropdown-item">
                <i class="fas fa-address-card mr-2"></i> Meus endereços
              </a>
              <a href="/note-commerce/customer/creditCards?operation=consult" class="dropdown-item">
                <i class="fas fa-credit-card mr-2"></i> Meus cartões
              </a>
              <a href="#" class="dropdown-item">
                <i class="fas fa-box-open mr-2"></i> Pedidos
              </a>
              <a href="#" class="dropdown-item">
                <i class="fas fa-exchange-alt mr-2"></i> Minhas Trocas
              </a>
              <a href="/note-commerce/logout" class="dropdown-item dropdown-footer text-left">
                <i class="fas fa-sign-out-alt mr-2"></i>
                Sair
              </a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <!-- /.navbar -->




    <!-- *********************************************************************************** -->





    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container">
          <div class="col-sm-10">
            <h1>Carrinho</h1>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">
          <table class="table table-striped" id="tableItems">
            <thead>
              <tr>
                <th>
                  Produto
                </th>
                <th>
                </th>
                <th>
                  Preço unitário
                </th>
                <th>
                  Quantidade
                </th>
                <th>
                  Subtotal
                </th>
                <th>
                  Remover
                </th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="item" items="${items}">
              	<tr id="row_${item.product.id}">
	                <td>
	                  <img src="${item.product.image.url}" style="width: 70px; height: 50px;">
	                </td>
	                <td style="max-width:300px;">${item.product.title}</td>
	                <td>
                      R$ <span id="price_${item.product.id}">${item.product.price}</span>
	                </td>
	                <td>
                    <button type="button" class="btn btn-sm btn-secondary" onclick="decreaseItemQty(${item.product.id});" style="font-size:13px;">
                      <i class="fas fa-minus"></i>
                    </button>
	                  <span id="qty_${item.product.id}" style="margin-left:5px;margin-right:5px;">${item.quantity}</span>
                    <button type="button" class="btn btn-sm btn-secondary" onclick="increaseItemQty(${item.product.id});" style="font-size:13px;">
                      <i class="fas fa-plus"></i>
                    </button>
	                </td>
	                <td>
                      R$ <span id="subTotal_${item.product.id}">${item.subTotal}</span>
                    </td>
	                <td>
	                  <button class="btn btn-danger btn-sm" onclick="removeCartItem(${item.product.id});">
	                    <i class="fas fa-trash">
	                    </i>
	                  </button>
	                </td>
                </tr>
              </c:forEach>
          </table>
          <hr>
          <div style="display: flex; justify-content: space-between;">
            <h3>Total: R$ <span id="total">R$ 0</span></h3>
            <button type="button" onclick="window.location.href='/note-commerce/pages/shop/checkout-step-1.jsp'" id="initCheckout" class="btn btn-info btn-lg btn-flat" style="margin-right: 10px;">
              <i class="fas fa-credit-card fa-lg mr-2"></i>
              Iniciar compra
            </button>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->




    <!-- *********************************************************************************** -->




    <!-- Main Footer -->
    <footer class="main-footer">
      <!-- To the right -->
      <div class="float-right d-none d-sm-inline">
        <a target="_blank" href="https://github.com/thiago-bezerra/solstice-note-commerce">GitHub</a>
      </div>
      <!-- Default to the left -->
      <strong>Desenvolvido por</strong>
<img src="/note-commerce/static/custom/general/img/solstice_logo.png" style="height: 25px;">
    </footer>
  </div>
  <!-- ./wrapper -->

  <!-- REQUIRED SCRIPTS -->

  <!-- jQuery -->
  <script src="/note-commerce/static/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="/note-commerce/static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="/note-commerce/static/dist/js/adminlte.min.js"></script>
  <script>
 	  function moneyMask(value) {
	    value = value.toString().replace(/\D/g,"");
	    value = value.toString().replace(/(\d)(\d{8})$/,"$1.$2");
	    value = value.toString().replace(/(\d)(\d{5})$/,"$1.$2");
	    value = value.toString().replace(/(\d)(\d{2})$/,"$1,$2");
	    return value;                
	  }
  	
	  function decreaseItemQty(id) {
		  let qty = $("#qty_" + id).text();
		  
		  if (qty > 1) {
		  	updateCartItem(id, parseInt(qty) - 1);
		  }
	  }
  
      function increaseItemQty(id) {
    	  let qty = $("#qty_" + id).text();
    	  
    	  updateCartItem(id, parseInt(qty) + 1);
      }
      
      function checkCartItemQuantity() {
    	  let quantity = 0;
    	  
    	  $("#tableItems tr").not(':first').each(function() {
     		++quantity;
     	  });
    	  
    	  console.log(quantity);
    	  
    	  if (quantity > 0) {
    		  $("#initCheckout").attr("disabled", false);
    	  } else {
    		  $("#initCheckout").attr("disabled", true);
    	  }
      }
  
  	  function updateCartItem(id, qty) {
	  		$.ajax({
	  		  type: "POST",
  		  url: '/note-commerce/shop/cart',
  		  data: {operation : 'update', productId : id, quantity : qty},
  		  success: function() {
  			  fixMoneyNumbers();
  			  $("#qty_" + id).text(qty);
  			  $("#subTotal_" + id).text(parseFloat(qty * parseFloat($("#price_" + id).text())).toFixed(2));
  			  calculateTotal();
  		  },
  		  dataType: "text"
  		});
  	  }
  	  
  	  function removeCartItem(id) {
		$.ajax({
		  type: "POST",
		  url: '/note-commerce/shop/cart',
		  data: {operation : 'remove', productId : id},
		  success: function() {
			  $("#row_" + id).remove();
			  calculateTotal();
			  checkCartItemQuantity();
		  },
		  dataType: "text"
		});
	  }
  	  
  	  function calculateTotal() {
  		let total = 0;  
  		$("#tableItems tr").not(':first').each(function() {
  		  total +=  parseFloat($(this).find("td:eq(4) span").text());
  		});
  		
		$("#total").text(parseFloat(total).toFixed(2));
  	  }
  	  
  	  function fixMoneyNumbers() {
  		$("#tableItems tr").not(':first').each(function() {
   		  $(this).find("td:eq(2) span").text(parseFloat($(this).find("td:eq(2) span").text()).toFixed(2));
   		  $(this).find("td:eq(4) span").text(parseFloat($(this).find("td:eq(4) span").text()).toFixed(2));
   		});
  	  }
  	  
  	  $(document).ready(() => {
    	fixMoneyNumbers();
  		calculateTotal();
  		checkCartItemQuantity();
  	  })
  </script>
</body>

</html>