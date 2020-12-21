﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyKhachSan.Admin
{
    public partial class ViTriCongTac : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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



        //([VTCT_MA], [VTCT_TEN], [VTCT_DONGIALUONG])
        protected void btnAddRecord_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;

                parameters["VTCT_MA"].DefaultValue = txtVTCT_MA.Text;
                parameters["VTCT_TEN"].DefaultValue = txtVTCT_TEN.Text;
                parameters["VTCT_DONGIALUONG"].DefaultValue = txtVTCT_DONGIALUONG.Text;
                try
                {
                    if (txtVTCT_MA.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtVTCT_TEN.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtVTCT_DONGIALUONG.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }

                    else
                    {
                        SqlDataSource1.Insert();
                        txtVTCT_MA.Text = "";
                        txtVTCT_TEN.Text = "";
                        txtVTCT_DONGIALUONG.Text = "";


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
                txtVTCT_MA1.Text = HttpUtility.HtmlDecode(gvrow.Cells[2].Text).ToString();
                txtVTCT_TEN1.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
                txtVTCT_DONGIALUONG1.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text).ToString();
                


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

                //([VTCT_MA], [VTCT_TEN], [VTCT_DONGIALUONG])
                parameters["VTCT_MA"].DefaultValue = txtVTCT_MA1.Text;
                parameters["VTCT_TEN"].DefaultValue = txtVTCT_TEN1.Text;
                parameters["VTCT_DONGIALUONG"].DefaultValue = txtVTCT_DONGIALUONG1.Text;
                

                try
                {
                    if (txtVTCT_MA1.Text == "")
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Các trường (*) không được bỏ trống.');", true);
                    }
                    else if (txtVTCT_TEN1.Text == "")
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
                parameters["VTCT_MA"].DefaultValue = code;

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
    }
}