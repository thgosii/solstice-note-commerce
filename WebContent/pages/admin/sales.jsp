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

  <title>Vendas | LapTop Computadores</title>

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
  <!-- DataTables -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
  <!-- *********************************************************************************** -->
  <!-- /PAGE PLUGIN STYLES -->
  <!-- *********************************************************************************** -->



  <!-- *********************************************************************************** -->
  <!-- PAGE CUSTOM STYLES -->
  <!-- *********************************************************************************** -->
  <link rel="stylesheet" href="/note-commerce/static/custom/general/css/tables.css">
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
              <h1>Vendas</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="dashboard.html">Admin Home</a></li>
                <li class="breadcrumb-item active">Vendas</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">

          <div class="card card-default">
            <div class="card-header">
              <h3 class="card-title">Lista de Vendas</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                    class="fas fa-minus"></i></button>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body table-responsive">
              <table id="products-table" class="table table-borderless table-striped">
                <thead>
                  <tr>
                    <th>Número do Pedido</th>
                    <th>Data da compra</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Ações</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="sale" items="${requestScope.sales}">
	                  <tr>
	                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal_${sale.id}">${sale.identifyNumber}</a></td>
	                    <td><span class="dt-date-sort">${sale.getFormattedISODateTime()}"</span>${sale.getFormattedDateTime()}</td>
	                    <td><fmt:formatNumber type="currency" currencySymbol="R$ " value="${sale.getTotal()}" /></td>
	                    <td><span class="badge ${sale.getStatusColorName()}">${sale.getFormattedStatus()}</span></td>
	                    <td class="text-center">
	                      <c:choose>
							<c:when test="${sale.status.name() == 'PAYMENT_APPROVED'}">
		                    	<a href="/note-commerce/admin/sales?operation=update&id=${sale.id}&status=${sale.status.name()}" class="btn btn-xs btn-info">Iniciar entrega</a>
		                    </c:when>
		                    <c:when test="${sale.status.name() == 'ON_DELIVERY'}">
		                    	<a href="/note-commerce/admin/sales?operation=update&id=${sale.id}&status=${sale.status.name()}" class="btn btn-xs btn-secondary">Finalizar entrega</a>
		                    </c:when>
							<c:otherwise>
								<span>Sem ações</span>
							</c:otherwise>
						  </c:choose>
	                    </td>
	                  </tr>
                  </c:forEach>
                </tbody>
              </table>
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
  <c:forEach var="sale" items="${requestScope.sales}">
	  <div class="modal fade" id="sale-detail-modal_${sale.id}">
	    <div class="modal-dialog modal-xl">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title">Compra #${sale.identifyNumber}</h4>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body">
	          <div style="max-height: 500px; overflow-y: scroll">
	            <table class="table table-striped">
	              <thead>
	                <tr>
	                  <th>Produto</th>
	                  <th>
	                  </th>
	                  <th>Preço</th>
	                  <th>Quantidade</th>
	                  <th>Subtotal</th>
	                </tr>
	              </thead>
	              <tbody>
	                <c:forEach var="item" items="${sale.items}">
	                  <tr>
	                    <td>
	                      <img src="${item.product.image.url}" style="width: 70px; height: 50px;">
	                    </td>
	                    <td style="max-width: 350px">${item.product.title}</td>
	                    <td><fmt:formatNumber type="currency" currencySymbol="R$ " value="${item.product.price}" /></td>
	                    <td>${item.quantity}</td>
	                    <td><fmt:formatNumber type="currency" currencySymbol="R$ " value="${item.subTotal}" /></td>
	                  </tr>
	                </c:forEach>
	            </table>
	          </div>
	          <hr>
	          <div class="mb-4">
	            <h4>Endereço</h4>
	            <table class="table table-striped">
	              <tbody>
	              	<tr>
	                  <td><strong>Endereço</strong></td>
	                  <td>${sale.address.publicPlace}</td>
	                </tr>
	                <tr>
	                  <td><strong>Cidade</strong></td>
	                  <td>${sale.address.city}</td>
	                </tr>
	                <tr>
	                  <td><strong>Estado</strong></td>
	                  <td>${sale.address.state}</td>
	                </tr>
	                <tr>
	                  <td><strong>Número</strong></td>
	                  <td>${sale.address.number}</td>
	                </tr>
	                <tr>
	                  <td><strong>Complemento</strong></td>
	                  <td>${sale.address.complement}</td>
	                </tr>
	              </tbody>
	            </table>
	          </div>
	          <div class="mb-4">
	          	<h4>Cartão de crédito</h4>
	          	<table class='table table-striped'>
	          	  <thead>
	          	    <tr>
	            	  <th><strong>Número</strong></th>
	            	  <th><strong>Nome impresso</strong></th>
	            	</tr>
	              </thead>
	              <tbody>
	              <tr>
	                <td>${sale.creditCard.number}</td>
	            	<td>${sale.creditCard.printedName}</td>
	              </tr>
	              </tbody>
	            </table>
	          </div>
	          <div class="mb-4">
	            <h4>Pagamento</h4>
	            <table class="table table-striped">
	              <thead>
	              	<tr>
		                <th><strong>Forma de pagamento</strong></th>
		                <th><strong>Valor</strong></th>
	                </tr>
	              </thead>
	              <tbody>
	                <tr>
	                  <td>
	                    <strong>Cartão</strong>
	                  </td>
	                  <td><fmt:formatNumber type="currency" currencySymbol="R$ " value="${sale.getCreditCardUsage()}" /></td>
	                </tr>
	                <tr>
	                  <td>
	                    <strong>Saldo digital</strong>
	                  </td>
	                  <td><fmt:formatNumber type="currency" currencySymbol="R$ " value="${sale.getBalanceUsage()}" /></td>
	                </tr>
	              </tbody>
	            </table>
	            <hr>
	          </div>
	          <div>
	            <h4>Total: <fmt:formatNumber type="currency" currencySymbol="R$ " value="${sale.getTotal()}" /></h4>
	          </div>
	        </div>
	        <div class="modal-footer justify-content-between">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Voltar</button>
	        </div>
	      </div>
	      <!-- /.modal-content -->
	    </div>
	    <!-- /.modal-dialog -->
	  </div>
  </c:forEach>  
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
  <!-- DataTables -->
  <script src="/note-commerce/static/plugins/datatables/jquery.dataTables.js"></script>
  <script src="/note-commerce/static/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
<!-- *********************************************************************************** -->
<!-- /PAGE PLUGINS SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->
  <!-- <script src="/note-commerce/static/custom/admin/sales/js/sales.js"></script> -->
<!-- *********************************************************************************** -->
<!-- /PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->
  <script>
    $(document).ready(() => {

      $('#products-table').DataTable({
        columnDefs: [
          {
            targets: [4], // Colunas de: [Ações]
            searchable: false,
            orderable: false
          }
        ],
        order: [[ 1, "desc" ]],
        // Internacionalização Português-Brasil - https://datatables.net/plug-ins/i18n/Portuguese-Brasil
        language: { "sEmptyTable": "Nenhum registro encontrado", "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros", "sInfoEmpty": "Mostrando 0 até 0 de 0 registros", "sInfoFiltered": "(Filtrados de _MAX_ registros)", "sInfoPostFix": "", "sInfoThousands": ".", "sLengthMenu": "_MENU_ resultados por página", "sLoadingRecords": "Carregando...", "sProcessing": "Processando...", "sZeroRecords": "Nenhum registro encontrado", "sSearch": "Pesquisar", "oPaginate": { "sNext": "Próximo", "sPrevious": "Anterior", "sFirst": "Primeiro", "sLast": "Último" }, "oAria": { "sSortAscending": ": Ordenar colunas de forma ascendente", "sSortDescending": ": Ordenar colunas de forma descendente" }, "select": { "rows": { "0": "Nenhuma linha selecionada", "1": "Selecionado 1 linha", "_": "Selecionado %d linhas" } } }
      });

    })
  </script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>
