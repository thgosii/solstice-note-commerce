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
    <c:if test="${empty address}">Novo Endereço</c:if>
    <c:if test="${not empty address}">Editar Endereço</c:if> | LapTop Computadores
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
          <div class="col-sm-6">
            <div class="col-sm-6">
              <h1>
                <c:if test="${empty address}">Novo endereço</c:if>
                <c:if test="${not empty address}">Editar endereço</c:if>
              </h1>
            </div>
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
              <form action="/note-commerce/customer/adresses" method="POST">
                <c:if test="${empty address}">
                  <input type="hidden" name="operation" value="save">
                </c:if>
                <c:if test="${not empty address}">
                  <input type="hidden" name="operation" value="update">
                </c:if>
                <c:if test="${not empty address}">
                  <input type="hidden" name="id" value="${address.id}">
                </c:if>
                <input type="hidden" name="operation" value="save">
                <div class="form-group">
                  <label for="cep">CEP<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="cep" name="cep" placeholder="CEP" required>
                </div>
                <div class="form-group">
                  <label for="publicPlace">Logradouro<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="publicPlace" name="publicPlace" placeholder="Logradouro"
                    value="${address.publicPlace}" required>
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
                  <input type="text" class="form-control" id="neighbourhood" name="neighbourhood" placeholder="Bairro"
                    value="${address.neighbourhood}" required>
                </div>
                <div class="form-group">
                  <label for="number">Número<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="number" name="number" placeholder="Número"
                    value="${address.number}" required>
                </div>
                <div class="form-group">
                  <label for="complement">Complemento</label>
                  <input type="text" class="form-control" id="complement" name="complement"
                    value="${address.complement}" placeholder="Complemento">
                </div>
                <div class="form-group">
                  <label for="addressType">Tipo de endereço<span class="text-danger text-bold"> *</span></label>
                  <select class="form-control" id="type" name="type">
                    <option value="shipping" ${address.type.toString().toLowerCase()=='shipping' ? 'selected' : '' }>
                      Entrega</option>
                    <option value="billing" ${address.type.toString().toLowerCase()=='billing' ? 'selected' : '' }>
                      Cobrança</option>
                    <option value="shipping_and_billing" ${address.type.toString().toLowerCase()=='shipping_and_billing'
                      ? 'selected' : '' }>Entrega e cobrança</option>
                  </select>
                </div>
                <div class="row">
                  <div class="col col-6">
                    <a href="/note-commerce/customer/adresses?operation=consult" type="submit"
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
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>