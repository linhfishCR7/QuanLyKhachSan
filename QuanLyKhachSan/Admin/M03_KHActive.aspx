<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Layout.Master" AutoEventWireup="true" CodeBehind="M03_KHActive.aspx.cs" Inherits="QuanLyKhachSan.Admin.M03_KHActive" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentAdmin" runat="server">
    <div class="container-fluid my-3">
        <div class="row">
                <div class="col-md-12">
                    <asp:Panel ID="panel3" runat="server">
                        <div class="list-group">
                            <div class="list-group-item maureu">
                                LIST USER
                            </div>
                            <div class="list-group-item report">
                                <rsweb:reportviewer id="ReportViewer3" runat="server" width="100%" font-names="Verdana" font-size="8pt" waitmessagefont-names="Verdana" waitmessagefont-size="14pt" height="800px">
                                    <LocalReport ReportPath="Report/RKHActive.rdlc">
                                        <DataSources>
                                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="RKHActive" />
                                        </DataSources>
                                    </LocalReport>
                                </rsweb:reportviewer>
                                <br />
                                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="QuanLyKhachSan.dsKHActiveTableAdapters.V03_KHACTIVETableAdapter"></asp:ObjectDataSource>
                            </div>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="panel4" runat="server" Visible="False">
                        <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
                    </asp:Panel>
                </div>
            </div>
    </div>

</asp:Content>
