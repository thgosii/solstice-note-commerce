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

  <title>Meus Endereços | LapTop Computadores</title>

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
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Meus endereços</h1>
            </div>
            <div class="col-sm-6">
              <a href="/note-commerce/pages/customer/customer-address-new.jsp" class="float-sm-right"><strong>+</strong>
                Novo endereço</a>
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
                <th scope="col">CEP</th>
                <th scope="col">Logradouro</th>
                <th scope="col">Complemento</th>
                <th scope="col">Número</th>
                <th scope="col">Bairro</th>
                <th scope="col">Cidade</th>
                <th scope="col">Estado</th>
                <th scope="col">Tipo</th>
                <th scope="col">Alterar</th>
                <th scope="col">Remover</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="address" items="${requestScope.adresses}" varStatus="loop">
                <c:if test="${address.deleted == false}">
	                <div class="modal fade" id="removeModal_${address.id}" tabindex="-1" role="dialog"
	                  aria-labelledby="exampleModalLabel" aria-hidden="true">
	                  <div class="modal-dialog" role="document">
	                    <div class="modal-content">
	                      <div class="modal-header">
	                        <h5 class="modal-title" id="exampleModalLabel">Remover Endereço</h5>
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	                          <span aria-hidden="true">&times;</span>
	                        </button>
	                      </div>
	                      <div class="modal-body">
	                        Deseja realmente remover esse endereço?
	                      </div>
	                      <div class="modal-footer">
	                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
	                        <button type="submit" class="btn btn-danger" form="removeForm_${address.id}">Remover</button>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	                <tr>
	                  <td>${address.cep}</td>
	                  <td>${address.publicPlace}</td>
	                  <td>${address.complement}</td>
	                  <td>${address.number}</td>
	                  <td>${address.neighbourhood}</td>
	                  <td>${address.city}</td>
	                  <td>${address.state}</td>
	                  <c:choose>
	                    <c:when test="${address.type eq 'SHIPPING'}">
	                      <td>Entrega</td>
	                    </c:when>
	                    <c:when test="${address.type eq 'BILLING'}">
	                      <td>Cobrança</td>
	                    </c:when>
	                    <c:otherwise>
	                      <td>Entrega e cobrança</td>
	                    </c:otherwise>
	                  </c:choose>
	                  <td>
	                    <a href="/note-commerce/customer/adresses?operation=prepareUpdate&id=${address.id}"
	                      class="btn btn-primary">
	                      Alterar
	                    </a>
	                  </td>
	                  <td>
	                    <form id="removeForm_${address.id}" action="adresses" method="POST">
	                      <input type="hidden" name="operation" value="remove">
	                      <input type="hidden" name="id" value="${address.id}">
	                      <button type="button" class="btn btn-danger" data-toggle="modal"
	                        data-target="#removeModal_${address.id}">Remover</button>
	                    </form>
	                  </td>
	                </tr>
                </c:if>
              </c:forEach>
            </tbody>
          </table>

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