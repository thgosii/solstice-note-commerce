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

  <c:choose>
	<c:when test="${(param.operation == 'update') or (param.operation == 'consult')}">
      <title>Editar Laptop | LapTop Computadores</title>
	</c:when>
	<c:otherwise>
      <title>Novo Laptop | LapTop Computadores</title>
	</c:otherwise>
  </c:choose>

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
  <!-- iCheck Bootstrap -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="/note-commerce/static/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="/note-commerce/static/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- *********************************************************************************** -->
  <!-- /PAGE PLUGIN STYLES -->
  <!-- *********************************************************************************** -->



  <!-- *********************************************************************************** -->
  <!-- PAGE CUSTOM STYLES -->
  <!-- *********************************************************************************** -->
  <link rel="stylesheet" href="/note-commerce/static/custom/admin/products/css/products.css">
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
              <h1>
<c:choose>
  <c:when test="${(param.operation == 'update') or (param.operation == 'consult')}">
    Editar Laptop
  </c:when>
  <c:otherwise>
    Novo Laptop
  </c:otherwise>
</c:choose>
              </h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="dashboard.html">Admin Home</a></li>
                <li class="breadcrumb-item"><a href="/note-commerce/admin/products?operation=consult">Laptops</a></li>
                <li class="breadcrumb-item active">
<c:choose>
  <c:when test="${(param.operation == 'update') or (param.operation == 'consult')}">
    Editar Laptop
  </c:when>
  <c:otherwise>
    Novo Laptop
  </c:otherwise>
</c:choose>
                </li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">

          <form action="/note-commerce/admin/products" method="POST" enctype="multipart/form-data">
          	<c:choose>
          		<c:when test="${(param.operation == 'update') or (param.operation == 'consult')}">
	              <input type="hidden" name="operation" value="update">
	              <input type="hidden" name="id" value="${previousProduct.id}">
          		</c:when>
	          	<c:otherwise>
	              <input type="hidden" name="operation" value="save">
	          	</c:otherwise>
          	</c:choose>
            <div class="row">
              <div class="col col-12">
                <div class="card card-default">
                  <div class="card-header">
                    <h3 class="card-title">Dados Básicos</h3>

                    <div class="card-tools">
                      <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                          class="fas fa-minus"></i></button>
                    </div>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body">
                    <div class="row">
                      <div class="col col-9">
                        <div class="form-group">
                          <label for="title">Título<span class="text-danger text-bold"> *</span></label>
                          <input type="text" maxlength="200" class="form-control" name="title" id="title"
                            placeholder="Título completo do laptop" value="<c:out value="${previousProduct.title}"/>">
                        </div>
                      </div>
                      <div class="col col-3">
                        <div class="form-group">
                          <label for="price">Preço<span class="text-danger text-bold"> *</span></label>
                          <input type="text" class="form-control" name="price" id="price"<c:if test="${previousProduct.price != -1}"> value="${previousProduct.price}"</c:if>>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col col-4">
                        <div class="form-group h-100">
                          <label for="title">Imagem</label>
                          <div class="product-img-display">
                            <c:if test="${not empty previousProduct.image.url}">
				              <img src="<c:out value="${previousProduct.image.url}"/>">
				            </c:if>
                          </div>
                          <input id="image" name="image" type="file" class="custom-file-input" accept="image/*">
                          <input id="imageBase64" name="imageBase64" type="hidden" value="<c:out value="${previousProduct.image.url}"/>">
                        </div>
                      </div>
                      <div class="col col-8">
                        <div class="form-group">
                          <label for="price">Descrição</label>
                          <textarea class="form-control" maxlength="4000" name="description" id="description"><c:out value="${previousProduct.description}"/></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col col-12">
                <div class="card card-default">
                  <div class="card-header">
                    <h3 class="card-title">Especificações</h3>

                    <div class="card-tools">
                      <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                          class="fas fa-minus"></i></button>
                    </div>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body">
                    <div class="row">
                      <div class="col col-3">
                        <div class="form-group">
                          <label for="brand">Marca<span class="text-danger text-bold"> *</span></label>
                          <select class="form-control select2bs4" style="width: 100%;" name="brand" id="brand">
                          </select>
                        </div>
                      </div>
                      <div class="col col-3">
                        <div class="form-group">
                          <label for="processor">Processador<span class="text-danger text-bold"> *</span></label>
                          <input type="text" class="form-control" name="processor" id="processor"
                            placeholder="i5-2900, Pentium..." value="<c:out value="${previousProduct.processor}"/>">
                        </div>
                      </div>
                      <div class="col col-4">
                        <div class="form-group">
                          <label for="processor">Placa de Vídeo<span class="text-danger text-bold"> *</span></label>
                          <input type="text" class="form-control" name="graphics_card" id="graphics_card"
                            placeholder="Intel Graphics Card 20, NVDIA..." value="<c:out value="${previousProduct.graphicsCard}"/>">
                        </div>
                      </div>
                      <div class="col col-2">
                        <div class="form-group">
                          <label for="ram">Memória RAM<span class="text-danger text-bold"> *</span></label>
                          <input type="text" class="form-control" name="ram" id="ram" value="<c:out value="${previousProduct.ram}"/>">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col col-3">
                        <div class="form-group">
                          <label for="monitor">Monitor<span class="text-danger text-bold"> *</span></label>
                          <input type="text" class="form-control" name="monitor" id="monitor" value="<c:out value="${previousProduct.monitor}"/>">
                        </div>
                      </div>
                      <div class="col col-1">
                      </div>
                      <div class="col col-2">
                        <div class="form-group">
                          <div class="icheck-primary d-inline">
                            <input type="checkbox" id="has-hd" name="has-hd" checked>
                            <label for="has-hd">HD</label>
                          </div>
                          <input id="hd-capacity" name="hd-capacity" type="text" class="form-control d-inline"<c:if test="${previousProduct.hd != -1}"> value="${previousProduct.hd}"</c:if>>
                        </div>
                      </div>
                      <div class="col col-2">
                        <div class="form-group">
                          <div class="icheck-primary d-inline">
                            <input type="checkbox" id="has-ssd" name="has-ssd" checked>
                            <label for="has-ssd">SSD</label>
                          </div>
                          <input id="ssd-capacity" name="ssd-capacity" type="text" class="form-control d-inline"<c:if test="${previousProduct.ssd != -1}"> value="${previousProduct.ssd}"</c:if>>
                        </div>
                      </div>
                      <div class="col col-1">
                      </div>
                      <div class="col col-3">
                        <div class="form-group">
                          <label for="monitor">Sistema Operacional<span class="text-danger text-bold"> *</span></label>
                          <select class="form-control select2bs4" style="width: 100%;" name="os" id="os">
                            <option <c:if test="${previousProduct.os == 'Windows'}">selected</c:if>>Windows</option>
                            <option <c:if test="${previousProduct.os == 'Linux'}">selected</c:if>>Linux</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col col-6">
                <a href="/note-commerce/admin/products?operation=consult" class="btn btn-block btn-danger" role="button">Cancelar</a>
              </div>
              <div class="col col-6">
                <!-- <a href="/note-commerce/admin/products?operation=consult" class="btn btn-block btn-primary" role="button">Cadastrar</a> -->
                <button type="submit" class="btn btn-block btn-primary">
<c:choose>
  <c:when test="${(param.operation == 'update') or (param.operation == 'consult')}">
    Atualizar
  </c:when>
  <c:otherwise>
    Cadastrar
  </c:otherwise>
</c:choose>
                </button>
              </div>
            </div>
          </form>

        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content -->
    </div>
    <!-- *********************************************************************************** -->
    <!-- /PAGE CONTENT -->
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
      <section class="content">
        <div class="container-fluid">

        </div><!-- /.container-fluid -->
      </section>
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
  <!-- Select2 -->
  <script src="/note-commerce/static/plugins/select2/js/select2.full.min.js"></script>
  <script src="/note-commerce/static/plugins/select2/js/i18n/pt-BR.js"></script>
  <!-- InputMask -->
  <script src="/note-commerce/static/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<!-- *********************************************************************************** -->
<!-- /PAGE PLUGINS SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->
  <!-- Page JavaScript -->
  <script src="/note-commerce/static/custom/admin/products/js/image-display.js"></script>
  <script src="/note-commerce/static/custom/general/js/error_label.js"></script>
<!-- *********************************************************************************** -->
<!-- /PAGE CUSTOM SCRIPTS -->
<!-- *********************************************************************************** -->



<!-- *********************************************************************************** -->
<!-- PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->
  <script>
    $(document).ready(() => {
	   	$.ajax({
	   	    url:'/note-commerce/admin/brands?operation=consult',
	   	    type:'GET',
	   	    dataType: 'json',
	   	    success: function( json ) {
	   	        $.each(json, function(i, value) {
	   	        	let brandName = value.name;
	   	            $('#brand').append($(`<option>`).text(brandName).attr('value', value.id));
	   	        });
	   	    }
	   	});
    	
      // Initialize Select2 Elements
      $('.select2bs4').select2({
        theme: 'bootstrap4',
        language: 'pt-BR'
      })

      $('#price').inputmask('currency', {
        groupSeparator: ',',
        digits: 2,
        radixPoint: '.',
        prefix: 'R$ ',
        max: 100000,
        allowMinus: false,
        autoUnmask: true,
        removeMaskOnSubmit: true
      });

      $('#ram').inputmask('numeric', {
        digits: 0,
        min: 0,
        max: 32,
        suffix: ' GB',
        allowMinus: false,
        autoUnmask: true,
        removeMaskOnSubmit: true
      });

      $('#monitor').inputmask('numeric', {
        digits: 1,
        min: 7,
        max: 25,
        suffix: ' polegadas',
        allowMinus: false,
        autoUnmask: true,
        removeMaskOnSubmit: true
      });

      $('.product-img-display').click(() => $('#image').click());

      $('#has-hd').click(() => {
        $('#hd-capacity').prop('disabled', !$('#has-hd')[0].checked);
        if ($('#hd-capacity').prop('disabled')) {
          $('#hd-capacity').val(null);
          $('#has-ssd')[0].checked = true;
          $('#ssd-capacity').prop('disabled', false);
        }
      });

      $('#hd-capacity').inputmask('numeric', {
        digits: 0,
        max: 4000,
        suffix: ' GB',
        allowMinus: false,
        autoUnmask: true,
        removeMaskOnSubmit: true
      });

      $('#has-ssd').click(() => {
        $('#ssd-capacity').prop('disabled', !$('#has-ssd')[0].checked);
        if ($('#ssd-capacity').prop('disabled')) {
          console.log(2)
          $('#ssd-capacity').val(null);
          $('#has-hd')[0].checked = true;
          $('#hd-capacity').prop('disabled', false);
        }
      });

      $('#ssd-capacity').inputmask('numeric', {
        digits: 0,
        max: 4000,
        suffix: ' GB',
        allowMinus: false,
        autoUnmask: true,
        removeMaskOnSubmit: true
      });

      <c:if test="${not empty message}">
        displayFormErrors(`
     		<c:out value="${message}"/>
        `)
      </c:if>
    })
  </script>
<!-- *********************************************************************************** -->
<!-- /PLUGIN INITIALIZATION AND DYNAMIC SCRIPTS -->
<!-- *********************************************************************************** -->



</html>
