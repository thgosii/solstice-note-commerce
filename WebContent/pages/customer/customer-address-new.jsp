<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

  <title><c:if test="${empty address}">Novo Endereço</c:if><c:if test="${not empty address}">Editar Endereço</c:if> | LapTop Computadores</title>

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
          <form id="form-header-search" action="/loja/produtos" method="GET" class="form-inline ml-0 ml-md-3">
            <div class="input-group input-group-sm">
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
            <a class="nav-link" href="/note-commerce/shop/cart?operation=consult">
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
          <div class="col-sm-6">
            <div class="col-sm-6">
            <h1><c:if test="${empty address}">Novo endereço</c:if><c:if test="${not empty address}">Editar endereço</c:if></h1>
          </div>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">
          <c:if test="${not empty requestScope.messages}">
			  <div class="alert alert-danger" role="alert" style="font-size: 16px;">
				  Erros encontrados no preenchimento do formulário:
				  <ul>
					  <c:forEach var="message" items="${messages}">
					  	<li><c:out value="${message}"/></li>
					  </c:forEach>
				  </ul>
			  </div>
	  	  </c:if>
          <div class="card">
            <div class="card-body register-card-body">
              <form action="/note-commerce/customer/adresses" method="POST">
              	<c:if test="${empty address}">
              		<input type="hidden" name="operation" value="save">
              	</c:if>
              	<c:if test="${not empty address}">
              		<input type="hidden" name="operation" value="update">
              	</c:if>
              	<c:if test="${not empty address}">
              		<input type="hidden" name="id" value="${address.id}">
              	</c:if>
              	<input type="hidden" name="operation" value="save">
                <div class="form-group">
                  <label for="cep">CEP<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="cep" name="cep" placeholder="CEP" pattern="\d{5}\-\d{2}" value="${address.cep}" required>
                </div>
                <div class="form-group">
                  <label for="publicPlace">Logradouro<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="publicPlace" name="publicPlace" placeholder="Logradouro" value="${address.publicPlace}" required>
                </div>
                <div class="form-group">
                  <label for="state">Estado<span class="text-danger text-bold"> *</span></label>
                  <select class="form-control" id="state" name="state" data-target='#city' disabled>
                  </select>
                </div>
                <div class="form-group">
                  <label for="city">Cidade<span class="text-danger text-bold"> *</span></label>
                  <select class="form-control" id="city" name="city" disabled>
                  </select>
                </div>
                <div class="form-group">
                  <label for="neighbourhood">Bairro<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="neighbourhood" name="neighbourhood" placeholder="Bairro" value="${address.neighbourhood}" required>
                </div>
                <div class="form-group">
                  <label for="number">Número<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="number" name="number" placeholder="Número" value="${address.number}" required>
                </div>
                <div class="form-group">
                  <label for="complement">Complemento</label>
                  <input type="text" class="form-control" id="complement" name="complement" value="${address.complement}" placeholder="Complemento">
                </div>
                <div class="form-group">
	                <label for="addressType">Tipo de endereço<span class="text-danger text-bold"> *</span></label>
	                <select class="form-control" id="type" name="type">
	                  <option value="shipping" ${address.type.toString().toLowerCase() == 'shipping' ? 'selected' : ''}>Entrega</option>
	                  <option value="billing" ${address.type.toString().toLowerCase() == 'billing' ? 'selected' : ''}>Cobrança</option>
	                  <option value="shipping_and_billing" ${address.type.toString().toLowerCase() == 'shipping_and_billing' ? 'selected' : ''}>Entrega e cobrança</option>
	                </select>
              	</div>
                <div class="row">
                  <div class="col col-6">
                    <button type="submit" class="btn btn-primary btn-block">Salvar</button>
                  </div>
                </div>
              </form>
            </div>
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
  <script src="/note-commerce/static/plugins/inputmask/jquery.inputmask.bundle.js"></script>
  <script type="text/javascript">  
    $(document).ready(function () {
      $("#cep").inputmask("99999-999");
    });	
    
	let states = [];
	let flagFocusout = false;
	
	function loadStates(element) {
	  if (states.length > 0) {
	    putStates(element);
	    $(element).removeAttr('disabled');
	  } else {
	    $.ajax({
	      url: 'https://api.myjson.com/bins/enzld',
	      method: 'get',
	      dataType: 'json',
	      beforeSend: function() {
	        $(element).html('<option>Carregando...</option>');
	      }
	    }).done(function(response) {
	      states = response.estados;
	      putStates(element);
	      $(element).removeAttr('disabled');
	      let target = $("#state").data('target');
		  if (target) {
		    loadCities(target, $("#state").children(":selected").attr("id"));
		  }
	    });
	  }
	}
	
	function putStates(element) {
	  let options;
	  for (let i in states) {
	    let state = states[i];
	    options += '<option value="' + state.nome + '" id="' + state.sigla + '">' + state.nome + '</option>';
	  }
	  $(element).html(options);
	}
	
	function loadCities(element, state_initials) {
	  if (states.length > 0) {
	    putCities(element, state_initials);
	    $(element).removeAttr('disabled');
	  } else {
	    $.ajax({
	      url: theme_url + '/assets/json/estados.json',
	      method: 'get',
	      dataType: 'json',
	      beforeSend: function() {
	        $(element).html('<option>Carregando...</option>');
	      }
	    }).done(function(response) {
	      states = response.estados;
	      putCities(element, state_initials);
	      $(element).removeAttr('disabled');
	    });
	  }
	}
	
	function putCities(element, state_initials) {
	  let options;
	  for (let i in states) {
	    let state = states[i];
	    if (state.sigla != state_initials)
	      continue;
	    for (let j in state.cidades) {
	      let city = state.cidades[j];
	      options += '<option value="' + city + '" id="' + city + '">' + city + '</option>';
	    }
	  }
	  $(element).html(options);
	  if (!flagFocusout) {
  	  	$('#cep').trigger('focusout');
  	  	flagFocusout = true;
	  }
	}
	
	document.addEventListener('DOMContentLoaded', function() {
	  loadStates('#state');
	  $(document).on('change', '#state', function(e) {
	    let target = $(this).data('target');
	    if (target) {
	      loadCities(target, $(this).children(":selected").attr("id"));
	    }
	  });
	}, false);
	
	$("#cep").focusout(function(){
		$.ajax({
			url: 'https://viacep.com.br/ws/'+$(this).val()+'/json/unicode/',
			dataType: 'json',
			success: function(response){
				$("#publicPlace").val(response.logradouro);
				$("#neighbourhood").val(response.bairro);		
				$("#state option[id='" + response.uf + "']").attr("selected", "selected");
				$("#number").focus();
			}
		}).done(function(response) {
			let target = $("#state").data('target');
			if (target) {
			  loadCities(target, $("#state").children(":selected").attr("id"));
			}
			$("#city option[id='" + response.localidade + "']").attr("selected", "selected");
		});
	});	
  </script>
</body>

</html>