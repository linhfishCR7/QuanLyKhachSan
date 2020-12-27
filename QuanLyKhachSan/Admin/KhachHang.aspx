<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Layout.Master" AutoEventWireup="true" CodeBehind="KhachHang.aspx.cs" Inherits="QuanLyKhachSan.Admin.KhachHang" %>

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
                                    DataKeyNames="KH_MA" CssClass="table table-striped table-responsive table-hover table-bordered" Style="border-collapse: collapse; border-spacing: 0; width: 100%;" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="20">
                                    <Columns>
                                        <asp:ButtonField CommandName="editRecord" HeaderText="Edit" ButtonType="Link" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                            <ControlStyle CssClass="btn btn-xs mauvang"></ControlStyle>
                                            <ItemStyle Width="40px" />
                                        </asp:ButtonField>
                                        <asp:ButtonField CommandName="deleteRecord" HeaderText="Delete" ButtonType="Link" Text='<i class="fe-trash"></i>' ItemStyle-Width="40px" ImageUrl="../img/remove.png">
                                            <ControlStyle CssClass="btn btn-xs maudo"></ControlStyle>
                                            <ItemStyle Width="40px" />
                                        </asp:ButtonField>
                                        <asp:BoundField DataField="KH_MA" HeaderText="ID" ReadOnly="True" SortExpression="KH_MA" />
                                        <asp:BoundField DataField="KH_HOTEN" HeaderText="Full Name" SortExpression="KH_HOTEN" />
                                        <asp:BoundField DataField="KH_SDT" HeaderText="Phone Number" SortExpression="KH_SDT" />
                                        <asp:BoundField DataField="KH_CMND" HeaderText="Indentify Number" SortExpression="KH_CMND" />
                                        <asp:BoundField DataField="KH_NAMSINH" HeaderText="Birthday" SortExpression="KH_NAMSINH" />
                                        <asp:BoundField DataField="KH_DIACHI" HeaderText="Address" SortExpression="KH_DIACHI" />
                                        <asp:BoundField DataField="KH_QUOCTICH" HeaderText="national" SortExpression="KH_QUOCTICH" />
                                        <asp:BoundField DataField="KH_GIOITINH" HeaderText="Gender" SortExpression="KH_GIOITINH" />
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
                             <%--([KH_MA], [KH_HOTEN], [KH_SDT], [KH_CMND], [KH_NAMSINH], [KH_DIACHI], [KH_QUOCTICH], [KH_GIOITINH])--%> 
                            <asp:UpdatePanel ID="upAdd" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body p-4">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-2" class="control-label">ID: (*)</label>
                                                    <asp:TextBox ID="txtKH_MA" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-3" class="control-label">Full Name: (*)</label>
                                                    <asp:TextBox ID="txtKH_HOTEN" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-4" class="control-label">Phone Number: (*)</label>
                                                    <asp:TextBox ID="txtKH_SDT" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-5" class="control-label">Identify Number: (*)</label>
                                                    <asp:TextBox ID="txtKH_CMND" runat="server" CssClass="form-control" MaxLength="12"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-6" class="control-label">Birthday: (*)</label>
                                                    <asp:TextBox ID="txtKH_NAMSINH" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtKH_NAMSINH_CalendarExtender" TargetControlID="txtKH_NAMSINH" ID="txtKH_NAMSINH_CalendarExtender" Format="yyyy"></ajaxToolkit:CalendarExtender>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-7" class="control-label">Address: (*)</label>
                                                    <CKEditor:CKEditorControl ID="txtKH_DIACHI" Height="100" runat="server"></CKEditor:CKEditorControl>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-8" class="control-label">National: (*)</label>
                                                    <asp:TextBox ID="txtKH_QUOCTICH" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-9" class="control-label">Gender: (*)</label>
                                                    <asp:TextBox ID="txtKH_GIOITINH" runat="server" CssClass="form-control" MaxLength="1"></asp:TextBox>
                                                    <small class="text-danger">1 là nam, 0 là nữ, 2 là khác</small>
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
                                                    <asp:TextBox ID="txtKH_MA1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-3" class="control-label">Full Name: (*)</label>
                                                    <asp:TextBox ID="txtKH_HOTEN1" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-4" class="control-label">Phone Number: (*)</label>
                                                    <asp:TextBox ID="txtKH_SDT1" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-5" class="control-label">Identify Number: (*)</label>
                                                    <asp:TextBox ID="txtKH_CMND1" runat="server" CssClass="form-control" MaxLength="12"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-6" class="control-label">Birthday: (*)</label>
                                                    <asp:TextBox ID="txtKH_NAMSINH1" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtKH_NAMSINH1_CalendarExtender" TargetControlID="txtKH_NAMSINH1" ID="txtKH_NAMSINH1_CalendarExtender" Format="yyyy"></ajaxToolkit:CalendarExtender>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-7" class="control-label">Address: (*)</label>
                                                    <CKEditor:CKEditorControl ID="txtKH_DIACHI1" Height="100" runat="server"></CKEditor:CKEditorControl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-8" class="control-label">National: (*)</label>
                                                    <asp:TextBox ID="txtKH_QUOCTICH1" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-9" class="control-label">Gender: (*)</label>
                                                    <asp:TextBox ID="txtKH_GIOITINH1" runat="server" CssClass="form-control" MaxLength="1"></asp:TextBox>
                                                    <small class="text-danger">1 là nam, 0 là nữ, 2 là khác</small>
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
                        SelectCommand="SELECT * FROM [KHACH_HANG]"
                        DeleteCommand="DELETE FROM [KHACH_HANG] WHERE [KH_MA] = @KH_MA"
                        InsertCommand="INSERT INTO [KHACH_HANG] ([KH_MA], [KH_HOTEN], [KH_SDT], [KH_CMND], [KH_NAMSINH], [KH_DIACHI], [KH_QUOCTICH], [KH_GIOITINH]) VALUES (@KH_MA, @KH_HOTEN, @KH_SDT, @KH_CMND, @KH_NAMSINH, @KH_DIACHI, @KH_QUOCTICH, @KH_GIOITINH)"
                        UpdateCommand="UPDATE [KHACH_HANG] SET [KH_HOTEN] = @KH_HOTEN, [KH_SDT] = @KH_SDT, [KH_CMND] = @KH_CMND, [KH_NAMSINH] = @KH_NAMSINH, [KH_DIACHI] = @KH_DIACHI, [KH_QUOCTICH] = @KH_QUOCTICH, [KH_GIOITINH] = @KH_GIOITINH WHERE [KH_MA] = @KH_MA">
                        <DeleteParameters>
                            <asp:Parameter Name="KH_MA" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="KH_MA" Type="String" />
                            <asp:Parameter Name="KH_HOTEN" Type="String" />
                            <asp:Parameter Name="KH_SDT" Type="String" />
                            <asp:Parameter Name="KH_CMND" Type="String" />
                            <asp:Parameter Name="KH_NAMSINH" Type="Int32" />
                            <asp:Parameter Name="KH_DIACHI" Type="String" />
                            <asp:Parameter Name="KH_QUOCTICH" Type="String" />
                            <asp:Parameter Name="KH_GIOITINH" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="KH_HOTEN" Type="String" />
                            <asp:Parameter Name="KH_SDT" Type="String" />
                            <asp:Parameter Name="KH_CMND" Type="String" />
                            <asp:Parameter Name="KH_NAMSINH" Type="Int32" />
                            <asp:Parameter Name="KH_DIACHI" Type="String" />
                            <asp:Parameter Name="KH_QUOCTICH" Type="String" />
                            <asp:Parameter Name="KH_GIOITINH" Type="String" />
                            <asp:Parameter Name="KH_MA" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
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
