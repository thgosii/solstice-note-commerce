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
          <form action="/note-commerce/shop/saleInProgress" method="POST">
            <input type="hidden" name="operation" value="save">
            <input type="hidden" name="step" value="2">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Saldo virtual - <small>Você tem <strong id="cus_balance"></strong> em saldo digital</small>
                </h3>
              </div>
              <div class="card-body register-card-body">
                <h4 class="mb-4">Total: R$ <span id="total"></span></h4>
                <div class="form-group">
                  <label for="balance">Valor saldo digital</label>
                  <input type="text" class="form-control" id="balance" name="balance" placeholder="Valor saldo digital">
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Selecione um Cartão de crédito</h3>
              </div>
              <div class="card-body register-card-body">
                <div class="form-group">
                  <label for="creditCard">Cartão de crédito</label>
                  <select class="form-control" id="creditCard" name="creditCard">
                  </select>
                </div>
                <button type="submit" class="btn btn-primary float-right" id="nextStepButton">Próximo</button>
              </div>
            </div>
	      </form>
	      <div class="card">
            <div class="card-header">
              <h3 class="card-title">Insira um Cartão de crédito</h3>
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
<!-- *********************************************************************************** -->
<!-- PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->
<script src="/note-commerce/static/custom/customer/creditcard/js/brand-regex.js"></script>
<!-- *********************************************************************************** -->
<!-- /PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->
<script>
  $(document).ready(() => {
	  $.ajax({
	      url: '/note-commerce/customer/creditCards?operation=consult&isAsync=true',
	      type: 'GET',
	      dataType: 'json',
	      success: function (json) {
	        $.each(json, function (i, value) {
	          if (!value.isDeleted) {
	          	let creditCardLabel = value.number + ", " + value.printedName;
	          	$('#creditCard').append($(`<option>`).text(creditCardLabel).attr('value', value.id));
	          }
	        });
	      }
	  });
	  
	  $.ajax({
	      url: '/note-commerce/shop/saleInProgress?operation=consult',
	      type: 'GET',
	      dataType: 'json',
	      success: function (data) {
	    	const totalText = Number(data.total)
		        .toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })
	        $("#total").text(totalText);
	      }
	  });
	  
	  $.ajax('/note-commerce/customer/balance?operation=consult')
	    .then(data => {
        currentBalance = data.balance;
	      const currentBalanceText = Number(data.balance)
	        .toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })
        $('#cus_balance').text(currentBalanceText)

        // Cannot use digital balance if its empty
        if (currentBalance != 0) {
          $('#balance').inputmask('currency', {
            groupSeparator: ',',
            digits: 2,
            radixPoint: '.',
            prefix: 'R$ ',
            rightAlign: false,
            max: currentBalance,
            allowMinus: false,
            autoUnmask: true,
            removeMaskOnSubmit: true
          });
        }
	    })
   });
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>