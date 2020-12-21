<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin_Layout.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="QuanLyKhachSan.Admin.Users" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    </style>
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
                                    DataKeyNames="id" CssClass="table table-striped table-responsive table-hover table-bordered" Style="border-collapse: collapse; border-spacing: 0; width: 100%;" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:ButtonField CommandName="editRecord" HeaderText="Edit" ButtonType="Link" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                            <ControlStyle CssClass="btn btn-xs mauvang"></ControlStyle>
                                            <ItemStyle Width="40px" />
                                        </asp:ButtonField>
                                        <asp:ButtonField CommandName="deleteRecord" HeaderText="Delete" ButtonType="Link" Text='<i class="fe-trash"></i>' ItemStyle-Width="40px" ImageUrl="../img/remove.png">
                                            <ControlStyle CssClass="btn btn-xs maudo"></ControlStyle>
                                            <ItemStyle Width="40px" />
                                        </asp:ButtonField>
                                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" InsertVisible="False" />
                                        <asp:BoundField DataField="name_user" HeaderText="name_user" SortExpression="name_user" />
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                                        <asp:BoundField DataField="NV_MA" HeaderText="NV_MA" SortExpression="NV_MA" />
                                        <asp:BoundField DataField="NV_HOTEN" HeaderText="NV_HOTEN" SortExpression="NV_HOTEN" />
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
                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalScrollableTitle">Add</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <asp:UpdatePanel ID="upAdd" runat="server">
                                <ContentTemplate>
                                    <div class="modal-body p-4">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-1" class="control-label">Tên Người Dùng: (*)</label>
                                                    <asp:TextBox ID="txtTenUser" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-2" class="control-label">Email: (*)</label>
                                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-3" class="control-label">Password: (*)</label>
                                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-4" class="control-label">Staff_ID: (*)</label>
                                                    <asp:DropDownList ID="ddlNV_MA" runat="server"
                                                        DataSourceID="SqlDataSource2"
                                                        DataTextField="NV_HOTEN"
                                                        DataValueField="NV_MA" AutoPostBack="True">
                                                    </asp:DropDownList>
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
                    <div class="modal-dialog modal-dialog-scrollable" role="document">
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
                                                    <label for="field-1" class="control-label">ID Người Dùng: (*)</label>
                                                    <asp:TextBox ID="txtID_User1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-2" class="control-label">Tên Người Dùng: (*)</label>
                                                    <asp:TextBox ID="txtTenUser1" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-3" class="control-label">Email: (*)</label>
                                                    <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-4" class="control-label">Password: (*)</label>
                                                    <asp:TextBox ID="txtPassword1" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="field-5" class="control-label">Staff_ID: (*)</label>
                                                    <asp:DropDownList ID="ddlNV_MA1" runat="server"
                                                        DataSourceID="SqlDataSource2"
                                                        DataTextField="NV_HOTEN"
                                                        DataValueField="NV_MA" AutoPostBack="True">
                                                    </asp:DropDownList>
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
                        SelectCommand="SELECT [user].id, [user].name_user, [user].email, [user].password, [user].NV_MA, NHAN_VIEN.NV_HOTEN FROM [user] INNER JOIN NHAN_VIEN ON [user].NV_MA = NHAN_VIEN.NV_MA"
                        DeleteCommand="DELETE FROM [user] WHERE [id] = @id"
                        InsertCommand="INSERT INTO [user] ([name_user], [email], [password], [NV_MA]) VALUES (@name_user, @email, @password, @NV_MA)"
                        UpdateCommand="UPDATE [user] SET [name_user] = @name_user, [email] = @email, [password] = @password, [NV_MA] = @NV_MA WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name_user" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="password" Type="String" />
                            <asp:Parameter Name="NV_MA" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name_user" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="password" Type="String" />
                            <asp:Parameter Name="NV_MA" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QLKSConnection %>" SelectCommand="SELECT [NV_MA], [NV_HOTEN] FROM [NHAN_VIEN]"></asp:SqlDataSource>
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
