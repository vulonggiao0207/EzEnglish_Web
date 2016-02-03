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
    TuVungBUS tuvungBUS = new TuVungBUS();


 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["taikhoan"] == null || Session["quyen"].ToString() != "Admin")
        {
            Response.Redirect("dangnhap.aspx");
        }
    }
    protected void DoiMatKhauButton_Click(object sender, EventArgs e)
    {
        bool res = nguoidungBUS.DoiMatKhau(Session["taikhoan"].ToString(), MatKhauTextBox.Text, MatkhauMoiTextBox.Text);
        if (res == true)
        {
            ThongBaoLabel.Text = "Đổi mật khẩu thành công";
        }
        else
        {
            ThongBaoLabel.Text = "Mật khẩu sai! Mời nhập lại";
        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("dangnhap.aspx");
    }
}