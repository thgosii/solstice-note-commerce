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
  
  <!-- Select2 -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="/note-commerce/static/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
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
            <a class="nav-link" href="/note-commerce/shop/cart?operation=consult">
              <i class="fas fa-shopping-cart"></i>
              <span class="badge badge-danger navbar-badge"><c:out value="${sessionScope.cart.items.size()}"/></span>
            </a>
          </li>
          <!-- Perfil -->
          <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
              <span class="p-1">${loggedUser.email}</span>
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
                  <input type="text" class="form-control" id="cep" name="cep" placeholder="CEP" required>
                </div>
                <div class="form-group">
                  <label for="publicPlace">Logradouro<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="publicPlace" name="publicPlace" placeholder="Logradouro" value="${address.publicPlace}" required>
                </div>
                <div class="form-group">
                  <label for="state">Estado<span class="text-danger text-bold"> *</span></label>
                  <select class="form-control select2bs4" id="state" name="state" data-target='#city' disabled>
                  </select>
                </div>
                <div class="form-group">
                  <label for="city">Cidade<span class="text-danger text-bold"> *</span></label>
                  <select class="form-control select2bs4" id="city" name="city" disabled>
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
  
  <!-- Select2 -->
  <script src="/note-commerce/static/plugins/select2/js/select2.full.min.js"></script>
  <script src="/note-commerce/static/plugins/select2/js/i18n/pt-BR.js"></script>
  
  <script type="text/javascript">  
    $(document).ready(function () {
      $("#cep").inputmask("99999-999");
           
      $(".select2bs4").select2({ // #city and #state
          theme: 'bootstrap4',
          language: "pt-BR",
          disabled: true
      })
      
      // Selenium IDE inputmask type fix
      $("#cep").click(e => {
      	$("#cep").val("");
      });
      
      async function loadStates() {
     	  console.log("load states");
      	  $('#state').prop("disabled", true);
    	  $('#state').html("")
          await $.ajax("https://servicodados.ibge.gov.br/api/v1/localidades/estados")
          	.then(data => {
          		// Sort states
          		data.sort((a, b) => a.nome > b.nome ? 1 : (a.nome < b.nome ? -1 : 0))
          		
          		// Enable state select
          		$('#state').prop("disabled", false);
          		
          		// Fill state select options
          		data.forEach(s => {
          			const option = new Option(s.nome, s.sigla, false, false);
          			$(option).attr('data-ibge-id', s.id) // Necessary for IBGE API city request
          			if ("${address.state}" != null && "${address.state}" != "") {
          				if ("${address.state}" == s.sigla) {
          					$(option).prop('selected', true)
          					$("#city").prop("disabled", false);
          					loadCities(s.id);
          				}
          			}
          			$("#state").append(option)
          		});
          	});
      }
      
      async function loadCities(ufId) {
   	    console.log("load cities:", ufId);
      	$('#city').prop("disabled", true);
	    $('#city').html("");
        await $.ajax("https://servicodados.ibge.gov.br/api/v1/localidades/estados/" + ufId + "/municipios")
        	.then(data => {
        		// Sort cities
        		data.sort((a, b) => a.nome > b.nome ? 1 : (a.nome < b.nome ? -1 : 0))
        		    
        		// Fill city select options
        		data.forEach(c => {
            		const option = new Option(c.nome, c.nome, false, false);
          			$(option).attr('data-ibge-id', c.id) // Necessary for IBGE API city request
          			if ("${address.city}" != null && "${address.city}" != "") {
          				if ("${address.city}" == c.nome) {
          					$(option).prop('selected', true)
          				}
          			}
            		$("#city").append(option)
        		})
        		    
            	// Enable state select
            	$('#city').prop("disabled", false);
        	});
      }
      
      async function searchCEP(cep) {
    	console.log("search cep: " + cep);
		return await $.ajax('https://viacep.com.br/ws/'+ cep +'/json/unicode/');
      } 
      
      
      // Load cities on state selection
      $("#state").change(e => {
    	const selectedState = $("#state").select2("data")[0];
    	const ufId = $(selectedState.element).attr('data-ibge-id');
    	console.log('selected state:', selectedState.text);
    	
        loadCities(ufId);
      });
      
      // Search CEP and fill fields when CEP is typed and valid
      $("#cep").on('input', e => {
    	  const cep = $("#cep").val().replace("-", "");
    	  if (!cep || !cep.match(/\d{8}/)) return;
    	  
    	  searchCEP(cep)
    	  	.then(async data => {
				$("#publicPlace").val(data.logradouro);
				$("#neighbourhood").val(data.bairro);
				$("#state").val(data.uf);
				$("#state").trigger("change");
				
		    	const selectedState = $("#state").select2("data")[0];
		    	const ufId = $(selectedState.element).attr('data-ibge-id');
		    	console.log('selected state2:', selectedState.text);
		        await loadCities(ufId);
				
				//const cepUfId = $("#state option[value=" + data.uf + "]").data("ibge-id");
				//await loadCities(cepUfId);

				//$("#city").val(data.localidade);
				//$("#city option:selected").removeAttr("selected");
				$("#city option[data-ibge-id=" + data.ibge + "]").prop("selected", true);
			    $("#city").trigger("change");
    	  	});
      });
      
      // Ready
      loadStates()
      	.then(() => {
      		$("#cep").val("${address.cep}");
      		$("#cep").trigger("change");
      	});
    });
  </script>
</body>

</html>