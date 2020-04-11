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
          <form id="form-header-search" action="/note-commerce/pages/shop/products.jsp" method="GET" class="form-inline ml-0 ml-md-3">
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
              <a href="sales.html" class="dropdown-item">
                <i class="fas fa-box-open mr-2"></i> Pedidos
              </a>
              <a href="exchanges.html" class="dropdown-item">
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
          <div class="col-sm-6 mb-3">
            <h1>Passo 3 de 3 - Revisão</h1>
          </div>
          <div class="progress mb-3">
            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="100" aria-valuemin="0"
              aria-valuemax="100" style="width: 100%">
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">
          <table class="table table-striped">
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
              </tr>
            </thead>
            <tbody>
              <!--<tr>
                <td>
                  <img src="../../static/custom/general/img/laptop-sample1.png" style="width: 70px; height: 50px;">
                </td>
                <td>Notebook Acer Aspire 5 - 8GB RAM - SSD - I5 </td>
                <td>R$ 2.444,21</td>
                <td>
                  2
                </td>
                <td>R$ 4888,42</td>
              </tr>-->
          </table>
          <hr>
          <div class="mb-4">
            <h4>Endereço</h4>
            <table class="table table-striped">
              <tbody>
                <tr>
                  <td><strong>Cidade</strong></td>
                  <td></td>
                </tr>
                <tr>
                  <td><strong>Estado</strong></td>
                  <td></td>
                </tr>
                <tr>
                  <td><strong>Número</strong></td>
                  <td></td>
                </tr>
                <tr>
                  <td><strong>Complemento</strong></td>
                  <td></td>
                </tr>
              </tbody>
            </table>
          </div>
          <hr>
          <div class="mb-4">
            <h4>Pagamento</h4>
            <table class="table table-striped">
              <thead>
                <td><strong>Forma de pagamento</strong></td>
                <td><strong>Valor</strong></td>
              </thead>
              <tbody>
                <tr>
                  <td>
                    <strong>Cartão</strong>
                  </td>
                  <td>
                    
                  </td>
                </tr>
                <tr>
                  <td>
                    <strong>Saldo virtual</strong>
                  </td>
                  <td>
                    
                  </td>
                </tr>
              </tbody>
            </table>
            <hr>
            <table class="table table-striped">
              <tbody>
                <tr>
                  <td style="width: 61%;">
                    <strong>Subtotal</strong>
                  </td>
                  <td></td>
                </tr>
                <tr>
                  <td style="width: 61%;">
                    <strong>Entrega</strong>
                  </td>
                  <td></td>
                </tr>
                <tr>
                  <td style="width: 61%;">
                    <strong>Total</strong>
                  </td>
                  <td></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div style="padding-bottom: 60px;">
            <a href="/note-commerce/pages/shop/checkout-finish.jsp" class="btn btn-primary float-right"
            id="nextStepButtonByData"><i class="fas fa-check-circle fa-lg mr-2"></i>Finalizar</a>
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
</body>

</html>