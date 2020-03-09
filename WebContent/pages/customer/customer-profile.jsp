<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>LapTop Computadores</title>

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
        <a href="../shop/products.html" class="navbar-brand">
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
              <a href="../shop/products.html" class="nav-link">Home</a>
            </li>
            <li class="nav-item dropdown">
              <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                class="nav-link dropdown-toggle">Laptops</a>
              <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
                <li><a href="#" class="dropdown-item">Mais vendidos</a></li>
                <li><a href="#" class="dropdown-item">Mais recentes</a></li>

                <li class="dropdown-divider"></li>

                <!-- Level two dropdown-->
                <li class="dropdown-submenu dropdown-hover">
                  <a id="dropdownSubMenu2" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false" class="dropdown-item dropdown-toggle">Por Marca</a>
                  <ul aria-labelledby="dropdownSubMenu2" class="dropdown-menu border-0 shadow">
                    <li>
                      <a href="#" class="dropdown-item">Acer</a>
                    </li>
                    <li>
                      <a href="#" class="dropdown-item">Samsung</a>
                    </li>
                    <li>
                      <a href="#" class="dropdown-item">HP</a>
                    </li>
                    <li>
                      <a href="#" class="dropdown-item">Dell</a>
                    </li>
                  </ul>
                </li>
                <!-- End Level two -->
              </ul>
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
              Saldo digital: <strong>R$ 250,00</strong>
            </a>
          </li>
          <!-- Carrinho -->
          <li class="nav-item">
            <a class="nav-link" href="../shop/cart.html">
              <i class="fas fa-shopping-cart"></i>
              <span class="badge badge-danger navbar-badge">4</span>
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
              <a href="../customer/customer-profile.html" class="dropdown-item">
                <i class="fas fa-user mr-2"></i> Meus dados
              </a>
              <a href="../customer/customer-address-list.html" class="dropdown-item">
                <i class="fas fa-address-card mr-2"></i> Meus endereços
              </a>
              <a href="../customer/customer-credit-card-list.html" class="dropdown-item">
                <i class="fas fa-credit-card mr-2"></i> Meus cartões
              </a>
              <a href="../shop/sales.html" class="dropdown-item">
                <i class="fas fa-box-open mr-2"></i> Pedidos
              </a>
              <a href="../shop/exchanges.html" class="dropdown-item">
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
          <div class="card">
            <div class="card-body register-card-body">
              <form action="#" method="POST">
                <div class="input-group mb-3">
                  <input type="text" class="form-control" name="name" placeholder="Nome" value="${customer.name}">
                  <div class="input-group-append">
                    <div class="input-group-text">
                      <span class="fas fa-user"></span>
                    </div>
                  </div>
                </div>
                <div class="input-group mb-3">
                  <input type="text" class="form-control" id="cpf" name="cpf" placeholder="CPF" value="${customer.cpf}" disabled>
                  <div class="input-group-append">
                    <div class="input-group-text">
                      <span class="fas fa-address-card"></span>
                    </div>
                  </div>
                </div>
                <div class="input-group mb-3">
                  <select class="form-control" name="gender">
                    <option disabled>Gênero...</option>
                    <option value="f" ${client.gender.toString().toLowerCase() == 'female' ? 'selected' : ''}>Feminino</option>
                    <option value="m" ${client.gender.toString().toLowerCase() == 'male' ? 'selected' : ''}>Masculino</option>
                  </select>
                </div>
                <div class="input-group mb-3">
                  <input type="date" class="form-control" name="dateOfBirth" placeholder="Data de nascimento" value="${customer.dateOfBirth}">
                  <div class="input-group-append">
                    <div class="input-group-text">
                      <span class="fas fa-calendar-alt"></span>
                    </div>
                  </div>
                </div>
                <div class="input-group mb-3">
                  <input type="text" class="form-control" id="phone" name="phone" placeholder="Telefone" value="${customer.phone}">
                  <div class="input-group-append">
                    <div class="input-group-text">
                      <span class="fas fa-phone"></span>
                    </div>
                  </div>
                </div>
                <div class="input-group mb-3">
                  <input type="email" class="form-control" name="email" placeholder="E-mail" value="${customer.user.email}">
                  <div class="input-group-append">
                    <div class="input-group-text">
                      <span class="fas fa-envelope"></span>
                    </div>
                  </div>
                </div>
                <div class="input-group mb-3">
                  <input type="password" class="form-control" name="password" placeholder="Senha">
                  <div class="input-group-append">
                    <div class="input-group-text">
                      <span class="fas fa-lock"></span>
                    </div>
                  </div>
                </div>
                <div class="input-group mb-3">
                  <input type="password" class="form-control" name="confirmPassword"
                    placeholder="Insira a senha novamente">
                  <div class="input-group-append">
                    <div class="input-group-text">
                      <span class="fas fa-lock"></span>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-1">
                    <button type="submit" class="btn btn-primary btn-block">Salvar</button>
                  </div>
                  <div class="col-2">
                    <button type="submit" class="btn btn-danger btn-block">Invativar Conta</button>
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
      <strong>Desenvolvido por Solstice</strong>
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