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

  <title>Laptops | LapTop Computadores</title>

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
              <h1>Laptops</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="dashboard.html">Admin Home</a></li>
                <li class="breadcrumb-item active">Laptops</li>
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
              <h3 class="card-title">Lista de Laptops</h3>

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
                    <th>Excluir</th>
                    <th>Título</th>
                    <th>Marca</th>
                    <th>Preço</th>
                    <th>Editar</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${products}" var="product">
	                  <tr>
	                    <td class="icon_table_item">
	                      <a href="#delete-modal" data-id="<c:out value="${product.id}"/>" data-toggle="modal"
	                        data-target="#delete-modal"><i class="nav-icon fas fa-trash text-danger text-lg"></i></a>
	                    </td>
	                    <td class="title truncate-text" style="max-width: 400px;"><c:out value="${product.title}"/></td>
	                    <td><c:out value="${product.brand.name}"/></td>
	                    <td>R$ <c:out value="${product.price}"/></td>
		                <td class="icon_table_item">
	                  	  <a href="/note-commerce/admin/products?operation=consult&id=${product.id}">
		                  	<i class="nav-icon fas fa-edit text-info text-lg"></i>
		                  </a>
	                    </td>
	                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <div class="card-footer">
              <div class="row">
                <div class="col col-12">
                  <a href="/note-commerce/pages/admin/products-new.jsp" class="btn btn-block btn-primary" role="button">Novo Laptop</a>
                  <!-- <button type="submit" class="btn btn-block btn-primary">Cadastrar</button> -->
                </div>
              </div>
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
    <!-- Delete modal -->
    <div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="delete-modal-label">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="delete-modal-label">Confirmar Exclusão</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
          </div>
          <div class="modal-body">
            Deseja realmente excluir o laptop "<span id="delete-modal-text" class="text-bold"></span>"?
          </div>
          <div class="modal-footer">
            <form action="/note-commerce/admin/products" method="POST">
              <input type="hidden" name="operation" value="remove">
              <input type="hidden" id="id" name="id">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
              <button id="delete-modal-btn" name="delete-modal-btn" type="submit" class="btn btn-danger">Excluir</button>
            </form>
          </div>
        </div>
      </div>
    </div>
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
  <script src="/note-commerce/static/custom/general/js/tables.js"></script>
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
            targets: [0, 4], // Colunas de: [Editar, Excluir]
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
