<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Crie sua conta | LapTop Computadores</title>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/note-commerce/static/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition register-page">
<div class="register-box" style="width: 600px">
  <div class="register-logo">
    <a href="#">LapTop <b>Computadores</b></a>
  </div>
  <c:if test="${not empty requestScope.messages}">
	<div class="alert alert-danger" role="alert" style="font-size: 16px;">
		Erros encontrados no preenchimento do formulário:
		<ul>
			<c:forEach var="message" items="${messages}">
				<li><c:out value="${message}"/></li>
			</c:forEach>
		</ul>
	</div>
  </c:if>
  <div class="card">
    <div class="card-body register-card-body">
      <p class="login-box-msg">Crie sua conta</p>

      <form action="/note-commerce/signup" method="POST">
      	<input type="hidden" name="operation" value="save">
        <div class="form-group">
          <label for="name">Nome<span class="text-danger text-bold"> *</span></label>
          <input type="text" class="form-control" name="name" placeholder="Nome" id="name" value="<c:out value="${previousCustomer.name}"/>" required>
        </div>
        <div class="form-group">
          <label for="cpf">CPF<span class="text-danger text-bold"> *</span></label>
          <input type="text" class="form-control" id="cpf" name="cpf" placeholder="CPF" value="<c:out value="${previousCustomer.getDecoratedCpf()}"/>" required>
        </div>
        <div class="form-group">
          <label for="gender">Gênero<span class="text-danger text-bold"> *</span></label>
          <select class="form-control" name="gender">
            <option disabled>Gênero...</option>
            <option value="f" ${previousCustomer.gender.toString().toLowerCase() == 'female' ? 'selected' : ''}>Feminino</option>
            <option value="m" ${previousCustomer.gender.toString().toLowerCase() == 'male' ? 'selected' : ''}>Masculino</option>
          </select>
        </div>
        <div class="form-group">
          <label for="dateOfBirth">Data de nascimento<span class="text-danger text-bold"> *</span></label>
          <input type="date" class="form-control" name="dateOfBirth" id="dateOfBirth" value="<c:out value="${previousCustomer.dateOfBirth}"/>" required>
        </div>
        <div class="form-group">
          <label for="phone">Telefone<span class="text-danger text-bold"> *</span></label>
          <input type="text" class="form-control" id="phone" name="phone" value="<c:out value="${previousCustomer.phone}"/>" required>
        </div>
        <div class="form-group">
          <label for="email">E-mail<span class="text-danger text-bold"> *</span></label>
          <input type="email" class="form-control" name="email" id="email" placeholder="E-mail" required>
        </div>
        <div class="form-group">
          <label for="password">Senha<span class="text-danger text-bold"> *</span></label>
          <input type="password" class="form-control" name="password" id="password" placeholder="Senha" required>
        </div>
        <div class="form-group">
          <label for="confirmPassword">Confirmar senha<span class="text-danger text-bold"> *</span></label>
          <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Insira a senha novamente" required>
        </div>
        <div class="mb-3">
        	<span>A senha deve conter: 8 caracteres, uma letra minúscula e uma maiúscula, um caractere especial ou um número</span>
        </div>
        <div class="row">
          <div class="col-8">
            <a href="/note-commerce/pages/login.jsp">Já possuo uma conta</a>
          </div>
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Cadastrar</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- jQuery -->
<script src="/note-commerce/static/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/note-commerce/static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/note-commerce/static/dist/js/adminlte.min.js"></script>
<script src="/note-commerce/static/plugins/inputmask/jquery.inputmask.bundle.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $("#cpf").inputmask("999.999.999-99");
    $("#phone").inputmask({
      mask: ["(99) 9999-9999", "(99) 99999-9999"]
    });
  });	
</script>

</body>
</html>