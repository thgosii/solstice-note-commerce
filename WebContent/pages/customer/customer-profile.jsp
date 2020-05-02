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

  <title>Meus Dados | LapTop Computadores</title>

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
  <c:if test="${not empty requestScope.client}">
    <c:set var="customer" value="${requestScope.client}" />
  </c:if>

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
            <h1>Meus dados</h1>
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
              <form action="/note-commerce/customer" method="POST">
                <input type="hidden" name="operation" value="update">
                <input type="hidden" name="customerId" value="${customer.id}">
                <input type="hidden" name="customerUserId" value="${customer.user.id}">
                <input type="hidden" name="cpf" value="${customer.getDecoratedCpf()}">
                <input type="hidden" name="email" value="${customer.user.email}">
                <div class="form-group">
                  <label for="name">Nome<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" name="name" id="name" placeholder="Nome"
                    value="${customer.name}">
                </div>
                <div class="form-group">
                  <label for="cpf">CPF<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="cpf" placeholder="CPF" value="${customer.cpf}" disabled>
                </div>
                <div class="form-group">
                  <label for="gender">Gênero<span class="text-danger text-bold"> *</span></label>
                  <select class="form-control" name="gender">
                    <option disabled>Gênero...</option>
                    <option value="f" ${customer.gender.toString().toLowerCase()=='female' ? 'selected' : '' }>Feminino
                    </option>
                    <option value="m" ${customer.gender.toString().toLowerCase()=='male' ? 'selected' : '' }>Masculino
                    </option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="dateOfBirth">Data de nascimento<span class="text-danger text-bold"> *</span></label>
                  <input type="date" class="form-control" name="dateOfBirth" id="dateOfBirth"
                    placeholder="Data de nascimento" value="${customer.dateOfBirth}">
                </div>
                <div class="form-group">
                  <label for="phone">Telefone<span class="text-danger text-bold"> *</span></label>
                  <input type="text" class="form-control" id="phone" name="phone" placeholder="Telefone"
                    value="${customer.phone}">
                </div>
                <div class="form-group">
                  <label for="email">E-mail<span class="text-danger text-bold"> *</span></label>
                  <input type="email" class="form-control" placeholder="E-mail" id="email"
                    value="${customer.user.email}" disabled>
                </div>
                <div class="form-group">
                  <label for="password">Senha<span class="text-danger text-bold"> *</span></label>
                  <input type="password" class="form-control" name="password" id="password" maxlength="50" placeholder="Senha">
                </div>
                <div class="form-group">
                  <label for="confirmPassword">Confirmar senha<span class="text-danger text-bold"> *</span></label>
                  <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" maxlength="50"
                    placeholder="Insira a senha novamente">
                </div>
                <div class="mb-3">
                  <span>A senha deve conter: 8 caracteres, uma letra minúscula e uma maiúscula, um caractere especial ou
                    um número</span>
                </div>
                <div class="row">
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
<script type="text/javascript">
  $(document).ready(function () {
    $("#cpf").inputmask("999.999.999-99");
    $("#phone").inputmask({
      mask: ["(99) 9999-9999", "(99) 99999-9999"]
    });
  });
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>