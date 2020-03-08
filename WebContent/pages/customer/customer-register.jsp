<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>LapTop Computadores</title>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="./static/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="./static/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./static/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="#">LapTop <b>Computadores</b></a>
  </div>

  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body register-card-body">
      <p class="login-box-msg">Crie sua conta</p>

      <form action="signup" method="POST">
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="name" placeholder="Nome">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="cpf" name="cpf" placeholder="CPF">
          <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-address-card"></span>
              </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <select class="form-control" name="gender">
            <option disabled>Gênero...</option>
            <option value="f">Feminino</option>
            <option value="m">Masculino</option>
          </select>
        </div>
        <div class="input-group mb-3">
          <input type="date" class="form-control" name="birthDate" placeholder="Data de nascimento">
          <div class="input-group-append">
              <div class="input-group-text">
              <span class="fas fa-calendar-alt"></span>
              </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="phone" name="phone" placeholder="Telefone">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-phone"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="email" class="form-control" name="email" placeholder="E-mail">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="password" placeholder="Senha">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="confirmPassword" placeholder="Insira a senha novamente">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <a href="../login.html">Já possuo uma conta</a>
          </div>
          <div class="col-4">
            <a href="../shop/checkout-step-1.html" class="btn btn-primary btn-block">Cadastrar</a>
          </div>
        </div>
      </form>
    </div>
    <!-- /.form-box -->
  </div>
  <!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="../static/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="./static/dist/js/adminlte.min.js"></script>
<script src="./static/plugins/inputmask/jquery.inputmask.bundle.js"></script>
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