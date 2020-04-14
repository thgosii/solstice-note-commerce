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

  <title>Forma de Pagamento | LapTop Computadores</title>

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
          <div class="col-sm-6 mb-3">
            <h1>Passo 2 de 3 - Forma de pagamento</h1>
          </div>
          <div class="progress mb-3">
            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="66.66" aria-valuemin="0"
              aria-valuemax="100" style="width: 66.66%">
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
              <h3 class="card-title">Saldo virtual - <small>Você tem <strong>R$ 0,00</strong> em saldo virtual</small>
              </h3>
            </div>
            <div class="card-body register-card-body">
              <h4 class="mb-4">Total: R$ 0,00</h4>
              <div class="form-check mb-3">
                <input class="form-check-input" id="cbVirtual" type="checkbox">
                <label class="form-check-label" for="cbVirtual">Saldo virtual</label>
              </div>
              <div class="input-group mb-3">
                <input type="number" class="form-control" id="virtual" placeholder="Valor saldo virtual">
              </div>
            </div>
          </div>


          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Cartão de crédito</h3>
            </div>
            <div class="card-body register-card-body">
              <div class="form-check mb-3">
                <input class="form-check-input" id="cbCreditCard" type="checkbox">
                <label class="form-check-label" for="cbCreditCard">Cartão de crédito</label>
              </div>
              <p>Selecione um cartão de crédito cadastrado</p>
              <div class="form-group">
                <label for="creditCard">Cartão de crédito</label>
                <select class="form-control" id="creditCard">
                </select>
              </div>
              <p class="text-center mb - 2">- OU -</p>
              <p>Insira os dados do cartão</p>
              <form id="formCreditCard" action="#" method="POST">
                <div class="input-group mb-3">
                  <input type="text" class="form-control" name="number" placeholder="Número do cartão">
                </div>
                <div class="input-group mb-3">
                  <input type="text" class="form-control" name="name" placeholder="Nome impresso no cartão">
                </div>
                <div class="input-group mb-3">
                  <input type="text" class="form-control" name="securityCode" placeholder="Código de segurança">
                </div>
                <div class="form-check mb-3">
                  <input class="form-check-input" id="cbFuture" type="checkbox">
                  <label class="form-check-label" for="cbFuture">Cadastrar esse cartão de crédito para compras
                    futuras</label>
                </div>
                <button type="button" onclick="window.location.href='/note-commerce/pages/shop/checkout-step-3.jsp';"
                  class="btn btn-primary float-right" id="nextStepButtonByData">Próximo</button>
              </form>
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
<script>
  $(function () {
    enable_virtual_input();
    enable_credit_card_select();
    $("#cbVirtual").click(enable_virtual_input);
    $("#cbCreditCard").click(enable_credit_card_select);
  });

  function enable_virtual_input() {
    enableOrDisableCheckboxes();
    $("#virtual").prop("disabled", !this.checked);
  }

  function enable_credit_card_select() {
    enableOrDisableCheckboxes();
    $("#creditCard").prop("disabled", !this.checked);
    $("#formCreditCard :input").prop("disabled", !this.checked);
  }

  function enableOrDisableCheckboxes() {
    if (!$("#cbVirtual").is(":checked") && !$("#cbCreditCard").is(":checked")) {
      $("#nextStepButtonByData").prop("disabled", true);
      $("#nextStepButtonBySelect").prop("disabled", true);
    } else {
      $("#nextStepButtonByData").prop("disabled", false);
      $("#nextStepButtonBySelect").prop("disabled", false);
    }
  }
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>