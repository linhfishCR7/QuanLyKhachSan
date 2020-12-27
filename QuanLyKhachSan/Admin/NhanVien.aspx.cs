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
    public partial class NhanVien : System.Web.UI.Page
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



        //([NV_MA], [VTCT_MA], [NV_HOTEN], [NV_NAMSINH], [NV_GIOITINH], [NV_DIACHI], [NV_SDT])
        protected void btnAddRecord_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;

                parameters["NV_MA"].DefaultValue = txtNV_MA.Text;
                parameters["VTCT_MA"].DefaultValue = ddlVTCT_MA.SelectedValue;
                parameters["NV_HOTEN"].DefaultValue = txtNV_HOTEN.Text;
                parameters["NV_NAMSINH"].DefaultValue = txtNV_NAMSINH.Text;
                parameters["NV_GIOITINH"].DefaultValue = txtNV_GIOITINH.Text;
                parameters["NV_DIACHI"].DefaultValue = txtNV_DIACHI.Text;
                parameters["NV_SDT"].DefaultValue = txtNV_SDT.Text;

                try
                {
                    if (txtNV_MA.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtNV_HOTEN.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtNV_NAMSINH.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtNV_GIOITINH.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtNV_DIACHI.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtNV_SDT.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    

                    else
                    {
                        SqlDataSource1.Insert();
                        txtNV_MA.Text = "";
                        txtNV_HOTEN.Text = "";
                        txtNV_NAMSINH.Text = "";
                        txtNV_GIOITINH.Text = "";
                        txtNV_DIACHI.Text = "";
                        txtNV_SDT.Text = "";


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
                txtNV_MA1.Text = HttpUtility.HtmlDecode(gvrow.Cells[2].Text).ToString();
                ddlVTCT_MA1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
                txtNV_HOTEN1.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text).ToString();
                txtNV_NAMSINH1.Text = HttpUtility.HtmlDecode(gvrow.Cells[5].Text).ToString();
                txtNV_GIOITINH1.Text = HttpUtility.HtmlDecode(gvrow.Cells[6].Text).ToString();
                txtNV_DIACHI1.Text = HttpUtility.HtmlDecode(gvrow.Cells[7].Text).ToString();
                txtNV_SDT1.Text = HttpUtility.HtmlDecode(gvrow.Cells[8].Text).ToString();


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

                //([NV_MA], [VTCT_MA], [NV_HOTEN], [NV_NAMSINH], [NV_GIOITINH], [NV_DIACHI], [NV_SDT])
                parameters["NV_MA"].DefaultValue = txtNV_MA1.Text;
                parameters["VTCT_MA"].DefaultValue = ddlVTCT_MA1.SelectedValue;
                parameters["NV_HOTEN"].DefaultValue = txtNV_HOTEN1.Text;
                parameters["NV_NAMSINH"].DefaultValue = txtNV_NAMSINH1.Text;
                parameters["NV_GIOITINH"].DefaultValue = txtNV_GIOITINH1.Text;
                parameters["NV_DIACHI"].DefaultValue = txtNV_DIACHI1.Text;
                parameters["NV_SDT"].DefaultValue = txtNV_SDT1.Text;

                try
                {
                    if (txtNV_MA1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtNV_HOTEN1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtNV_NAMSINH1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtNV_GIOITINH1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtNV_DIACHI1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtNV_SDT1.Text == "")
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
                parameters["NV_MA"].DefaultValue = code;

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
            FileBrowser1.SetupCKEditor(txtNV_DIACHI);
        }

        protected void FileBrowser2_Load(object sender, EventArgs e)
        {
            FileBrowser1 = new CKFinder.FileBrowser();
            FileBrowser1.BasePath = "/ckfinder/";
            FileBrowser1.SetupCKEditor(txtNV_DIACHI);

        }
    }
}