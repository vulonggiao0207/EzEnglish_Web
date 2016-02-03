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
    protected void DangNhapButton_Click(object sender, EventArgs e)
    {
        string taikhoan=TaiKhoanTextBox.Text;
        string matkhau = MatKhauTextbox.Text;
        string quyen="";
        bool res=nguoidungBUS.DangNhap(taikhoan,matkhau,ref quyen);
        if (quyen.Trim() != "Admin" || res == false)
        {
            ThongBaoLabel.Visible = true;
        }
        else
        {
            ThongBaoLabel.Visible = false;
            Session["taikhoan"] = taikhoan;
            Session["quyen"]=quyen.Trim();
            Response.Redirect("quantri.aspx");
        }
    }
}