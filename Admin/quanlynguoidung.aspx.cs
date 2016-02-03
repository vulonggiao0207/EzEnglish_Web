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
    NguoiDungBUS nguoidungBUS = new NguoiDungBUS();
    public static NguoiDungCollection nguoidungColl;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["taikhoan"] == null || Session["quyen"].ToString() != "Admin")
        {
            Response.Redirect("dangnhap.aspx");
        }
        if(!IsPostBack)
        {
            LoadDSNguoiDung();         
        }
    }
    public void LoadDSNguoiDung()
    {
        nguoidungColl = new NguoiDungCollection();
        nguoidungColl = nguoidungBUS.LayToanBoNguoiDung(TimTenTextBox.Text);
        NguoiDungGridView.DataSource = nguoidungColl;
        NguoiDungGridView.DataBind();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("quantri.aspx");
    }
    protected void TimTenButton_Click(object sender, EventArgs e)
    {
        LoadDSNguoiDung();  
    }

    protected void BannedButton_Command(object sender, CommandEventArgs e)
    {
        string taikhoan = e.CommandArgument.ToString();
        bool banned=Convert.ToBoolean(e.CommandName);
        bool res = nguoidungBUS.Bannednick(taikhoan, banned);
        if(res==true)
        {
            LoadDSNguoiDung();  
        }
    }
    protected void NguoiDungGridView_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button btn = new Button();
            btn =(Button) e.Row.FindControl("BannedButton");
            btn.CommandArgument = nguoidungColl.Index(e.Row.RowIndex).TaiKhoan;
            btn.CommandName = nguoidungColl.Index(e.Row.RowIndex).Banned.ToString();
            if (btn.CommandName == "True")
            {
                btn.BackColor = System.Drawing.Color.Red;            
                btn.CommandName = "False";
                btn.Text="Unbanned";
            }
            else
            {
                btn.BackColor = System.Drawing.Color.LightGreen;
                btn.CommandName = "True";
                btn.Text = "Banned";
            }
        }
    }
}