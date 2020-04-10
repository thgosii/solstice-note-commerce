<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Dashboard | LapTop Computadores</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/note-commerce/static/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link rel="preload" as="style" onload="this.onload=null; this.rel='stylesheet'"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700">

  <!-- daterange picker -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/daterangepicker/daterangepicker.css">
  <!-- jVectorMap -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/jvectormap/jquery-jvectormap-2.0.5.css">
</head>

<body class="hold-transition sidebar-mini sidebar-collapse">
  <div class="wrapper">





    <!-- *********************************************************************************** -->





    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
      <!-- Left navbar links -->
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
        </li>
      </ul>

      <!-- Right navbar links -->
      <ul class="navbar-nav ml-auto">
        <li class="nav-item d-none d-sm-inline-block">
          <a href="#" class="nav-link"><c:out value="${loggedUser.email}"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/note-commerce/logout">
            <i class="fas fa-sign-out-alt"></i>
          </a>
        </li>
      </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <a href="/admin/dashboard" class="brand-link text-center">
        <span class="brand-text font-weight-light">LapTop Computadores</span>
      </a>

      <!-- Sidebar -->
      <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <div class="info">
            <a href="#" class="d-block">Usuário Admin</a>
          </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <li class="nav-item">
              <a href="/note-commerce/pages/admin/dashboard.jsp" class="nav-link">
                <i class="nav-icon fas fa-tachometer-alt"></i>
                <p>
                  Dashboard
                </p>
              </a>
            </li>
            <!-- <li class="nav-header">MULTI LEVEL EXAMPLE</li> -->
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="fas fa-laptop nav-icon"></i>
                <p>Laptops</p>
                <i class="right fas fa-angle-left"></i>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="/note-commerce/pages/admin/products-new.jsp" class="nav-link">
                    <i class="fas fa-plus nav-icon text-success"></i>
                    <p>Novo Laptop</p>
                  </a>
                </li>
                <li class="nav-item has-treeview">
                  <a href="/note-commerce/admin/products?operation=consult" class="nav-link">
                  <i class="fas fa-table nav-icon text-info"></i>
                  <p>Todos Laptops</p></a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="sales.html" class="nav-link">
                <i class="nav-icon fas fa-dollar-sign"></i>
                <p>Vendas</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="exchanges.html" class="nav-link">
                <i class="nav-icon fas fa-exchange-alt"></i>
                <p>Trocas</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="nav-icon fas fa-warehouse"></i>
                <p>Estoque</p>
                <i class="right fas fa-angle-left"></i>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="stock-up.html" class="nav-link">
                    <i class="nav-icon fas fa-arrow-up text-success"></i>
                    <p>Entrada em estoque</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="/note-commerce/logout" class="nav-link">
                <i class="nav-icon fas fa-sign-out-alt"></i>
                <p>Sair</p>
              </a>
            </li>
          </ul>
        </nav>
        <!-- /.sidebar-menu -->
      </div>
      <!-- /.sidebar -->
    </aside>





    <!-- *********************************************************************************** -->





    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Dashboard</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="dashboard.html">Admin Home</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">

          <div class="row">
            <div class="col col-12">
              <div class="form-group">

                <div class="input-group input-group-lg">
                  <label for="" class="text-lg mr-3">Intervalo dos dados:</label>
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="far fa-calendar-alt"></i>
                    </span>
                  </div>
                  <button type="button" class="btn btn-default float-right" id="time-option">
                    Escolha um periodo
                    <i class="fas fa-caret-down"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col col-7">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Vendas por Marca</h3>

                  <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                      <i class="fas fa-minus"></i>
                    </button>
                  </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0">
                  <div id="sales-brand-chart"></div>
                </div>
                <!-- /.card-body -->
              </div>
            </div>
            <div class="col col-5">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Vendas por Região de Entrega</h3>

                  <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                      <i class="fas fa-minus"></i>
                    </button>
                  </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0">
                  <div id="region-sales-map" style="height: 465px;"></div>
                </div>
                <!-- /.card-body -->
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col col-6">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Laptops com mais trocas</h3>

                  <!-- <div class="card-tools">
                    <div class="input-group input-group-sm" style="width: 150px;">
                      <input type="number" min="5" max="100" step="1" placeholder="linhas" name="table_search"
                        class="w-25 form-control float-right" placeholder="Search">

                      <div class="input-group-append">
                        <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                      </div>
                      <button type="button" class="btn btn-tool" data-card-widget="collapse">
                        <i class="fas fa-minus"></i>
                      </button>
                    </div>
                  </div> -->
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0" style="height: 400px;">
                  <table class="table table-head-fixed">
                    <thead>
                      <tr>
                        <th>Título</th>
                        <th>Trocados</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenovo L-421 Core Duo GTX 1080 Ti 4GB RAM asd asd asd asd </a>
                        </td>
                        <td>123</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenovo L-23452 gRTEE EGSEGS 4GB RAM asd asd asd asd </a>
                        </td>
                        <td>321</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenovo L-421 Core Duo GTX 1080 Ti 4GB RAM asd asd asd asd </a>
                        </td>
                        <td>5215</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenovo L-421 Core Duo GTX 1080 Ti 4GB RAM asd asd asd asd </a>
                        </td>
                        <td>123</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenovo L-421 Core Duo GTX 1080 Ti 4GB RAM asd asd asd asd </a>
                        </td>
                        <td>123</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenovo L-421 Core Duo GTX 1080 Ti 4GB RAM asd asd asd asd </a>
                        </td>
                        <td>123</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Le gragg argrg rd gdrdg gsd asd asd asd </a>
                        </td>
                        <td>123</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenasfasfassf asfaf asf saf assd asd asd </a>
                        </td>
                        <td>123</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
            </div>
            <div class="col col-6">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Laptops mais vendidos</h3>

                  <!-- <div class="card-tools">
                    <div class="input-group input-group-sm" style="width: 150px;">
                      <input type="number" min="5" max="100" step="1" placeholder="linhas" name="table_search"
                        class="w-25 form-control float-right" placeholder="Search">

                      <div class="input-group-append">
                        <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                      </div>
                      <button type="button" class="btn btn-tool" data-card-widget="collapse">
                        <i class="fas fa-minus"></i>
                      </button>
                    </div>
                  </div> -->
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0" style="height: 400px;">
                  <table class="table table-head-fixed">
                    <thead>
                      <tr>
                        <th>Título</th>
                        <th>Vendidos</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenovo L-421 Core Duo GTX 1080 Ti 4GB RAM asd asd asd asd </a>
                        </td>
                        <td>123</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenovo L-23452 gRTEE EGSEGS 4GB RAM asd asd asd asd </a>
                        </td>
                        <td>321</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenovo L-421 Core Duo GTX 1080 Ti 4GB RAM asd asd asd asd </a>
                        </td>
                        <td>5215</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenovo L-421 Core Duo GTX 1080 Ti 4GB RAM asd asd asd asd </a>
                        </td>
                        <td>123</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenovo L-421 Core Duo GTX 1080 Ti 4GB RAM asd asd asd asd </a>
                        </td>
                        <td>123</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenovo L-421 Core Duo GTX 1080 Ti 4GB RAM asd asd asd asd </a>
                        </td>
                        <td>123</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Le gragg argrg rd gdrdg gsd asd asd asd </a>
                        </td>
                        <td>123</td>
                      </tr>
                      <tr>
                        <td style="width: 80%">
                          <a href="#">Laptop Lenasfasfassf asfaf asf saf assd asd asd </a>
                        </td>
                        <td>123</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
            </div>
          </div>

        </div><!-- /.container-fluid -->
      </section>
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

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
  </div>
  <!-- ./wrapper -->

  <!-- jQuery -->
  <script src="/note-commerce/static/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="/note-commerce/static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="/note-commerce/static/dist/js/adminlte.min.js"></script>

  <!-- ApexCharts -->
  <script src="/note-commerce/static/plugins/apexcharts/apexcharts.min.js"></script>
  <!-- date-range-picker -->
  <script src="/note-commerce/static/plugins/moment/moment-with-locales.min.js"></script>
  <script src="/note-commerce/static/plugins/moment/locale/pt-br.js"></script>
  <script src="/note-commerce/static/plugins/daterangepicker/daterangepicker.js"></script>
  <!-- jVectorMap -->
  <script src="/note-commerce/static/plugins/jvectormap/jquery-jvectormap-2.0.5.min.js"></script>
  <script src="/note-commerce/static/plugins/jvectormap/brazil.js"></script>
  
  <script src="/note-commerce/static/custom/admin/dashboard/js/dashboard.js"></script>

  <script>

    $(document).ready(() => {

    });

  </script>
</body>

</html>