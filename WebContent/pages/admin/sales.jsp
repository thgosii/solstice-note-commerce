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
                  <tr>
                    <td>324543535</td>
                    <td><span class="dt-date-sort">2020-01-12</span>12/01/2020</td>
                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal">R$ 4,15</a></td>
                    <td><span class="badge bg-info">Pagamento Aprovado</span></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-xs btn-primary"><i class="fas fa-truck"></i> Iniciar
                        Transporte</button>
                    </td>
                  </tr>
                  <tr>
                    <td>786-97-96-7896-7</td>
                    <td><span class="dt-date-sort">2010-11-02</span>02/11/2010</td>
                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal">R$ 424,42</a></td>
                    <td><span class="badge bg-primary">Em transporte</span></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-xs btn-success"><i class="fas fa-box-open"></i> Confirmar
                        Entrega</button>
                    </td>
                  </tr>
                  <tr>
                    <td>735-34-5-34-57896-7</td>
                    <td><span class="dt-date-sort">2020-05-22</span>22/05/2020</td>
                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal">R$ 123,76</a></td>
                    <td><span class="badge bg-success">Entregue</span></td>
                    <td class="text-center">
                      <small>Sem Ações</small>
                    </td>
                  </tr>
                  <tr>
                    <td>123123-12312-123</td>
                    <td><span class="dt-date-sort">2018-06-01</span>01/06/2020</td>
                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal">R$ 1421,42</a></td>
                    <td><span class="badge bg-info">Pagamento Aprovado</span></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-xs btn-primary"><i class="fas fa-truck"></i> Iniciar
                        Transporte</button>
                    </td>
                  </tr>
                  <tr>
                    <td>11598347539423</td>
                    <td><span class="dt-date-sort">2020-01-12</span>12/01/2020</td>
                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal">R$ 4,15</a></td>
                    <td><span class="badge bg-info">Pagamento Aprovado</span></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-xs btn-primary"><i class="fas fa-truck"></i> Iniciar
                        Transporte</button>
                    </td>
                  </tr>
                  <tr>
                    <td>0101941294</td>
                    <td><span class="dt-date-sort">2010-11-02</span>02/11/2010</td>
                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal">R$ 424,42</a></td>
                    <td><span class="badge bg-primary">Em transporte</span></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-xs btn-success"><i class="fas fa-box-open"></i> Confirmar
                        Entrega</button>
                    </td>
                  </tr>
                  <tr>
                    <td>781111117896-7</td>
                    <td><span class="dt-date-sort">2020-05-22</span>22/05/2020</td>
                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal">R$ 123,76</a></td>
                    <td><span class="badge bg-success">Entregue</span></td>
                    <td class="text-center">
                      <small>Sem Ações</small>
                    </td>
                  </tr>
                  <tr>
                    <td>123123-12312-123</td>
                    <td><span class="dt-date-sort">2018-06-01</span>01/06/2020</td>
                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal">R$ 1421,42</a></td>
                    <td><span class="badge bg-info">Pagamento Aprovado</span></td>
                    <td class="text-center">
                      <button type="button" class="btn btn-xs btn-primary"><i class="fas fa-truck"></i> Iniciar
                        Transporte</button>
                    </td>
                  </tr>
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

    <div class="modal fade" id="sale-detail-modal">
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Compra 3424234324</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div style="max-height: 500px; overflow-y: scroll">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>
                      Produto
                    </th>
                    <th>
                    </th>
                    <th>
                      Preço
                    </th>
                    <th>
                      Status
                    </th>
                    <th>
                      Ações
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <img src="/note-commerce/static/custom/general/img/laptop-sample1.png" style="width: 70px; height: 50px;">
                    </td>
                    <td>Notebook Acer Aspire 5 - 8GB RAM - SSD - I5 </td>
                    <td>R$ 2.444,21</td>
                    <td><span class="badge bg-success">Vendido</span></td>
                    <td><a href="exchange.html" class="btn btn-primary btn-sm">Trocar</a></td>
                  </tr>
                  <tr>
                    <td>
                      <img src="/note-commerce/static/custom/general/img/laptop-sample1.png" style="width: 70px; height: 50px;">
                    </td>
                    <td>Notebook Acer Aspire 5 - 8GB RAM - SSD - I5 </td>
                    <td>R$ 2.444,21</td>
                    <td><span class="badge bg-success">Vendido</span></td>
                    <td><a href="exchange.html" class="btn btn-primary btn-sm">Trocar</a></td>
                  </tr>
                  <tr>
                    <td>
                      <img src="/note-commerce/static/custom/general/img/laptop-sample2.png" style="width: 70px; height: 50px;">
                    </td>
                    <td>Notebook Dell G3 - 16GB RAM - 120GB SSD - I5 </td>
                    <td>R$ 2.444,21</td>
                    <td><span class="badge bg-warning">Aguardando troca</span></td>
                    <td>Sem ações</td>
                  </tr>
                  <tr>
                    <td>
                      <img src="/note-commerce/static/custom/general/img/laptop-sample2.png" style="width: 70px; height: 50px;">
                    </td>
                    <td>Notebook Dell G3 - 16GB RAM - 120GB SSD - I5 </td>
                    <td>R$ 2.444,21</td>
                    <td><span class="badge bg-success">Vendido</span></td>
                    <td><a href="exchange.html" class="btn btn-primary btn-sm">Trocar</a></td>
                  </tr>
                  <tr>
                    <td>
                      <img src="/note-commerce/static/custom/general/img/laptop-sample3.png" style="width: 70px; height: 50px;">
                    </td>
                    <td>Notebook Ideapad l340 - 16GB RAM - 250GB SSD - I7 </td>
                    <td>R$ 2.444,21</td>
                    <td><span class="badge bg-success">Vendido</span></td>
                    <td><a href="exchange.html" class="btn btn-primary btn-sm">Trocar</a></td>
                  </tr>
                  <tr>
                    <td>
                      <img src="/note-commerce/static/custom/general/img/laptop-sample3.png" style="width: 70px; height: 50px;">
                    </td>
                    <td>Notebook Ideapad l340 - 16GB RAM - 250GB SSD - I7 </td>
                    <td>R$ 2.444,21</td>
                    <td><span class="badge bg-danger">Trocado</span></td>
                    <td><a href="#">Ver Troca</a></td>
                  </tr>
                  <tr>
                    <td>
                      <img src="/note-commerce/static/custom/general/img/laptop-sample4.png" style="width: 70px; height: 50px;">
                    </td>
                    <td>Notebook Asus Zenbook 14 - 8GB RAM - 500GB HD - I5 </td>
                    <td>R$ 2.444,21</td>
                    <td><span class="badge bg-success">Vendido</span></td>
                    <td><a href="exchange.html" class="btn btn-primary btn-sm">Trocar</a></td>
                  </tr>
                  <tr>
                    <td>
                      <img src="/note-commerce/static/custom/general/img/laptop-sample4.png" style="width: 70px; height: 50px;">
                    </td>
                    <td>Notebook Asus Zenbook 14 - 8GB RAM - 500GB HD - I5 </td>
                    <td>R$ 2.444,21</td>
                    <td><span class="badge bg-success">Vendido</span></td>
                    <td><a href="exchange.html" class="btn btn-primary btn-sm">Trocar</a></td>
                  </tr>
              </table>
            </div>
            <hr>
            <div class="mb-4">
              <h4>Cliente</h4>
              <table class="table table-striped">
                <tbody>
                  <tr>
                    <td><strong>Nome</strong></td>
                    <td>Teste do teste</td>
                  </tr>
                  <tr>
                    <td><strong>CPF</strong></td>
                    <td>123.123.123-12</td>
                  </tr>
                  <tr>
                    <td><strong>E-mail</strong></td>
                    <td>teste@teste.com</td>
                  </tr>
                  <tr>
                    <td><strong>Data de nascimento</strong></td>
                    <td>09/09/2000</td>
                  </tr>
                  <tr>
                    <td><strong>Telefone</strong></td>
                    <td>(11) 99999-9999</td>
                  </tr>
                  <tr>
                    <td><strong>Gênero</strong></td>
                    <td>Masculino</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="mb-4">
              <h4>Endereço</h4>
              <table class="table table-striped">
                <tbody>
                  <tr>
                    <td><strong>Cidade</strong></td>
                    <td>São Paulo</td>
                  </tr>
                  <tr>
                    <td><strong>Estado</strong></td>
                    <td>São Paulo - SP</td>
                  </tr>
                  <tr>
                    <td><strong>Número</strong></td>
                    <td>130</td>
                  </tr>
                  <tr>
                    <td><strong>Complemento</strong></td>
                    <td>apt 3 - bloco 2</td>
                  </tr>
                </tbody>
              </table>
            </div>
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
                      R$ 14465,26
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <strong>Saldo virtual</strong>
                    </td>
                    <td>
                      R$ 200,00
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
                    <td>R$ 14665,26</td>
                  </tr>
                  <tr>
                    <td style="width: 61%;">
                      <strong>Entrega</strong>
                    </td>
                    <td>R$ 20,00</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div>
              <h4>Total: R$ 244,23</h4>
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
    <!-- /.modal -->
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
        // Internacionalização Português-Brasil - https://datatables.net/plug-ins/i18n/Portuguese-Brasil
        language: { "sEmptyTable": "Nenhum registro encontrado", "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros", "sInfoEmpty": "Mostrando 0 até 0 de 0 registros", "sInfoFiltered": "(Filtrados de _MAX_ registros)", "sInfoPostFix": "", "sInfoThousands": ".", "sLengthMenu": "_MENU_ resultados por página", "sLoadingRecords": "Carregando...", "sProcessing": "Processando...", "sZeroRecords": "Nenhum registro encontrado", "sSearch": "Pesquisar", "oPaginate": { "sNext": "Próximo", "sPrevious": "Anterior", "sFirst": "Primeiro", "sLast": "Último" }, "oAria": { "sSortAscending": ": Ordenar colunas de forma ascendente", "sSortDescending": ": Ordenar colunas de forma descendente" }, "select": { "rows": { "0": "Nenhuma linha selecionada", "1": "Selecionado 1 linha", "_": "Selecionado %d linhas" } } }
      });

    })
  </script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>
