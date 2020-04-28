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

          <table class="table table-striped" id="tableItems">
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
            <tbody id="saleItemsTableBody">
            	
            </tbody>
          </table>
          <hr>
          <div class="mb-4">
            <h4>Endereço</h4>
            <table class="table table-striped">
              <tbody>
                <tr>
                  <td><strong>Cidade</strong></td>
                  <td id="city"></td>
                </tr>
                <tr>
                  <td><strong>Estado</strong></td>
                  <td id="state"></td>
                </tr>
                <tr>
                  <td><strong>Número</strong></td>
                  <td id="number"></td>
                </tr>
                <tr>
                  <td><strong>Complemento</strong></td>
                  <td id="complement"></td>
                </tr>
              </tbody>
            </table>
          </div>
          <hr>
          <div class="mb-4">
            <h4>Pagamento</h4>
            <table class="table table-striped">
              <thead>
             	<tr>
                  <td><strong>Forma de pagamento</strong></td>
                  <td><strong>Valor</strong></td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>
                    <strong>Cartão</strong>
                  </td>
                  <td id="creditCardUsage"></td>
                </tr>
                <tr>
                  <td>
                    <strong>Saldo virtual</strong>
                  </td>
                  <td id="balanceUsage"></td>
                </tr>
                <tr>
                  <td>
                    <strong>Total</strong>
                  </td>
                  <td id="total"></td>
                </tr>
              </tbody>
            </table>
            <hr>
          </div>
          <form action="/note-commerce/shop/sales">
            <input type="hidden" name="operation" value="save">
            <div style="padding-bottom: 60px;">
              <button type="submit" class="btn btn-primary float-right">
              <i class="fas fa-check-circle fa-lg mr-2"></i>Finalizar</button>
            </div>
		  </form>
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
	$(document).ready(() => {
	  $.ajax({
	      url: '/note-commerce/shop/saleInProgress?operation=consult',
	      type: 'GET',
	      dataType: 'json',
	      success: function (json) {
	    	// Address
	        $("#city").text(json.address.city);
	        $("#state").text(json.address.state);
	        $("#number").text(json.address.number);
	        $("#complement").text(json.address.complement);
	        
	        // Payment
	        const creditCardUsageText = Number(json.creditCardUsage)
	        .toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })
	        $("#creditCardUsage").text(creditCardUsageText);
	        const balanceUsageText = Number(json.balanceUsage)
	        .toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })
	        $("#balanceUsage").text(balanceUsageText);
	        const totalText = Number(json.total)
	        .toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })
	        $("#total").text(totalText);
	        
	        let trHTML = '';

	        $.each(json.items, function (i, item) {
	            trHTML += '<tr>';
	            trHTML += '<td><img src=' + item.product.image.url + ' style="width: 70px; height: 50px;"></td>';
	            trHTML += '<td style="max-width:300px;">' + item.product.title + '</td>';
	            trHTML += '<td>R$ ' + item.product.price + '</td>';
	            trHTML += '<td>' + item.quantity + '</td>';
	            trHTML += '<td>R$ ' + item.subTotal + '</td>';
	            trHTML += '</tr>';
	        });

	        $('#saleItemsTableBody').append(trHTML);
	      }
	  });
	})
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>