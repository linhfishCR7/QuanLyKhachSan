<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/auth/Auth.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QuanLyKhachSan.Admin.auth.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentAuth" runat="server">

        <div class="account-pages mt-5 mb-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card">

                            <div class="card-body p-4">
                                <div class="text-center w-75 m-auto">
                                    <a href="index.html">
                                        <span>
                                            <img src="/Admin/assets/images/favicon.ico" alt="" height="22" /></span>
                                    </a>
                                    <p class="text-muted mb-4 mt-3">TÀI KHOẢN HỆ THỐNG</p>
                                </div>
                                <div class="list-group-item row">
                                    <asp:Login ID="Login1" runat="server" TextLayout="TextOnTop" CssClass="col-md-12 col-sm-12 col-xs-12"
                                        Width="100%" TitleText="" RememberMeSet="True"
                                        PasswordLabelText="Password:" LoginButtonText="Login" RememberMeText="Remember me." UserNameLabelText="User:"
                                        OnAuthenticate="Login1_Authenticate1">
                                        <LoginButtonStyle CssClass="btn btn-block btn-primary" />
                                        <TextBoxStyle CssClass="form-control" />
                                    </asp:Login>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

