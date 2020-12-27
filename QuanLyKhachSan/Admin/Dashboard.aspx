<%@ Page Title="DashBoard" Language="C#" MasterPageFile="~/Admin/Admin_Layout.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="QuanLyKhachSan.Admin.Dashboard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentAdmin" runat="server">
    <div class="content">

        <!-- Start Content-->
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Minton</a></li>
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Welcome !</h4>
                    </div>
                </div>
            </div>

            <!-- end page title -->

            <div class="row">
                <div class="col-md-12">
                    <img src="/Admin/assets/images/vinpearl-luxury-landmark.jpg" />
                </div>
            </div>

        </div>
        <!-- container -->

    </div>
    <!-- content -->
    <!-- Footer Start -->
    <footer class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    2020 &copy; Minton theme by <a href="http://linhfishcr7.wordpress.com/">LINHFISH</a>
                </div>
                <div class="col-md-6">
                    <div class="text-md-right footer-links d-none d-sm-block">
                        <a href="javascript:void(0);">About Us</a>
                        <a href="javascript:void(0);">Help</a>
                        <a href="javascript:void(0);">Contact Us</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- end Footer -->
</asp:Content>
