﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyKhachSan.Admin.auth
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["LoginOK1"] = false;
            //Session.RemoveAll();
        }
        //protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
        //{
        //    string sqlConnectionString = ConfigurationManager.ConnectionStrings["QLKSConnection"].ConnectionString;
        //    SqlConnection connection = new SqlConnection(sqlConnectionString);
        //    connection.Open();
        //    // Lay thong tin dang nhap
        //    string user = Login1.UserName;
        //    string password = Login1.Password;

        //    SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM user WHERE email=@Email AND password=@Password", connection);
        //    da.SelectCommand.Parameters.AddWithValue("email", user);
        //    da.SelectCommand.Parameters.AddWithValue("password", password);

        //    DataTable t = new DataTable();
        //    da.Fill(t);
        //    e.Authenticated = t.Rows.Count > 0;

        //    Session["LoginOK1"] = e.Authenticated;
        //    if (e.Authenticated)
        //    {
        //        // Set Level cho Session Level

        //        Session["Email"] = t.Rows[0]["Email"].ToString();
        //        Response.Redirect("../Admin/Users");
        //    }
        //    else
        //        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Vui lòng kiểm tra Tài Khoản, Mật Khẩu!');", true);
        //}

    }
}