using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
using BO;
public partial class thongtincanhan : System.Web.UI.Page
{
    NguoiDungBUS nguoidungBUS = new NguoiDungBUS();
    public void LoadThongTinNguoiDung()
    {
        NguoiDungBO ndBO = new NguoiDungBO();
        ndBO = nguoidungBUS.TTNguoiDung(Session["taikhoan"].ToString());
        TaiKhoanLabel.Text = ndBO.TaiKhoan;
        EmailLabel.Text = ndBO.Email;
        SoDienThoaiLabel.Text = ndBO.DT;   
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["taikhoan"] == null)
            Response.Redirect("index.aspx");
        else
        {
            LoadThongTinNguoiDung();                    
        }
    }
    protected void DoiMatKhauButton_Click(object sender, EventArgs e)
    {
        string taikhoan=Session["taikhoan"].ToString();
        string matkhaucu = MatKhauTextBox.Text;
        string matkhau=MatKhauMoiTextBox.Text;
        //Kiem tra matkhau    
        string quyen = "";
        if (nguoidungBUS.DangNhap(taikhoan, matkhaucu,ref quyen) == false)
        {
            CustomValidator1.IsValid = false;
            ThanhCongLabel1.Visible = false;
        }
        else
        {
            CustomValidator1.IsValid = true;
            bool res = nguoidungBUS.Doi_TT_NguoiDung(taikhoan, matkhau, "", "", "");
            if (res == true)
            {
                LoadThongTinNguoiDung();
                ThanhCongLabel1.Visible = true;                
            }
        }
      
    }
    protected void DoiEmailButton_Click(object sender, EventArgs e)
    {
        string taikhoan = Session["taikhoan"].ToString();
        string email = EmailMoiTextBox.Text;
        bool res = nguoidungBUS.Doi_TT_NguoiDung(taikhoan, "",email, "", "");
        if (res == true)
        {
            ThanhCongLabel2.Visible = true;
            EmailMoiTextBox.Text = "";
            LoadThongTinNguoiDung();
        }
        else
            ThanhCongLabel2.Visible = false;
    }
    protected void DoiSoDTlButton_Click(object sender, EventArgs e)
    {
        string taikhoan = Session["taikhoan"].ToString();
        string dt = SoDTMoiTextBox.Text;
        bool res = nguoidungBUS.Doi_TT_NguoiDung(taikhoan, "", "",dt, "");
        if (res == true)
        {
            ThanhCongLabel3.Visible = true;
            SoDTMoiTextBox.Text = "";
            LoadThongTinNguoiDung();
        }
        else
            ThanhCongLabel3.Visible = false;
    }   
}