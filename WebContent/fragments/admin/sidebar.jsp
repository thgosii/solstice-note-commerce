<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <a href="/admin/dashboard" class="brand-link text-center">
        <span class="brand-text font-weight-light">LapTop Computadores</span>
      </a>
      
      <!-- Sidebar -->
      <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <div class="info">
            <a href="#" class="d-block">Usuário Admin</a>
          </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <li class="nav-item">
              <a href="/note-commerce/pages/admin/dashboard.jsp" class="nav-link">
                <i class="nav-icon fas fa-tachometer-alt"></i>
                <p>
                  Dashboard
                </p>
              </a>
            </li>
            <!-- <li class="nav-header">MULTI LEVEL EXAMPLE</li> -->
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="fas fa-laptop nav-icon"></i>
                <p>Laptops</p>
                <i class="right fas fa-angle-left"></i>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="/note-commerce/pages/admin/products-new.jsp" class="nav-link">
                    <i class="fas fa-plus nav-icon text-success"></i>
                    <p>Novo Laptop</p>
                  </a>
                </li>
                <li class="nav-item has-treeview">
                  <a href="/note-commerce/admin/products?operation=consult" class="nav-link">
                  <i class="fas fa-table nav-icon text-info"></i>
                  <p>Todos Laptops</p></a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="/note-commerce/pages/admin/sales.jsp" class="nav-link">
                <i class="nav-icon fas fa-dollar-sign"></i>
                <p>Vendas</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/note-commerce/admin/trades?operation=consult" class="nav-link">
                <i class="nav-icon fas fa-exchange-alt"></i>
                <p>Trocas</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="nav-icon fas fa-warehouse"></i>
                <p>Estoque</p>
                <i class="right fas fa-angle-left"></i>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="stock-up.html" class="nav-link">
                    <i class="nav-icon fas fa-arrow-up text-success"></i>
                    <p>Entrada em estoque</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="/note-commerce/logout" class="nav-link">
                <i class="nav-icon fas fa-sign-out-alt"></i>
                <p>Sair</p>
              </a>
            </li>
          </ul>
        </nav>
        <!-- /.sidebar-menu -->
      </div>
      <!-- /.sidebar -->
    </aside>