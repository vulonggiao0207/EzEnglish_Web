using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
public partial class hoidap : System.Web.UI.Page
{
    NguoiDungBUS nguoidungBUS = new NguoiDungBUS();
    protected void Page_Load(object sender, EventArgs e)
    {
        ErrorLabel.Visible = false;
    }
    protected void DangKyTxt_Click(object sender, EventArgs e)
    {
        string taikhoan=TaiKhoanTxt.Text;
        string matkhau=MatKhauTxt.Text;
        string email=EmailTxt.Text;
        string sodt= SoDTTxt.Text;
        if (nguoidungBUS.DangKy(taikhoan, matkhau, email, sodt) == true)
        {
            Session["taikhoan"] = taikhoan;
            Session["quyen"] = "User";
            Response.Redirect("index.aspx");
        }
        else
        {
            ErrorLabel.Visible = true;
        }
    }
}