using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
public partial class dangcauhoi : System.Web.UI.Page
{
    CauHoiBUS ccBUS = new CauHoiBUS();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["taikhoan"] == null)
            Response.Redirect("index.aspx");
    }
    protected void DangBaiButton_Click(object sender, EventArgs e)
    {
        if (Session["taikhoan"] != null)
        {
            string taikhoan = Session["taikhoan"].ToString();
            string tieude = TieudeTextBox.Text;
            string noidung = NoiDungTextBox.Text;
            bool res = ccBUS.ThemCauHoi(taikhoan, tieude, noidung);
            if (res == true)
            {
                Response.Redirect("hoidap.aspx");
            }
            else
            {
                Response.Write("<script language='JavaScript'> alert('Lỗi! Không thể đăng câu hỏi mới đựơc, bạn hãy thử lại sau!'); </script>");
            }
        }
    }
}