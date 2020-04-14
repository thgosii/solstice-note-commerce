<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- jQuery -->
<script src="/note-commerce/static/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/note-commerce/static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/note-commerce/static/dist/js/adminlte.min.js"></script>

<c:if test="${loggedUser.role == 'CLIENT'}">
 <!-- Customer balance (navbar) -->
 <script src="/note-commerce/static/custom/customer/js/balance.js"></script>
</c:if>