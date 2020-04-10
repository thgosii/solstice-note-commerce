<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Produtos | LapTop Computadores</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/note-commerce/static/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link rel="preload" as="style" onload="this.onload=null; this.rel='stylesheet'"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700">


  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- bootstrap slider -->
  <link rel="stylesheet" href="/note-commerce/plugins/bootstrap-slider/css/bootstrap-slider.min.css">


  <!-- custom css -->
  <link rel="stylesheet" href="/note-commerce/static/custom/shop/products/css/products.css">
</head>

<body class="hold-transition layout-top-nav">
  <c:set var="loggedUser" value="${sessionScope.loggedUser}" />
  <div class="wrapper">

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
      <div class="container">
        <a href="#" class="navbar-brand">
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
              <a href="#" class="nav-link">Home</a>
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



        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">



          <div class="row">
            <div class="col-md-3 sticky-top">
              <div class="card card-primary card-outline">
                <div class="card-body box-profile">

                  <h4 class="text-center mb-4">Filtros</h4>

                  <form id="products-filter" method="POST">


                    <div class="row">
                      <div class="form-group text-xs mb-2 w-100">
                        <label for="maximum-price">Preço Mínimo</label>
                        <input type="number" min="0" max="100000" step="50" name="minimum-price" class="form-control form-control-sm"
                          placeholder="R$ 1000">
                      </div>
                    </div>

                    <div class="row">
                      <div class="form-group text-xs mb-2 w-100">
                        <label for="maximum-price">Preço Máximo</label>
                        <input type="number" min="0" max="100000" step="50" name="maximum-price" class="form-control form-control-sm"
                          placeholder="R$ 5000">
                      </div>
                    </div>
                    <div class="row mb-2">
                      <div class="col col-6 text-left">
                        <button type="button" class="btn btn-xs btn-secondary" id="clear-button">Limpar</button>
                      </div>
                      <div class="col col-6 text-right">
                        <button type="button" class="btn btn-xs btn-primary float-right">Aplicar</button>
                      </div>
                    </div>
                    <div class="row">
                      <ul class="list-group list-group-unbordered w-100">
                        <li class="list-group-item">
                          <div class="row mb-2">
                            <div class="col col-10">
                              <span class="text-sm">Marca</span>
                            </div>
                            <div class="col col-2">
                              <button type="button" class="btn btn-tool pull-right" data-toggle="collapse"
                                data-target="#filter-group-brand">
                                <i class="fas fa-minus"></i></button>
                            </div>
                          </div>
                          <div id="filter-group-brand" class="collapse show">
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-acer" name="brand[]" value="acer">
                              <label for="brand-acer">Acer</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-asus" name="brand[]" value="asus">
                              <label for="brand-asus">Asus</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-dell" name="brand[]" value="dell">
                              <label for="brand-dell">Dell</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-hp" name="brand[]" value="hp">
                              <label for="brand-hp">Hp</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-lenovo" name="brand[]" value="lenovo">
                              <label for="brand-lenovo">Lenovo</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-positivo" name="brand[]" value="positivo">
                              <label for="brand-positivo">Positivo</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="brand-samsung" name="brand[]" value="samsung">
                              <label for="brand-samsung">Samsung</label>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item">
                          <div class="row mb-2">
                            <div class="col col-10">
                              <span class="text-sm">Memória RAM</span>
                            </div>
                            <div class="col col-2">
                              <button type="button" class="btn btn-tool pull-right" data-toggle="collapse"
                                data-target="#filter-group-ram">
                                <i class="fas fa-minus"></i></button>
                            </div>
                          </div>
                          <div id="filter-group-ram" class="collapse show">
                            <div class="icheck-primary">
                              <input type="checkbox" id="ram-2gb" name="ram[]" value="2gb">
                              <label for="ram-2gb">2GB</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="ram-4gb" name="ram[]" value="4gb">
                              <label for="ram-4gb">4GB</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="ram-8gb" name="ram[]" value="8gb">
                              <label for="ram-8gb">8GB</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="ram-16gb" name="ram[]" value="16gb">
                              <label for="ram-16gb">16GB</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="ram-others" name="ram[]" value="others">
                              <label for="ram-others">Outros</label>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item">
                          <div class="row mb-2">
                            <div class="col col-10">
                              <span class="text-sm">Tamanho do Monitor</span>
                            </div>
                            <div class="col col-2">
                              <button type="button" class="btn btn-tool pull-right" data-toggle="collapse"
                                data-target="#filter-group-monitor">
                                <i class="fas fa-minus"></i></button>
                            </div>
                          </div>
                          <div id="filter-group-monitor" class="collapse show">
                            <div class="icheck-primary">
                              <input type="checkbox" id="monitor-upto11" name="monitor[]" value="0-11">
                              <label for="monitor-upto11">até 11 polegadas</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="monitor-11-13" name="monitor[]" value="11-13">
                              <label for="monitor-11-13">11 - 13 polegadas</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="monitor-13-15" name="monitor[]" value="13-15">
                              <label for="monitor-13-15">13 - 15 polegadas</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="monitor-15-17" name="monitor[]" value="15-17">
                              <label for="monitor-15-17">15 - 17 polegadas</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="monitor-above17" name="monitor[]" value="17-99">
                              <label for="monitor-above17">acima de 17 pol.</label>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item">
                          <div class="row mb-2">
                            <div class="col col-10">
                              <span class="text-sm">Armazenamento</span>
                            </div>
                            <div class="col col-2">
                              <button type="button" class="btn btn-tool pull-right" data-toggle="collapse"
                                data-target="#filter-group-storage">
                                <i class="fas fa-minus"></i></button>
                            </div>
                          </div>
                          <div id="filter-group-storage" class="collapse show">
                            <div class="icheck-primary">
                              <input type="checkbox" id="storage-hd" name="storage-hd" value="storage-hd">
                              <label for="storage-hd">Com HD</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" id="storage-ssd" name="storage-ssd" value="storage-ssd">
                              <label for="storage-ssd">Com SSD</label>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item">
                          <div class="row mb-2">
                            <div class="col col-10">
                              <span class="text-sm">Sistema Operacional</span>
                            </div>
                            <div class="col col-2">
                              <button type="button" class="btn btn-tool pull-right" data-toggle="collapse"
                                data-target="#filter-group-os">
                                <i class="fas fa-minus"></i></button>
                            </div>
                          </div>
                          <div id="filter-group-os" class="collapse show">
                            <div class="icheck-primary">
                              <input type="checkbox" name="os-windows" id="os-windows" value="os-windows">
                              <label for="os-windows">Windows</label>
                            </div>
                            <div class="icheck-primary">
                              <input type="checkbox" name="os-linux" id="os-linux" value="os-linux">
                              <label for="os-linux">Linux</label>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </form>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
            <!-- /.col -->

            <div class="col-md-9">
              <div class="row" id="products-row">
            
              </div>
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->



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
  
  <template id="product-card">
	  <div class="col col-4">
	     <div class="card card-primary product-card">
	       <a href="#" id="product-image-link">
	         <div class="card-body text-center">
	           <img id="product-image" class="img-fluid">
	         </div>
           </a>
	       <div class="card-footer">
	         <div class="row mb-3">
	           <a href="#" id="product-name-link" class="product-desc text-sm">
	           </a>
	         </div>
	         <div class="row">
	           <div class="col-10">
	             <span class="font-weight-bold" id="product-price"></span>
	           </div>
	           <div class="col-2">
                  <button class="btn btn-sm btn-success" name="addProduct" type="submit">
                    <i class="fas fa-cart-plus"></i>
                  </button>
	           </div>
	         </div>
	       </div>
	     </div>
	   </div>
  </template>

  <!-- REQUIRED SCRIPTS -->

  <!-- jQuery -->
  <script src="/note-commerce/static/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="/note-commerce/static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="/note-commerce/static/dist/js/adminlte.min.js"></script>

  <!-- Bootstrap slider -->
  <script src="/note-commerce/plugins/bootstrap-slider/bootstrap-slider.min.js"></script>
  
  <!-- Page scripts -->
  <script src="/note-commerce/static/custom/shop/products/js/products.js"></script>
  
  <script>
  </script>
</body>

</html>