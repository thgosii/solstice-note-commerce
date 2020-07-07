<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Carrinho | LapTop Computadores</title>

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

          <div class="col-sm-10">
            <h1>Carrinho</h1>
          </div>

        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">

          <table class="table table-striped" id="tableItems">
            <thead>
              <tr>
                <th>
                  Produto
                </th>
                <th>
                </th>
                <th>
                  Preço unitário
                </th>
                <th>
                  Quantidade
                </th>
                <th>
                  Subtotal
                </th>
                <th>
                  Remover
                </th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="item" items="${items}">
                <tr id="row_${item.product.id}">
                  <td>
                    <img src="${item.product.image.url}" style="width: 70px; height: 50px;">
                  </td>
                  <td style="max-width:300px;">${item.product.title}</td>
                  <td>
                    R$ <span id="price_${item.product.id}">${item.product.price}</span>
                  </td>
                  <td>
                    <button type="button" class="btn btn-sm btn-secondary"
                      onclick="decreaseItemQty(${item.product.id});" style="font-size:13px;">
                      <i class="fas fa-minus"></i>
                    </button>
                    <span id="qty_${item.product.id}" style="margin-left:5px;margin-right:5px;">${item.quantity}</span>
                    <button type="button" class="btn btn-sm btn-secondary"
                      onclick="increaseItemQty(${item.product.id});" style="font-size:13px;">
                      <i class="fas fa-plus"></i>
                    </button>
                  </td>
                  <td>
                    R$ <span id="subTotal_${item.product.id}">${item.subTotal}</span>
                  </td>
                  <td>
                    <button class="btn btn-danger btn-sm" onclick="removeCartItem(${item.product.id});">
                      <i class="fas fa-trash">
                      </i>
                    </button>
                  </td>
                </tr>
              </c:forEach>
          </table>
          <hr>
          <div style="display: flex; justify-content: space-between;">
            <h3>Total: R$ <span id="total">R$ 0</span></h3>
            <button type="button" onclick="window.location.href='/note-commerce/pages/shop/checkout-step-1.jsp'"
              id="initCheckout" class="btn btn-info btn-lg btn-flat" style="margin-right: 10px;">
              <i class="fas fa-credit-card fa-lg mr-2"></i>
              Iniciar compra
            </button>
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
  function decreaseItemQty(id) {
    let qty = $("#qty_" + id).text();

    if (qty > 1) {
      updateCartItem(id, parseInt(qty) - 1);
    }
  }

  function increaseItemQty(id) {
    let qty = $("#qty_" + id).text();

    updateCartItem(id, parseInt(qty) + 1);
  }

  function checkCartItemQuantity() {
    let quantity = 0;

    $("#tableItems tr").not(':first').each(function () {
      ++quantity;
    });

    console.log(quantity);

    if (quantity > 0) {
      $("#initCheckout").attr("disabled", false);
    } else {
      $("#initCheckout").attr("disabled", true);
    }
  }

  function updateCartItem(id, qty) {
    $.ajax({
      type: "POST",
      url: '/note-commerce/shop/cart',
      data: { operation: 'update', productId: id, quantity: qty },
      success: function () {
        location.reload(); // New cart item quantity is unknown (may not update to qty because of stock limits), must reload page to know
        // fixMoneyNumbers();
        // $("#qty_" + id).text(qty);
        // $("#subTotal_" + id).text(parseFloat(qty * parseFloat($("#price_" + id).text())).toFixed(2));
        // calculateTotal();
      },
      dataType: "text"
    });
  }

  function removeCartItem(id) {
    $.ajax({
      type: "POST",
      url: '/note-commerce/shop/cart',
      data: { operation: 'remove', productId: id },
      success: function () {
        $("#row_" + id).remove();
        calculateTotal();
        checkCartItemQuantity();
      },
      dataType: "text"
    });
  }

  function calculateTotal() {
    let total = 0;
    $("#tableItems tr").not(':first').each(function () {
      total += parseFloat($(this).find("td:eq(4) span").text());
    });

    $("#total").text(parseFloat(total).toFixed(2));
  }

  function fixMoneyNumbers() {
    $("#tableItems tr").not(':first').each(function () {
      $(this).find("td:eq(2) span").text(parseFloat($(this).find("td:eq(2) span").text()).toFixed(2));
      $(this).find("td:eq(4) span").text(parseFloat($(this).find("td:eq(4) span").text()).toFixed(2));
    });
  }

  $(document).ready(() => {
    fixMoneyNumbers();
    calculateTotal();
    checkCartItemQuantity();
  })
</script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>