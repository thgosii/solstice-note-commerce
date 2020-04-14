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

  <title>LapTop Computadores</title>

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

        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">

          <div class="card-body">
            <div class="row">
              <div class="col-12 col-sm-6">
                <h3 class="d-inline-block d-sm-none">Notebook Acer Aspire 5</h3>
                <div class="col-12">
                  <img src="${product.image.url}" class="product-image" alt="Product Image">
                </div>
              </div>
              <div class="col-12 col-sm-6">
                <h3 class="my-3">${product.title}</h3>
                <hr>
                <h5>Especificações</h5>
                <table class="table">
                  <tr>
                    <td><strong>Marca</strong></td>
                    <td>${product.brand.name}</td>
                  </tr>
                  <tr>
                    <td><strong>Processador</strong></td>
                    <td>${product.processor}</td>
                  </tr>
                  <tr>
                    <td><strong>Placa de vídeo</strong></td>
                    <td>${product.graphicsCard}</td>
                  </tr>
                  <tr>
                    <td><strong>Memória RAM</strong></td>
                    <td>${product.ram}</td>
                  </tr>
                  <tr>
                    <td><strong>Tamanho do monitor</strong></td>
                    <td>${product.monitor}</td>
                  </tr>
                  <tr>
                    <td><strong>Armazenamento</strong></td>
                    <td>
                      <c:if test="${product.hd ne -1}">
                        <c:out value="${product.hd}GB HD" />
                      </c:if>
                      <c:if test="${product.ssd ne -1}">
                        <c:out value=" ${product.ssd}GB SSD" />
                      </c:if>
                    </td>
                  </tr>
                  <tr>
                    <td><strong>Sistema operacional</strong></td>
                    <td>${product.os}</td>
                  </tr>
                </table>
                <hr>
                <h2>
                  <fmt:setLocale value="pt_BR" />
                  <fmt:formatNumber value="${product.price}" type="currency" />
                </h2>
                <hr>
                <div class="row">
                  <button type="button" class="btn btn-primary btn-lg btn-flat"
                    onclick="addProductToCart(${product.id});this.classList.remove('btn-primary');this.classList.add('btn-secondary');"
                    style="margin-right: 10px;">
                    <i class="fas fa-cart-plus fa-lg mr-2"></i>
                    Adicionar ao carrinho
                  </button>
                  <a href="/note-commerce/shop/cart?operation=consult" class="btn btn-info btn-lg btn-flat">
                    <i class="fas fa-shopping-bag fa-lg mr-2"></i>
                    Comprar
                  </a>
                </div>
              </div>
            </div>
            <div class="col mt-5">
              <h4>Descrição</h4>
              <p>${product.description}</p>
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
  function addProductToCart(id) {
    $.ajax({
      type: "POST",
      url: '/note-commerce/shop/cart?operation=save',
      data: { operation: 'save', productId: id },
      success: function () { },
      dataType: "text"
    });
  }
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>
>