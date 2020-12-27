<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Layout.Master" AutoEventWireup="true" CodeBehind="M01_LichLamViec.aspx.cs" Inherits="QuanLyKhachSan.Admin.M01_LichLamViec" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentAdmin" runat="server">
    <div class="container-fluid my-3">
        <div class="row">
            <div class="col-md-12">
                <asp:Panel ID="panelPhanQuyen" runat="server">
                    <div class="list-group">
                        <div class="list-group-item maureu">
                            TIMETABLE FOR STAFF
                        </div>
                        <div class="list-group-item report">
                            <table class="table table-responsive">
                                <tr>
                                    <td>Inspected Package:</td>
                                    <td>
                                        <asp:DropDownList ID="ddlNV_MA" runat="server" DataSourceID="SqlDataSource2" CssClass="form-control" DataTextField="NV_HOTEN" DataValueField="NV_MA" AutoPostBack="True"></asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="800px">
                                <LocalReport ReportPath="Report/RLich.rdlc">
                                    <DataSources>
                                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="RLich" />
                                    </DataSources>
                                </LocalReport>
                            </rsweb:ReportViewer>
                            <br />
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetDataByNV_MA" TypeName="QuanLyKhachSan.dsLichTableAdapters.V01_LichLamViecTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlNV_MA" Name="NV_MA" PropertyName="SelectedValue" Type="String" DefaultValue="TDM2MSJP" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QLKSConnection %>" SelectCommand="SELECT [NV_MA], [NV_HOTEN] FROM [NHAN_VIEN]"></asp:SqlDataSource>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="panelThongBao" runat="server" Visible="False">
                    <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
                </asp:Panel>
            </div>

        </div>
    </div>

</asp:Content>
