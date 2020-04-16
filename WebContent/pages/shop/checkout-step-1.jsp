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

  <title>Entrega | LapTop Computadores</title>

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



<body class="hold-transition layout-top-nav">

  <c:set var="loggedUser" value="${sessionScope.loggedUser}" />

  <div class="wrapper">
    <!-- *********************************************************************************** -->
    <!-- SHOP/CUSTOMER NAVBAR -->
    <!-- *********************************************************************************** -->
    <jsp:include page="/fragments/shop/navbar.jsp"></jsp:include>
    <!-- *********************************************************************************** -->
    <!-- /SHOP/CUSTOMER NAVBAR -->
    <!-- *********************************************************************************** -->



    <!-- *********************************************************************************** -->
    <!-- PAGE CONTENT -->
    <!-- *********************************************************************************** -->
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

          <div class="col-sm-6 mb-3">
            <h1>Passo 1 de 3 - Endereço de entrega</h1>
          </div>
          <div class="progress mb-3">
            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="33.33" aria-valuemin="0"
              aria-valuemax="100" style="width: 33.33%">
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Selecione um endereço cadastrado</h3>
            </div>
            <div class="card-body register-card-body">
              <div class="form-group">
                <label for="address">Endereço</label>
                <select class="form-control" id="address" name="address">

                </select>
              </div>
              <a href="/note-commerce/pages/shop/checkout-step-2.jsp" class="btn btn-primary float-right">Próximo</a>
            </div>
          </div>
          <div class="text-center">
            <p>- OU -</p>
          </div>
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Insira os dados do endereço</h3>
            </div>
            <div class="card-body register-card-body">
              <div class="input-group mb-3">
                <input type="text" class="form-control" id="cep" name="cep" placeholder="CEP">
              </div>
              <div class="input-group mb-3">
                <input type="text" class="form-control" id="publicPlace" name="publicPlace" placeholder="Logradouro">
              </div>
              <div class="form-group">
                <label for="state">Estado</label>
                <select class="form-control" id="state" name="state">

                </select>
              </div>
              <div class="form-group">
                <label for="city">Cidade</label>
                <select class="form-control" id="city" name="city">

                </select>
              </div>
              <div class="input-group mb-3">
                <input type="text" class="form-control" id="neighbourhood" name="neighbourhood" placeholder="Bairro">
              </div>
              <div class="input-group mb-3">
                <input type="text" class="form-control" id="number" name="number" placeholder="Número">
              </div>
              <div class="input-group mb-3">
                <input type="text" class="form-control" id="complement" name="complement" placeholder="Complemento">
              </div>
              <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" id="cbFuture">
                <label class="form-check-label" for="cbFuture">Cadastrar esse endereço para compras futuras</label>
              </div>
              <a href="/note-commerce/pages/shop/checkout-step-2.jsp" class="btn btn-primary float-right">Próximo</a>
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
<!-- jQuery InputMask -->
<script src="/note-commerce/static/plugins/inputmask/jquery.inputmask.bundle.js"></script>
<!-- *********************************************************************************** -->
<!-- /PAGE PLUGINS SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->

<!-- *********************************************************************************** -->
<!-- /PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->
<script type="text/javascript">
  $(document).ready(function () {
    $("#cep").inputmask("99999-999");

    $.ajax({
      url: '/note-commerce/customer/adresses?operation=consult&isAsync=true',
      type: 'GET',
      dataType: 'json',
      success: function (json) {
        $.each(json, function (i, value) {
          let addressLabel = value.cep + ", " + value.publicPlace + ", " + value.city + ", " + value.state;
          $('#address').append($(`<option>`).text(addressLabel).attr('value', value.id));
        });
      }
    });
  });	
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>