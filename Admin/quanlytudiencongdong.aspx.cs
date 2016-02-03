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
    TuDienBUS tudienBUS = new TuDienBUS();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["taikhoan"] == null || Session["quyen"].ToString() != "Admin")
        {
            Response.Redirect("dangnhap.aspx");
        }
        if (!IsPostBack)
        {
            LoadTuDienList();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("dangnhap.aspx");
    }
    public void LoadTuDienList()
    {
        TuDienCollection tudienColl = new TuDienCollection();
        tudienColl = tudienBUS.LayDSTuDien_CongDong(TimTuDienTextBox.Text);
        TuDienList.DataSource = tudienColl;
        TuDienList.DataValueField = "TuDienID";
        TuDienList.DataTextField = "TenTuDien";
        TuDienList.DataBind();
    }
    protected void TimButton_Click(object sender, EventArgs e)
    {
        LoadTuDienList();
    }

    protected void ThemTuDienButton1_Click(object sender, EventArgs e)
    {
        //Kiểm tra từ điển có trùng hay không
        for (int i = 0; i < TuDienList.Items.Count; i++)
        {
            if (TenTuDienMoiTextBox.Text == TuDienList.Items.ToString())
            {
                KhongTheThemLabel.Visible = true;
                ModalPopupExtender2.Show();
                break;// Nếu trùng thì dừng lại ngay
            }
        }
        //Tiến hành thêm từ điển
        string taikhoan = Session["taikhoan"].ToString();
        bool res = tudienBUS.ThemTuDien(taikhoan, TenTuDienMoiTextBox.Text, true);
        if (res == true) //nếu thêm đựơc
        {
            KhongTheThemLabel.Visible = false;
            LoadTuDienList();
        }
        else//nếu không thêm đựơc -->thông báo
        {
            KhongTheThemLabel.Visible = true;
            ModalPopupExtender2.Show();
        }
    }
    protected void SuaTuDienButton1_Click(object sender, EventArgs e)
    {
        if (TuDienList.SelectedItem != null)
        {
            string taikhoan = Session["taikhoan"].ToString();
            bool res = tudienBUS.SuaTuDien(TuDienList.SelectedValue, taikhoan, TenTuDienSuaTextBox.Text, true);
            if (res == true)
            {
                LoadTuDienList();
                KhongTheSuaLabel.Visible = false;
            }
            else
            {
                ModalPopupExtender2.Show();
                KhongTheSuaLabel.Visible = true;
            }
        }
    }
    protected void XoaButton_Click(object sender, EventArgs e)
    {
        if (TuDienList.SelectedItem != null)
        {
            bool res = tudienBUS.XoaTuDien(TuDienList.SelectedValue);
            if (res == true)
            {
                string taikhoan = Session["taikhoan"].ToString();
                LoadTuDienList();
                if (TuDienList.Items.Count != 0)//nếu số từ điển > 0
                {
                    //thực hiện load lại ds ngừơi dùng 
                    TuDienList.SelectedIndex = 0;
                    string tudienid = TuDienList.SelectedValue;
                   
                }
            }
            else
            {
                Response.Write("<scrip>alert('Không thể xóa từ điển đựơc!')</script>");
            }
        }
    }
    protected void SuaButton_Click(object sender, EventArgs e)
    {

    }
}