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

  <title>
    <c:if test="${empty creditCard}">Novo Cartão</c:if>
    <c:if test="${not empty creditCard}">Editar Cartão</c:if> | LapTop Computadores
  </title>

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
          <div class="col-sm-6">
            <h1>
              <c:if test="${empty creditCard}">Novo cartão de crédito</c:if>
              <c:if test="${not empty creditCard}">Editar cartão de crédito</c:if>
            </h1>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">

          <c:if test="${not empty requestScope.messages}">
            <div class="alert alert-danger" role="alert" style="font-size: 16px;">
              Erros encontrados no preenchimento do formulário:
              <ul>
                <c:forEach var="message" items="${messages}">
                  <li>
                    <c:out value="${message}" />
                  </li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
          <div class="card">
            <div class="card-body register-card-body">
              <form action="/note-commerce/customer/creditCards" method="POST">
                <c:if test="${empty creditCard}">
                  <input type="hidden" name="operation" value="save">
                </c:if>
                <c:if test="${not empty creditCard}">
                  <input type="hidden" name="operation" value="update">
                </c:if>
                <c:if test="${not empty creditCard}">
                  <input type="hidden" name="id" value="${creditCard.id}">
                </c:if>
                <div class="form-group">
                  <label for="number">Número do cartão<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" name="number" placeholder="Número do cartão"
                    pattern="\d{4} \d{4} \d{4} \d{4}" value="${creditCard.number}" required>
                </div>
                <div class="form-group">
                  <label for="printedName">Nome<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" name="printedName" placeholder="Nome impresso no cartão"
                    value="${creditCard.printedName}" maxlength="100" required>
                </div>
                <div class="form-group">
                  <label for="securityCode">Código de segurança<span class="text-danger text-bold"> *</span></label>
                  <input type="password" class="form-control" name="securityCode" placeholder="Código de segurança"
                    pattern="\d{3}" maxlength="3" value="${creditCard.securityCode}" required>
                </div>
                <div class="row">
                  <div class="col col-6">
                    <a href="/note-commerce/customer/creditCards?operation=consult" type="submit"
                      class="btn btn-danger btn-block">Voltar</a>
                  </div>
                  <div class="col col-6">
                    <button type="submit" class="btn btn-primary btn-block">Salvar</button>
                  </div>
                </div>
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

    $("input[name=number]").inputmask("9999 9999 9999 9999");

  });
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>