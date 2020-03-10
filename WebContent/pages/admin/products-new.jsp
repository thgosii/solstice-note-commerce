<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Novo Laptop | LapTop Computadores</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/note-commerce/static/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link rel="preload" as="style" onload="this.onload=null; this.rel='stylesheet'"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700">

  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="/note-commerce/static/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">

  <!-- Page CSS -->
  <link rel="stylesheet" href="/note-commerce/static/custom/admin/products/css/products.css">
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
                  <form action="/note-commerce/admin/products" method="POST">
                    <input type="hidden" name="operation" value="consult">
                    <button class="nav-link btn text-white w-100 text-left">
                      <i class="fas fa-table nav-icon text-info"></i>
                      <p>Todos Laptops</p>
                    </button>
                  </form>
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
              <a href="../login.html" class="nav-link">
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
              <h1>Novo Laptop</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="dashboard.html">Admin Home</a></li>
                <li class="breadcrumb-item"><a href="products-list.html">Laptops</a></li>
                <li class="breadcrumb-item active">Novo Laptop</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">

          <form action="/note-commerce/admin/products" method="POST" enctype="multipart/form-data">
            <c:if test="${empty param.operation}">
              <input type="hidden" name="operation" value="save">
            </c:if>
            <c:if test="${not empty param.operation}">
              <input type="hidden" name="operation" value="<c:out value="${param.operation}"/>">
            </c:if>
            <div class="row">
              <div class="col col-12">
                <div class="card card-default">
                  <div class="card-header">
                    <h3 class="card-title">Dados Básicos</h3>

                    <div class="card-tools">
                      <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                          class="fas fa-minus"></i></button>
                    </div>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body">
                    <div class="row">
                      <div class="col col-9">
                        <div class="form-group">
                          <label for="title">Título<span class="text-danger text-bold"> *</span></label>
                          <input type="text" maxlength="200" class="form-control" name="title" id="title"
                            placeholder="Título completo do laptop">
                        </div>
                      </div>
                      <div class="col col-3">
                        <div class="form-group">
                          <label for="price">Preço<span class="text-danger text-bold"> *</span></label>
                          <input type="text" class="form-control" name="price" id="price">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col col-4">
                        <div class="form-group h-100">
                          <label for="title">Imagem</label>
                          <div class="product-img-display">
                          </div>
                          <input id="image" name="image" type="file" class="custom-file-input">
                        </div>
                      </div>
                      <div class="col col-8">
                        <div class="form-group">
                          <label for="price">Descrição</label>
                          <textarea class="form-control" maxlength="4000" name="description" id="description"></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col col-12">
                <div class="card card-default">
                  <div class="card-header">
                    <h3 class="card-title">Especificações</h3>

                    <div class="card-tools">
                      <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                          class="fas fa-minus"></i></button>
                    </div>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body">
                    <div class="row">
                      <div class="col col-3">
                        <div class="form-group">
                          <label for="brand">Marca<span class="text-danger text-bold"> *</span></label>
                          <select class="form-control select2bs4" style="width: 100%;" name="brand" id="brand">
                            <option value="1" selected="selected">Acer</option>
                            <option value="2" >Asus</option>
                            <option value="3" >Dell</option>
                            <option value="4" >Hp</option>
                            <option value="5" >Lenovo</option>
                            <option value="6" >Positivo</option>
                            <option value="7" >Samsung</option>
                          </select>
                        </div>
                      </div>
                      <div class="col col-3">
                        <div class="form-group">
                          <label for="processor">Processador<span class="text-danger text-bold"> *</span></label>
                          <input type="text" class="form-control" name="processor" id="processor"
                            placeholder="i5-2900, Pentium...">
                        </div>
                      </div>
                      <div class="col col-4">
                        <div class="form-group">
                          <label for="processor">Placa de Vídeo<span class="text-danger text-bold"> *</span></label>
                          <input type="text" class="form-control" name="graphics_card" id="graphics_card"
                            placeholder="Intel Graphics Card 20, NVDIA...">
                        </div>
                      </div>
                      <div class="col col-2">
                        <div class="form-group">
                          <label for="ram">Memória RAM<span class="text-danger text-bold"> *</span></label>
                          <input type="text" class="form-control" name="ram" id="ram" value="4">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col col-3">
                        <div class="form-group">
                          <label for="monitor">Monitor<span class="text-danger text-bold"> *</span></label>
                          <input type="text" class="form-control" name="monitor" id="monitor">
                        </div>
                      </div>
                      <div class="col col-1">
                      </div>
                      <div class="col col-2">
                        <div class="form-group">
                          <div class="icheck-primary d-inline">
                            <input type="checkbox" id="has-hd" name="has-hd" checked>
                            <label for="has-hd">HD</label>
                          </div>
                          <input id="hd-capacity" name="hd-capacity" type="text" class="form-control d-inline">
                        </div>
                      </div>
                      <div class="col col-2">
                        <div class="form-group">
                          <div class="icheck-primary d-inline">
                            <input type="checkbox" id="has-ssd" name="has-ssd" checked>
                            <label for="has-ssd">SSD</label>
                          </div>
                          <input id="ssd-capacity" name="ssd-capacity" type="text" class="form-control d-inline">
                        </div>
                      </div>
                      <div class="col col-1">
                      </div>
                      <div class="col col-3">
                        <div class="form-group">
                          <label for="monitor">Sistema Operacional<span class="text-danger text-bold"> *</span></label>
                          <select class="form-control select2bs4" style="width: 100%;" name="os" id="os">
                            <option selected>Windows</option>
                            <option>Linux</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col col-6">
                <a href="products-list.html" class="btn btn-block btn-danger" role="button">Cancelar</a>
              </div>
              <div class="col col-6">
                <!-- <a href="products-list.html" class="btn btn-block btn-primary" role="button">Cadastrar</a> -->
                <button type="submit" class="btn btn-block btn-primary">Cadastrar</button>
              </div>
            </div>
          </form>

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
      <strong>Desenvolvido por Solstice</strong>
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

  <!-- Select2 -->
  <script src="/note-commerce/static/plugins/select2/js/select2.full.min.js"></script>
  <!-- InputMask -->
  <script src="/note-commerce/static/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>

  <!-- Page JavaScript -->
  <script src="/note-commerce/static/custom/admin/products/js/image-display.js"></script>
  <script src="/note-commerce/static/custom/general/js/error_label.js"></script>

  <script>
    $(document).ready(() => {
      // Initialize Select2 Elements
      $('.select2bs4').select2({
        theme: 'bootstrap4'
      })

      $('#price').inputmask('currency', {
        groupSeparator: ',',
        digits: 2,
        radixPoint: '.',
        prefix: 'R$ ',
        max: 100000,
        allowMinus: false,
        autoUnmask: true,
        removeMaskOnSubmit: true
      });

      $('#ram').inputmask('numeric', {
        digits: 0,
        min: 0,
        max: 32,
        suffix: ' GB',
        allowMinus: false,
        autoUnmask: true,
        removeMaskOnSubmit: true
      });

      $('#monitor').inputmask('numeric', {
        digits: 1,
        min: 7,
        max: 25,
        suffix: ' polegadas',
        allowMinus: false,
        autoUnmask: true,
        removeMaskOnSubmit: true
      });

      $('.product-img-display').click(() => $('#image').click());

      $('#has-hd').click(() => {
        $('#hd-capacity').prop('disabled', !$('#has-hd')[0].checked);
        if ($('#hd-capacity').prop('disabled')) {
          $('#hd-capacity').val(null);
          $('#has-ssd')[0].checked = true;
          $('#ssd-capacity').prop('disabled', false);
        }
      });

      $('#hd-capacity').inputmask('numeric', {
        digits: 0,
        max: 4000,
        suffix: ' GB',
        allowMinus: false,
        autoUnmask: true,
        removeMaskOnSubmit: true
      });

      $('#has-ssd').click(() => {
        $('#ssd-capacity').prop('disabled', !$('#has-ssd')[0].checked);
        if ($('#ssd-capacity').prop('disabled')) {
          console.log(2)
          $('#ssd-capacity').val(null);
          $('#has-hd')[0].checked = true;
          $('#hd-capacity').prop('disabled', false);
        }
      });

      $('#ssd-capacity').inputmask('numeric', {
        digits: 0,
        max: 4000,
        suffix: ' GB',
        allowMinus: false,
        autoUnmask: true,
        removeMaskOnSubmit: true
      });

      <c:if test="${not empty message}">
        displayFormErrors(`
     		<c:out value="${message}"/>
        `)
      </c:if>
    })
  </script>
</body>

</html>