<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Dashboard | LapTop Computadores</title>

  <!-- *********************************************************************************** -->
  <!-- REQUIRED STYLES -->
  <!-- *********************************************************************************** -->
  <jsp:include page="/fragments/general/styles.jsp"></jsp:include>
  <!-- *********************************************************************************** -->
  <!-- /REQUIRED STYLES -->
  <!-- *********************************************************************************** -->



  <!-- *********************************************************************************** -->
  <!-- PAGE PLUGIN STYLES -->
  <!-- *********************************************************************************** -->
  <!-- daterange picker -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/daterangepicker/daterangepicker.css">
  <!-- jVectorMap -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/jvectormap/jquery-jvectormap-2.0.5.css">
  <!-- *********************************************************************************** -->
  <!-- /PAGE PLUGIN STYLES -->
  <!-- *********************************************************************************** -->



  <!-- *********************************************************************************** -->
  <!-- PAGE CUSTOM STYLES -->
  <!-- *********************************************************************************** -->

  <!-- *********************************************************************************** -->
  <!-- /PAGE CUSTOM STYLES -->
  <!-- *********************************************************************************** -->
</head>



<body class="hold-transition sidebar-mini sidebar-collapse">

  <c:set var="loggedUser" value="${sessionScope.loggedUser}" />

  <div class="wrapper">
    <!-- *********************************************************************************** -->
    <!-- ADMIN SIDEBAR AND NAVBAR -->
    <!-- *********************************************************************************** -->
    <jsp:include page="/fragments/admin/navbar.jsp"></jsp:include>
    <jsp:include page="/fragments/admin/sidebar.jsp"></jsp:include>
    <!-- *********************************************************************************** -->
    <!-- /ADMIN SIDEBAR AND NAVBAR -->
    <!-- *********************************************************************************** -->



    <!-- *********************************************************************************** -->
    <!-- PAGE CONTENT -->
    <!-- *********************************************************************************** -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Dashboard</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="/note-commerce/pages/admin/dashboard.jsp">Admin Home</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">

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
                  <h3 class="card-title">Laptops com mais unidades vendidas</h3>

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
                <div id="sale-table" class="card-body table-responsive p-0" style="height: 400px;">
                  <table class="table table-head-fixed">
                    <thead>
                      <tr>
                        <th>Título</th>
                        <th>Vendidos</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
            </div>
            <div class="col col-6">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Laptops com mais unidades trocadas e devolvidas</h3>

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
                <div id="trade-table" class="card-body table-responsive p-0" style="height: 400px;">
                  <table class="table table-head-fixed">
                    <thead>
                      <tr>
                        <th>Título</th>
                        <th>Trocados/Devolvidos</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
            </div>
          </div>

        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content -->
    </div>
    <!-- *********************************************************************************** -->
    <!-- /PAGE CONTENT -->
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



  <!-- *********************************************************************************** -->
  <!-- PAGE EXTRA HTML -->
  <!-- *********************************************************************************** -->

  <!-- *********************************************************************************** -->
  <!-- /PAGE EXTRA HTML -->
  <!-- *********************************************************************************** -->
</body>



<!-- *********************************************************************************** -->
<!-- REQUIRED SCRIPTS -->
<!-- *********************************************************************************** -->
<jsp:include page="/fragments/general/scripts.jsp"></jsp:include>
<!-- *********************************************************************************** -->
<!-- /REQUIRED SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PAGE PLUGINS SCRIPTS -->
<!-- *********************************************************************************** -->
  <!-- ApexCharts -->
  <script src="/note-commerce/static/plugins/apexcharts/apexcharts.min.js"></script>
  <!-- date-range-picker -->
  <script src="/note-commerce/static/plugins/moment/moment-with-locales.min.js"></script>
  <script src="/note-commerce/static/plugins/moment/locale/pt-br.js"></script>
  <script src="/note-commerce/static/plugins/daterangepicker/daterangepicker.js"></script>
  <!-- jVectorMap -->
  <script src="/note-commerce/static/plugins/jvectormap/jquery-jvectormap-2.0.5.min.js"></script>
  <script src="/note-commerce/static/plugins/jvectormap/brazil.js"></script>
<!-- *********************************************************************************** -->
<!-- /PAGE PLUGINS SCRIPTS -->
<!-- *********************************************************************************** -->


  

<!-- *********************************************************************************** -->
<!-- PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->
  <script src="/note-commerce/static/custom/admin/dashboard/js/dashboard.js"></script>
<!-- *********************************************************************************** -->
<!-- /PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->
<script>
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>
