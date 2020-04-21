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

  <title>Meus Pedidos | LapTop Computadores</title>

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
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container">
          <div class="col-sm-6 mb-3">
            <h1>Meus pedidos</h1>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">
          <div class="card card-default">
            <div class="card-body table-responsive">
              <table id="products-table" class="table table-borderless table-striped">
                <thead>
                  <tr>
                    <th>Número do Pedido</th>
                    <th>Data da compra</th>
                    <th>Total</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal">324543535</a></td>
                    <td><span class="dt-date-sort">2020-01-12</span>12/01/2020</td>
                    <td>R$ 4,15</td>
                    <td><span class="badge bg-danger">Reprovado</span></td>
                  </tr>
                  <tr>
                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal">786-97-96-7896-7</a></td>
                    <td><span class="dt-date-sort">2010-11-02</span>02/11/2010</td>
                    <td>R$ 424,42</td>
                    <td><span class="badge bg-primary">Em transporte</span></td>
                  </tr>
                  <tr>
                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal">735-34-5-34-57896-7</a></td>
                    <td><span class="dt-date-sort">2020-05-22</span>22/05/2020</td>
                    <td>R$ 123,76</td>
                    <td><span class="badge bg-success">Entregue</span></td>
                  </tr>
                  <tr>
                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal">123123-12312-123</a></td>
                    <td><span class="dt-date-sort">2018-06-01</span>01/06/2020</td>
                    <td>R$ 1421,42</td>
                    <td><span class="badge bg-warning">Aguardando aceitação</span></td>
                  </tr>
                  <tr>
                    <td><a href="#" data-toggle="modal" data-target="#sale-detail-modal">11598347539423</a></td>
                    <td><span class="dt-date-sort">2020-01-12</span>12/01/2020</td>
                    <td>R$ 4,15</td>
                    <td><span class="badge bg-info">Pagamento Aprovado</span></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
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
                    <img src="../../static/custom/general/img/laptop-sample1.png" style="width: 70px; height: 50px;">
                  </td>
                  <td>Notebook Acer Aspire 5 - 8GB RAM - SSD - I5 </td>
                  <td>R$ 2.444,21</td>
                  <td><span class="badge bg-success">Vendido</span></td>
                  <td><a href="exchange.html" class="btn btn-primary btn-sm">Trocar</a></td>
                </tr>
                <tr>
                  <td>
                    <img src="../../static/custom/general/img/laptop-sample1.png" style="width: 70px; height: 50px;">
                  </td>
                  <td>Notebook Acer Aspire 5 - 8GB RAM - SSD - I5 </td>
                  <td>R$ 2.444,21</td>
                  <td><span class="badge bg-success">Vendido</span></td>
                  <td><a href="exchange.html" class="btn btn-primary btn-sm">Trocar</a></td>
                </tr>
                <tr>
                  <td>
                    <img src="../../static/custom/general/img/laptop-sample2.png" style="width: 70px; height: 50px;">
                  </td>
                  <td>Notebook Dell G3 - 16GB RAM - 120GB SSD - I5 </td>
                  <td>R$ 2.444,21</td>
                  <td><span class="badge bg-warning">Aguardando troca</span></td>
                  <td>Sem ações</td>
                </tr>
                <tr>
                  <td>
                    <img src="../../static/custom/general/img/laptop-sample2.png" style="width: 70px; height: 50px;">
                  </td>
                  <td>Notebook Dell G3 - 16GB RAM - 120GB SSD - I5 </td>
                  <td>R$ 2.444,21</td>
                  <td><span class="badge bg-success">Vendido</span></td>
                  <td><a href="exchange.html" class="btn btn-primary btn-sm">Trocar</a></td>
                </tr>
                <tr>
                  <td>
                    <img src="../../static/custom/general/img/laptop-sample3.png" style="width: 70px; height: 50px;">
                  </td>
                  <td>Notebook Ideapad l340 - 16GB RAM - 250GB SSD - I7 </td>
                  <td>R$ 2.444,21</td>
                  <td><span class="badge bg-success">Vendido</span></td>
                  <td><a href="exchange.html" class="btn btn-primary btn-sm">Trocar</a></td>
                </tr>
                <tr>
                  <td>
                    <img src="../../static/custom/general/img/laptop-sample3.png" style="width: 70px; height: 50px;">
                  </td>
                  <td>Notebook Ideapad l340 - 16GB RAM - 250GB SSD - I7 </td>
                  <td>R$ 2.444,21</td>
                  <td><span class="badge bg-danger">Trocado</span></td>
                  <td><a href="#">Ver Troca</a></td>
                </tr>
                <tr>
                  <td>
                    <img src="../../static/custom/general/img/laptop-sample4.png" style="width: 70px; height: 50px;">
                  </td>
                  <td>Notebook Asus Zenbook 14 - 8GB RAM - 500GB HD - I5 </td>
                  <td>R$ 2.444,21</td>
                  <td><span class="badge bg-success">Vendido</span></td>
                  <td><a href="exchange.html" class="btn btn-primary btn-sm">Trocar</a></td>
                </tr>
                <tr>
                  <td>
                    <img src="../../static/custom/general/img/laptop-sample4.png" style="width: 70px; height: 50px;">
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
<script type="text/javascript">
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>