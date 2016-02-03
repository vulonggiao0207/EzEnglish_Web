using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
public partial class MasterPage1 : System.Web.UI.MasterPage
{
    NguoiDungBUS nguoidungBUS = new NguoiDungBUS();
    TinNhanBUS tnBUS = new TinNhanBUS();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["taikhoan"]!=null&&Session["quyen"]!=null)
        {
            string tinnhanmoi = tnBUS.LayDSTinNhan_ChuaDoc(Session["taikhoan"].ToString()).Count.ToString();
            ChaoLink.Text = "Chào " + Session["taikhoan"].ToString()+"! Bạn có "+tinnhanmoi+" tin nhắn mới";
            DangNhapPanel.Visible = false;
            DangXuatPanel.Visible = true;
        }
        else
        {           
            DangNhapPanel.Visible = true;
            DangXuatPanel.Visible = false;
        }
    }
    protected void DangNhapButton_Click(object sender, EventArgs e)
    {
        string taikhoan=TaiKhoanTextBox.Text;
        string matkhau=MatKhauTextBox.Text;
        string quyen=string.Empty;
        bool res = nguoidungBUS.DangNhap(taikhoan, matkhau,ref quyen);
        if (res == true)
        {
            Session["taikhoan"] = taikhoan.Trim();
            Session["quyen"] = quyen.Trim();
            string tinnhanmoi = tnBUS.LayDSTinNhan_ChuaDoc(Session["taikhoan"].ToString()).Count.ToString();
            ChaoLink.Text = "Chào " + Session["taikhoan"].ToString() + "! Bạn có " + tinnhanmoi + " tin nhắn mới";
            DangNhapPanel.Visible = false;
            DangXuatPanel.Visible = true;
        }
        else
        {           
            DangNhapPanel.Visible = true;
            DangXuatPanel.Visible = false;
        }
    }
    protected void DangKyButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("dangky.aspx"); 
    }
    protected void ChaoLink_Click(object sender, EventArgs e)
    {

    }
    protected void TaiKhoanCaNhanLink_Click(object sender, EventArgs e)
    {

    }
    protected void DangXuatLink_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        DangNhapPanel.Visible = true;
        DangXuatPanel.Visible = false;
        Response.Redirect("index.aspx");
    }
}
