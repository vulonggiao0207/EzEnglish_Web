using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
using BO;
public partial class tratu : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["taikhoan"] == null || Session["quyen"].ToString() != "Admin")
        {
            Response.Redirect("dangnhap.aspx");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("dangnhap.aspx");
    }
}