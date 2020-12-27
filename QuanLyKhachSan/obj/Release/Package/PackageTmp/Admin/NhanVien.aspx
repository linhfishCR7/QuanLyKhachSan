<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Layout.Master" AutoEventWireup="true" CodeBehind="NhanVien.aspx.cs" Inherits="QuanLyKhachSan.Admin.NhanVien" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Namespace="CKEditor.NET" Assembly="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Namespace="CKFinder" Assembly="CKFinder" TagPrefix="CKFinder" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="../ckeditor/ckeditor.js"></script>
    <script src="../ckfinder/ckfinder.js"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentAdmin" runat="server">

    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group my-3">
            <div class="list-group-item maudo">
                UPDATE USERS
            </div>
            <div class="list-group-item limit-500">
                <asp:UpdatePanel ID="upCrudGrid" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" OnClick="btnAdd_Click"><i class="fe-plus-square"></i> New</asp:LinkButton>
                                </div>
                            </div>
                        </div>

                        <asp:GridView ID="GridView1" runat="server" Width="100%" HorizontalAlign="Center" OnRowCommand="GridView1_RowCommand"
                            AutoGenerateColumns="False"
                            DataKeyNames="NV_MA" CssClass="table table-striped table-responsive table-hover table-bordered" Style="border-collapse: collapse; border-spacing: 0; width: 100%;" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="20">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" HeaderText="Edit" ButtonType="Link" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn btn-xs mauvang"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" HeaderText="Delete" ButtonType="Link" Text='<i class="fe-trash"></i>' ItemStyle-Width="40px" ImageUrl="../img/remove.png">
                                    <ControlStyle CssClass="btn btn-xs maudo"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField DataField="NV_MA" HeaderText="ID" ReadOnly="True" SortExpression="NV_MA" />
                                <asp:BoundField DataField="VTCT_MA" HeaderText="Bussiness Position" SortExpression="VTCT_MA" />
                                <asp:BoundField DataField="NV_HOTEN" HeaderText="Full Name" SortExpression="NV_HOTEN" />
                                <asp:BoundField DataField="NV_NAMSINH" HeaderText="Birthday" SortExpression="NV_NAMSINH" />
                                <asp:BoundField DataField="NV_GIOITINH" HeaderText="Gender" SortExpression="NV_GIOITINH" />
                                <asp:BoundField DataField="NV_DIACHI" HeaderText="Address" SortExpression="NV_DIACHI" />
                                <asp:BoundField DataField="NV_SDT" HeaderText="Phone Number" SortExpression="NV_SDT" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>


        <!--Bắt đầu Thêm -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Add</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <%--([NV_MA], [VTCT_MA], [NV_HOTEN], [NV_NAMSINH], [NV_GIOITINH], [NV_DIACHI], [NV_SDT]) --%>
                    <asp:UpdatePanel ID="upAdd" runat="server">
                        <ContentTemplate>
                            <div class="modal-body p-4">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">ID: (*)</label>
                                            <asp:TextBox ID="txtNV_MA" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-4" class="control-label">Business Position: (*)</label>
                                            <asp:DropDownList ID="ddlVTCT_MA" runat="server"
                                                DataSourceID="SqlDataSource2"
                                                DataTextField="VTCT_TEN"
                                                DataValueField="VTCT_MA" AutoPostBack="True" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-3" class="control-label">Full Name: (*)</label>
                                            <asp:TextBox ID="txtNV_HOTEN" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-6" class="control-label">Birthday: (*)</label>
                                            <asp:TextBox ID="txtNV_NAMSINH" runat="server" CssClass="form-control"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNV_NAMSINH_CalendarExtender" TargetControlID="txtNV_NAMSINH" ID="txtNV_NAMSINH_CalendarExtender" Format="yyyy"></ajaxToolkit:CalendarExtender>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-9" class="control-label">Gender: (*)</label>
                                            <asp:TextBox ID="txtNV_GIOITINH" runat="server" CssClass="form-control" MaxLength="1"></asp:TextBox>
                                            <small class="text-danger">1 là nam, 0 là nữ, 2 là khác</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-7" class="control-label">Address: (*)</label>
                                            <CKEditor:CKEditorControl ID="txtNV_DIACHI" Height="100" runat="server"></CKEditor:CKEditorControl>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-4" class="control-label">Phone Number: (*)</label>
                                            <asp:TextBox ID="txtNV_SDT" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnAddRecord" runat="server" CssClass="btn mauxanh" OnClick="btnAddRecord_Click"><i class="ion ion-md-save"></i> Add</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="ion ion-md-remove-circle"></i></span> Close</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAddRecord" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <!--Bắt đầu Sửa -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upEdit" runat="server">
                        <ContentTemplate>
                            <div class="modal-body p-4">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">ID: (*)</label>
                                            <asp:TextBox ID="txtNV_MA1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-4" class="control-label">Business Position: (*)</label>
                                            <asp:DropDownList ID="ddlVTCT_MA1" runat="server"
                                                DataSourceID="SqlDataSource2"
                                                DataTextField="VTCT_TEN"
                                                DataValueField="VTCT_MA" AutoPostBack="True" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-3" class="control-label">Full Name: (*)</label>
                                            <asp:TextBox ID="txtNV_HOTEN1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-6" class="control-label">Birthday: (*)</label>
                                            <asp:TextBox ID="txtNV_NAMSINH1" runat="server" CssClass="form-control"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNV_NAMSINH1_CalendarExtender" TargetControlID="txtNV_NAMSINH1" ID="txtNV_NAMSINH1_CalendarExtender" Format="yyyy"></ajaxToolkit:CalendarExtender>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-9" class="control-label">Gender: (*)</label>
                                            <asp:TextBox ID="txtNV_GIOITINH1" runat="server" CssClass="form-control" MaxLength="1"></asp:TextBox>
                                            <small class="text-danger">1 là nam, 0 là nữ, 2 là khác</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-7" class="control-label">Address: (*)</label>
                                            <CKEditor:CKEditorControl ID="txtNV_DIACHI1" Height="100" runat="server"></CKEditor:CKEditorControl>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-4" class="control-label">Phone Number: (*)</label>
                                            <asp:TextBox ID="txtNV_SDT1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn mauxanh" OnClick="btnSave_Click"><i class="ion ion-md-save"></i> Update</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="ion ion-md-remove-circle"></i>Close</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <!-- Kết thúc sửa -->

        <!--Bắt đầu Xóa-->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Delete</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upDel" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                Are you sure you want to delete the record?
                                    <asp:HiddenField ID="hfCode" runat="server" />
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn maudo" OnClick="btnDelete_Click"><i class="ion ion-md-trash"></i> Delete</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="ion ion-md-remove-circle"></i>Cancel</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <!--Kết thúc xóa -->

        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:QLKSConnection %>"
                SelectCommand="SELECT * FROM [NHAN_VIEN]"
                DeleteCommand="DELETE FROM [NHAN_VIEN] WHERE [NV_MA] = @NV_MA"
                InsertCommand="INSERT INTO [NHAN_VIEN] ([NV_MA], [VTCT_MA], [NV_HOTEN], [NV_NAMSINH], [NV_GIOITINH], [NV_DIACHI], [NV_SDT]) VALUES (@NV_MA, @VTCT_MA, @NV_HOTEN, @NV_NAMSINH, @NV_GIOITINH, @NV_DIACHI, @NV_SDT)"
                UpdateCommand="UPDATE [NHAN_VIEN] SET [VTCT_MA] = @VTCT_MA, [NV_HOTEN] = @NV_HOTEN, [NV_NAMSINH] = @NV_NAMSINH, [NV_GIOITINH] = @NV_GIOITINH, [NV_DIACHI] = @NV_DIACHI, [NV_SDT] = @NV_SDT WHERE [NV_MA] = @NV_MA">
                <DeleteParameters>
                    <asp:Parameter Name="NV_MA" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="NV_MA" Type="String" />
                    <asp:Parameter Name="VTCT_MA" Type="String" />
                    <asp:Parameter Name="NV_HOTEN" Type="String" />
                    <asp:Parameter Name="NV_NAMSINH" Type="Int32" />
                    <asp:Parameter Name="NV_GIOITINH" Type="Boolean" />
                    <asp:Parameter Name="NV_DIACHI" Type="String" />
                    <asp:Parameter Name="NV_SDT" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="VTCT_MA" Type="String" />
                    <asp:Parameter Name="NV_HOTEN" Type="String" />
                    <asp:Parameter Name="NV_NAMSINH" Type="Int32" />
                    <asp:Parameter Name="NV_GIOITINH" Type="Boolean" />
                    <asp:Parameter Name="NV_DIACHI" Type="String" />
                    <asp:Parameter Name="NV_SDT" Type="String" />
                    <asp:Parameter Name="NV_MA" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QLKSConnection %>" SelectCommand="SELECT [VTCT_MA], [VTCT_TEN] FROM [VI_TRI_CONG_TAC]"></asp:SqlDataSource>

        </div>
    </asp:Panel>
    <asp:Panel ID="panelThongBao" runat="server" Visible="False">
        <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
    </asp:Panel>
    <asp:Panel ID="panelError" runat="server" Visible="False">
        <h4 class="alert alert-warning" role="alert">
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label></h4>
    </asp:Panel>

</asp:Content>
