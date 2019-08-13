<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">DAT HOMESTAY</a>
        </div>

        <!-- Top Navigation: Right Menu -->
        <ul class="nav navbar-right navbar-top-links">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> ${sessionScope.USER} <b class="caret"></b>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="/DatHomestay/LogoutController"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- Sidebar -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="/DatHomestay/admin/admin.jsp" class="active"><i class="fa fa-dashboard fa-fw"></i> User Manager</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i> Acessory<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/DatHomestay/admin/accessory.jsp">Manager Accessory</a>
                            </li>
                            <li>
                                <a href="/DatHomestay/admin/addAccessory.jsp">Add Accessory</a>
                            </li>
                        </ul>
                    </li>
                     <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i> Service<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/DatHomestay/admin/service.jsp">Manager Service</a>
                            </li>
                            <li>
                                <a href="/DatHomestay/admin/addService.jsp">Add Service</a>
                            </li>
                        </ul>
                    </li>
                </ul>

            </div>
        </div>
    </nav>
        <script src="/DatHomestay/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="/DatHomestay/js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="/DatHomestay/js/startmin.js"></script>
<!-- jQuery -->
