using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CKFinder;

namespace QuanLyKhachSan.Admin
{
    public partial class KhachHang : System.Web.UI.Page
    {
        public FileBrowser FileBrowser1 { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("auth/login");
            }
        }
        //Add Modal
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#addModal').modal('show');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddShowModalScript", sb.ToString(), false);

        }



        //([KH_MA], [KH_HOTEN], [KH_SDT], [KH_CMND], [KH_NAMSINH], [KH_DIACHI], [KH_QUOCTICH], [KH_GIOITINH])
        protected void btnAddRecord_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;

                parameters["KH_MA"].DefaultValue = txtKH_MA.Text;
                parameters["KH_HOTEN"].DefaultValue = txtKH_HOTEN.Text;
                parameters["KH_SDT"].DefaultValue = txtKH_SDT.Text;
                parameters["KH_CMND"].DefaultValue = txtKH_CMND.Text;
                parameters["KH_NAMSINH"].DefaultValue = txtKH_NAMSINH.Text;
                parameters["KH_DIACHI"].DefaultValue = txtKH_DIACHI.Text;
                parameters["KH_QUOCTICH"].DefaultValue = txtKH_QUOCTICH.Text;
                parameters["KH_GIOITINH"].DefaultValue = txtKH_GIOITINH.Text;

                try
                {
                    if (txtKH_MA.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_HOTEN.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_SDT.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_CMND.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_NAMSINH.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_DIACHI.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_QUOCTICH.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_GIOITINH.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }

                    else
                    {
                        SqlDataSource1.Insert();
                        txtKH_MA.Text = "";
                        txtKH_HOTEN.Text = "";
                        txtKH_SDT.Text = "";
                        txtKH_CMND.Text = "";
                        txtKH_NAMSINH.Text = "";
                        txtKH_DIACHI.Text = "";
                        txtKH_QUOCTICH.Text = "";
                        txtKH_GIOITINH.Text = "";


                        StringBuilder sb = new StringBuilder();
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("alert('Record Added Successfully');");
                        sb.Append("$('#addModal').modal('hide');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AddHideModalScript", sb.ToString(), false);

                    }
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Vui lòng kiểm tra lại.');", true);
                }
            }
        }



        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("editRecord"))
            {
                GridViewRow gvrow = GridView1.Rows[index];
                txtKH_MA1.Text = HttpUtility.HtmlDecode(gvrow.Cells[2].Text).ToString();
                txtKH_HOTEN1.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
                txtKH_SDT1.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text).ToString();
                txtKH_CMND1.Text = HttpUtility.HtmlDecode(gvrow.Cells[5].Text).ToString();
                txtKH_NAMSINH1.Text = HttpUtility.HtmlDecode(gvrow.Cells[6].Text).ToString();
                txtKH_DIACHI1.Text = HttpUtility.HtmlDecode(gvrow.Cells[7].Text).ToString();
                txtKH_QUOCTICH1.Text = HttpUtility.HtmlDecode(gvrow.Cells[8].Text).ToString();
                txtKH_GIOITINH1.Text = HttpUtility.HtmlDecode(gvrow.Cells[9].Text).ToString();


                lblResult.Visible = false;
                StringBuilder sb = new StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

            }
            else if (e.CommandName.Equals("deleteRecord"))
            {
                string code = GridView1.DataKeys[index].Value.ToString();
                hfCode.Value = code;
                StringBuilder sb = new StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteModalScript", sb.ToString(), false);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.UpdateParameters;

                //([KH_MA], [KH_HOTEN], [KH_SDT], [KH_CMND], [KH_NAMSINH], [KH_DIACHI], [KH_QUOCTICH], [KH_GIOITINH])
                parameters["KH_MA"].DefaultValue = txtKH_MA1.Text;
                parameters["KH_HOTEN"].DefaultValue = txtKH_HOTEN1.Text;
                parameters["KH_SDT"].DefaultValue = txtKH_SDT1.Text;
                parameters["KH_CMND"].DefaultValue = txtKH_CMND1.Text;
                parameters["KH_NAMSINH"].DefaultValue = txtKH_NAMSINH1.Text;
                parameters["KH_DIACHI"].DefaultValue = txtKH_DIACHI1.Text;
                parameters["KH_QUOCTICH"].DefaultValue = txtKH_QUOCTICH1.Text;
                parameters["KH_GIOITINH"].DefaultValue = txtKH_GIOITINH1.Text;

                try
                {
                    if (txtKH_MA1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_HOTEN1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_SDT1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_CMND1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_NAMSINH1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_DIACHI1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_QUOCTICH1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtKH_GIOITINH1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }

                    else
                    {
                        SqlDataSource1.Update();
                        StringBuilder sb = new StringBuilder();
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("alert('Records Updated Successfully');");
                        sb.Append("$('#editModal').modal('hide');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditHideModalScript", sb.ToString(), false);
                    }
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Vui lòng kiểm tra lại.');", true);
                }
            }

        }

        private void executeDelete(string code)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.DeleteParameters;
                parameters["KH_MA"].DefaultValue = code;

                try
                {
                    SqlDataSource1.Delete();
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Vui lòng kiểm tra lại.');", true);
                }
            }

        }

        //Handles Delete button click in delete modal popup
        protected void btnDelete_Click(object sender, EventArgs e)
        {

            string code = hfCode.Value;
            executeDelete(code);

            StringBuilder sb = new StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("alert('Record deleted Successfully');");
            sb.Append("$('#deleteModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "delHideModalScript", sb.ToString(), false);
        }
        protected void FileBrowser1_Load(object sender, EventArgs e)
        {
            FileBrowser1 = new CKFinder.FileBrowser();
            FileBrowser1.BasePath = "/ckfinder/";
            FileBrowser1.SetupCKEditor(txtKH_DIACHI);
        }

        protected void FileBrowser2_Load(object sender, EventArgs e)
        {
            FileBrowser1 = new CKFinder.FileBrowser();
            FileBrowser1.BasePath = "/ckfinder/";
            FileBrowser1.SetupCKEditor(txtKH_DIACHI);

        }
    }
}