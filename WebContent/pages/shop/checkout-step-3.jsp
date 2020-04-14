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

  <title>Revisão | LapTop Computadores</title>

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
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>