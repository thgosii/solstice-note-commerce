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

  <title>Meus Dados | LapTop Computadores</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/note-commerce/static/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link rel="preload" as="style" onload="this.onload=null; this.rel='stylesheet'"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700">
</head>

<body class="hold-transition layout-top-nav">  
  <c:if test="${not empty requestScope.client}">
    <c:set var="customer" value="${requestScope.client}"/>
  </c:if>
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
          <form id="form-header-search" action="#" method="GET" class="form-inline ml-0 ml-md-3">
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
            <h1>Meus dados</h1>
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
              <form action="/note-commerce/customer" method="POST">
              	<input type="hidden" name="operation" value="update">
				<input type="hidden" name="customerId" value="${customer.id}">
				<input type="hidden" name="customerUserId" value="${customer.user.id}">
				<input type="hidden" name="cpf" value="${customer.getDecoratedCpf()}">
				<input type="hidden" name="email" value="${customer.user.email}">
                <div class="form-group">
                  <label for="name">Nome<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" name="name" id="name" placeholder="Nome" value="${customer.name}">
                </div>
                <div class="form-group">
                  <label for="cpf">CPF<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="cpf" placeholder="CPF" value="${customer.cpf}" disabled>
                </div>
                <div class="form-group">
                  <label for="gender">Gênero<span class="text-danger text-bold"> *</span></label>
                  <select class="form-control" name="gender">
                    <option disabled>Gênero...</option>
                    <option value="f" ${customer.gender.toString().toLowerCase() == 'female' ? 'selected' : ''}>Feminino</option>
                    <option value="m" ${customer.gender.toString().toLowerCase() == 'male' ? 'selected' : ''}>Masculino</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="dateOfBirth">Data de nascimento<span class="text-danger text-bold"> *</span></label>
                  <input type="date" class="form-control" name="dateOfBirth" id="dateOfBirth" placeholder="Data de nascimento" value="${customer.dateOfBirth}">
                </div>
                <div class="form-group">
                  <label for="phone">Telefone<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="phone" name="phone" placeholder="Telefone" value="${customer.phone}">
                </div>
                <div class="form-group">
                  <label for="email">E-mail<span class="text-danger text-bold"> *</span></label>
                  <input type="email" class="form-control" placeholder="E-mail" id="email" value="${customer.user.email}" disabled>
                </div>
                <div class="form-group">
                  <label for="password">Senha<span class="text-danger text-bold"> *</span></label>
                  <input type="password" class="form-control" name="password" id="password" placeholder="Senha">
                </div>
                <div class="form-group">
                  <label for="confirmPassword">Confirmar senha<span class="text-danger text-bold"> *</span></label>
                  <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Insira a senha novamente">
                </div>
                <div class="mb-3">
		          <span>A senha deve conter: 8 caracteres, uma letra minúscula e uma maiúscula, um caractere especial ou um número</span>
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
      $("#cpf").inputmask("999.999.999-99");
      $("#phone").inputmask({
        mask: ["(99) 9999-9999", "(99) 99999-9999"]
      });
    });
  </script>
</body>

</html>