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
  <!-- Select2 -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="/note-commerce/static/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
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
		  <c:if test="${not empty requestScope.messages}">
            <div class="alert alert-danger" role="alert" style="font-size: 16px;">
              Erros encontrados na venda:
              <ul>
                <c:forEach var="message" items="${messages}">
                  <li>
                    <c:out value="${message}" />
                  </li>
                </c:forEach>
              </ul>
            </div>
          </c:if>	
          <div class="col-sm-6 mb-3">
            <h1>Passo 1 de 3 - Endereço de entrega</h1>
          </div>
          <div class="progress mb-3">
            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="33.33" aria-valuemin="0"
              aria-valuemax="100" style="width: 33.33%">
            </div>
          </div>
        </div><!-- /.container-fluid -->
        
        <div class="container">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Selecione um endereço cadastrado</h3>
            </div>
            <div class="card-body register-card-body">
              <form action="/note-commerce/shop/saleInProgress" method="POST">
                <input type="hidden" name="operation" value="save">
                <input type="hidden" name="step" value="1">
                <div class="form-group">	
                  <label for="address">Endereço</label>
                  <select class="form-control" id="address" name="address">
                  </select>
                </div>
                <button type="submit" class="btn btn-primary float-right" id="next1">Próximo</button>
              </form>
            </div>
          </div>
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Insira um endereço</h3>
            </div>
            <div class="card-body register-card-body">
              <form action="/note-commerce/shop/saleInProgress" method="POST">
                <input type="hidden" name="step" value="1">
                <input type="hidden" name="operation" value="save">
                <div class="form-group">
                  <label for="cep">CEP<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="cep" name="cep" placeholder="CEP"required>
                </div>
                <div class="form-group">
                  <label for="publicPlace">Logradouro<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="publicPlace" name="publicPlace" placeholder="Logradouro" required>
                </div>
                <div class="form-group">
                  <label for="state">Estado<span class="text-danger text-bold"> *</span></label>
                  <select class="form-control select2bs4" id="state" name="state" data-target='#city' disabled>
                  </select>
                </div>
                <div class="form-group">
                  <label for="city">Cidade<span class="text-danger text-bold"> *</span></label>
                  <select class="form-control select2bs4" id="city" name="city" disabled>
                  </select>
                </div>
                <div class="form-group">
                  <label for="neighbourhood">Bairro<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="neighbourhood" name="neighbourhood" placeholder="Bairro" required>
                </div>
                <div class="form-group">
                  <label for="number">Número<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="number" name="number" placeholder="Número" required>
                </div>
                <div class="form-group">
                  <label for="complement">Complemento</label>
                  <input type="text" class="form-control" id="complement" name="complement" placeholder="Complemento">
                </div>
                <div class="form-group">
                  <label for="addressType">Tipo de endereço<span class="text-danger text-bold"> *</span></label>
                  <select class="form-control" id="type" name="type">
                    <option value="shipping">Entrega</option>
                    <option value="billing">Cobrança</option>
                    <option value="shipping_and_billing">Entrega e cobrança</option>
                  </select>
                </div>
                <div class="form-group">
                	<input type="checkbox" id="saveForNext" name="saveForNext">
                	<label for="saveForNext">Salvar para próximas compras</label>
                </div>
                <button type="submit" class="btn btn-primary float-right">Próximo</button>
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
<!-- jQuery InputMask -->
<script src="/note-commerce/static/plugins/inputmask/jquery.inputmask.bundle.js"></script>
<!-- Select2 -->
<script src="/note-commerce/static/plugins/select2/js/select2.full.min.js"></script>
<script src="/note-commerce/static/plugins/select2/js/i18n/pt-BR.js"></script>
<!-- *********************************************************************************** -->
<!-- /PAGE PLUGINS SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->
<script src="/note-commerce/static/custom/customer/address/js/address.js"></script>
<!-- *********************************************************************************** -->
<!-- /PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->
<script type="text/javascript">
  $(document).ready(function () {
    $.ajax({
      url: '/note-commerce/customer/adresses?operation=consult&isAsync=true',
      type: 'GET',
      dataType: 'json',
      success: function (json) {
        $.each(json, function (i, value) {
          if (!value.isDeleted) {	
          	let addressLabel = value.cep + ", " + value.publicPlace + ", " + value.city + ", " + value.state;
          	$('#address').append($(`<option>`).text(addressLabel).attr('value', value.id));
          }
        });
        
        if (Object.keys(json).length === 0) {
        	$("#next1").prop("disabled", true);
        }
      }
    });
  });	
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>