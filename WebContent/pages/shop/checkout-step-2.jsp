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
  <!-- Ion Slider -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/ion-rangeslider/css/ion.rangeSlider.min.css">
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
          <form action="/note-commerce/shop/saleInProgress" method="POST">
            <input type="hidden" name="operation" value="save">
            <input type="hidden" name="step" value="2">
            
            <div class="card">
              <div class="card-header">
                <h4>Total: <span id="total"></span></h4>
              </div>
            </div>
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Utilize o <b>saldo virtual</b> com ou sem os cartões cadastrados - <small>Você tem <strong id="cus_balance"></strong> em saldo digital</small>
                </h3>
              </div>
              <div class="card-body register-card-body">
                <div class="form-group">
                  <label for="balance">Valor saldo digital</label>
                  <input type="text" class="form-control" id="balance" name="balance" placeholder="Valor saldo digital" min="0">
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Escolha quanto usar em cada um de seus <b>cartões cadastrados</b></h3>
              </div>
              <div class="card-body register-card-body">
                <div>
                  <div class="row">
                    <div class="col col-4">
                      <p class="text-bold">Número do cartão</p>
                    </div>
                    <div class="col col-3">
                      <p class="text-bold">Nome impresso no cartão</p>
                    </div>
                    <div class="col col-5">
                      <p class="text-bold">Valor a ser utilizado</p>
                    </div>
                  </div>
                </div>
              	<div id="cardList">
              	</div>
                <button type="submit" class="btn btn-primary float-right" id="nextStepButton">Próximo</button>
              </div>
            </div>
	      </form>
	      <div class="card">
            <div class="card-header">
              <h3 class="card-title">Ou cadastre um <b>novo cartão de crédito</b> para utilizar nessa compra</h3>
            </div>
            <div class="card-body register-card-body">
              <form action="/note-commerce/shop/saleInProgress" method="POST">
                <input type="hidden" name="operation" value="save">
                <input type="hidden" name="step" value="2">
                <div class="row">
                  <div class="col col-4">
                    <div class="form-group">
                      <label for="cc-brand">Bandeira<span class="text-danger text-bold"> *</span></label>
                      <select class="form-control" id="cc-brand" name="cc-brand" required>
                        <option value="VISA">Visa</option>
                        <option value="MASTER_CARD">Master Card</option>
                      </select>
                    </div>
                  </div>
                  <div class="col col-8">
                    <div class="form-group">
                      <label for="number">Número do cartão<span class="text-danger text-bold"> *</span></label>
                      <input type="text" class="form-control" id="cc-number" name="number" placeholder="Número do cartão" pattern="\d+" required>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col col-8">
                    <div class="form-group">
                      <label for="printedName">Nome impresso no cartão<span class="text-danger text-bold">
                          *</span></label>
                      <input type="text" class="form-control" id="cc-printedName" name="printedName" placeholder="Nome impresso no cartão" maxlength="100" required>
                    </div>
                  </div>
                  <div class="col col-4">
                    <div class="form-group">
                      <label for="securityCode">Código de segurança (CVV)<span class="text-danger text-bold">
                          *</span></label>
                      <input type="password" class="form-control" id="cc-securityCode" name="securityCode" placeholder="Código de segurança"
                        pattern="\d{3}" maxlength="3" required>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                	<input type="checkbox" id="saveForNext" name="saveForNext">
                	<label for="saveForNext">Salvar para próximas compras</label>
                </div>
                <button type="submit" class="btn btn-primary float-right" id="nextStepButton">Próximo</button>
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
  <template id="template-cc">
    <div class="row">
      <div class="col col-4">
        <p class="cc-number-text"></p>
      </div>
      <div class="col col-3">
        <p class="cc-owner"></p>
      </div>
      <div class="col col-5">
        <input type="hidden" name="ids">
        <input class="cc-range" type="text" name="values">
      </div>
    </div>
  </template>
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
<!-- InputMask -->
<script src="/note-commerce/static/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<!-- Ion Slider -->
<script src="/note-commerce/static/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
<!-- *********************************************************************************** -->
<!-- PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->
<script src="/note-commerce/static/custom/shop/sale/js/step2.js"></script>
<script src="/note-commerce/static/custom/customer/creditcard/js/brand-regex.js"></script>
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