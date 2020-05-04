<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="isTrade" value="${param.type == 'exchange'}" />

<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>${isTrade ? 'Trocas' : 'Devoluções'} | LapTop Computadores</title>

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
  <!-- Custom CSS -->
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
              <h1>${isTrade ? 'Trocas' : 'Devoluções'}</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="/note-commerce/pages/admin/dashboard.jsp">Admin Home</a></li>
                <li class="breadcrumb-item active">${isTrade ? 'Trocas' : 'Devoluções'}</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">

          <div class="card card-default">
            <div class="card-header">
              <h3 class="card-title">Lista de ${isTrade ? 'Trocas' : 'Devoluções'}</h3>

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
                    <th>Data do pedido</th>
                    <th>Venda</th>
                    <th>Produto</th>
                    <th>Qtd</th>
                    <th>Nº Rastreamento</th>
                    <th>Status</th>
                    <th>Ações</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${trades}" var="trade">
                    <tr>
                      <td><span class="dt-date-sort">${trade.getFormattedISORequestDate()}"</span>${trade.getFormattedRequestDate()}</td>
                      <td><a href="/note-commerce/admin/sales?operation=consult&table_filter=${trade.sale.id}">${trade.sale.identifyNumber}</a></td>
                      <td class="truncate-text" style="max-width: 200px;"><a href="/note-commerce/admin/products?operation=consult&table_filter=${trade.saleItem.product.title}">${trade.saleItem.product.title}</a></td>
                      <td>${trade.productQuantity}</td>
                      <td>${trade.trackingNumber}</td>
                      <td>
<c:choose>
  <c:when test="${isTrade}">
	<c:choose>
	  <c:when test="${trade.status.name() == 'AWAITING_AUTHORIZATION'}">
	                        <span class="badge bg-warning">Aguardando autorização</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'DENIED'}">
	                        <span class="badge bg-danger">Recusada</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'AUTHORIZED'}">
	                        <span class="badge bg-info">Aguardando retorno de produto</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'PRODUCT_RECEIVED'}">
	                        <span class="badge bg-success">Produto recebido</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'REPLACEMENT_ON_DELIVERY'}">
	                        <span class="badge bg-info">Produto em entrega</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'REPLACEMENT_DELIVERED'}">
	                        <span class="badge bg-success">Produto entregue</span>
	  </c:when>
	</c:choose>
	                      </td>
	                      <td class="text-center">
	<c:choose>
	  <c:when test="${trade.status.name() == 'AWAITING_AUTHORIZATION'}">
	                        <a href="/note-commerce/admin/trades?type=exchange&operation=update&id=${trade.id}&status=AUTHORIZED" class="btn btn-xs btn-info"><i class="fas fa-hands-helping"></i> Autorizar</a>
	                        <a href="/note-commerce/admin/trades?type=exchange&operation=update&id=${trade.id}&status=DENIED" class="btn btn-xs btn-danger"><i class="fas fa-times"></i> Recusar</a>
	  </c:when>
	  <c:when test="${trade.status.name() == 'DENIED'}">
	                        <small>Sem Ações</small>
	  </c:when>
	  <c:when test="${trade.status.name() == 'AUTHORIZED'}">
	                        <a href="/note-commerce/admin/trades?type=exchange&operation=update&id=${trade.id}" class="btn btn-xs btn-success"><i class="fas fa-truck-loading"></i>Confirmar retorno</a>
	  </c:when>
	  <c:when test="${trade.status.name() == 'PRODUCT_RECEIVED'}">
	                        <a href="/note-commerce/admin/trades?type=exchange&operation=update&id=${trade.id}" class="btn btn-xs btn-info"><i class="fas fa-check"></i>Iniciar entrega</a>
	  </c:when>
	  <c:when test="${trade.status.name() == 'REPLACEMENT_ON_DELIVERY'}">
	                        <a href="/note-commerce/admin/trades?type=exchange&operation=update&id=${trade.id}" class="btn btn-xs btn-success"><i class="fas fa-check"></i>Confirmar entrega</a>
	  </c:when>
	  <c:when test="${trade.status.name() == 'REPLACEMENT_DELIVERED'}">
	                        <small>Sem Ações</small>
	  </c:when>
	</c:choose>
  </c:when>
  <c:otherwise>
	<c:choose>
	  <c:when test="${trade.status.name() == 'AWAITING_AUTHORIZATION'}">
	                        <span class="badge bg-warning">Aguardando autorização</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'DENIED'}">
	                        <span class="badge bg-danger">Recusado</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'AUTHORIZED'}">
	                        <span class="badge bg-info">Aguardando retorno de produto</span>
	  </c:when>
	  <c:when test="${trade.status.name() == 'PRODUCT_RECEIVED'}">
	                        <span class="badge bg-success">Produto devolvido</span>
	  </c:when>
	</c:choose>
	                      </td>
	                      <td class="text-center">
	<c:choose>
	  <c:when test="${trade.status.name() == 'AWAITING_AUTHORIZATION'}">
	                        <a href="/note-commerce/admin/trades?type=devolution&operation=update&id=${trade.id}&status=AUTHORIZED" class="btn btn-xs btn-info"><i class="fas fa-hands-helping"></i> Autorizar</a>
	                        <a href="/note-commerce/admin/trades?type=devolution&operation=update&id=${trade.id}&status=DENIED" class="btn btn-xs btn-danger"><i class="fas fa-times"></i> Recusar</a>
	  </c:when>
	  <c:when test="${trade.status.name() == 'DENIED'}">
	                        <small>Sem Ações</small>
	  </c:when>
	  <c:when test="${trade.status.name() == 'AUTHORIZED'}">
	                        <a href="/note-commerce/admin/trades?type=devolution&operation=update&id=${trade.id}" class="btn btn-xs btn-success"><i class="fas fa-hand-holding-usd"></i>Confirmar devolução</a>
	  </c:when>
	  <c:when test="${trade.status.name() == 'PRODUCT_RECEIVED'}">
	                        <small>Sem Ações</small>
	  </c:when>
	</c:choose>
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
  <script src="/note-commerce/static/plugins/datatables/jquery.dataTables.js"></script>
  <script src="/note-commerce/static/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
<!-- *********************************************************************************** -->
<!-- /PAGE PLUGINS SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->
  <!-- <script src="/note-commerce/static/custom/admin/exchanges/js/exchanges.js"></script> -->
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
            targets: [6], // Colunas de: [Ações]
            searchable: false,
            orderable: false
          }
        ],
        // Internacionalização Português-Brasil - https://datatables.net/plug-ins/i18n/Portuguese-Brasil
        language: { "sEmptyTable": "Nenhum registro encontrado", "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros", "sInfoEmpty": "Mostrando 0 até 0 de 0 registros", "sInfoFiltered": "(Filtrados de _MAX_ registros)", "sInfoPostFix": "", "sInfoThousands": ".", "sLengthMenu": "_MENU_ resultados por página", "sLoadingRecords": "Carregando...", "sProcessing": "Processando...", "sZeroRecords": "Nenhum registro encontrado", "sSearch": "Pesquisar", "oPaginate": { "sNext": "Próximo", "sPrevious": "Anterior", "sFirst": "Primeiro", "sLast": "Último" }, "oAria": { "sSortAscending": ": Ordenar colunas de forma ascendente", "sSortDescending": ": Ordenar colunas de forma descendente" }, "select": { "rows": { "0": "Nenhuma linha selecionada", "1": "Selecionado 1 linha", "_": "Selecionado %d linhas" } } }
      });

    })
  </script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>
