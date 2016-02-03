using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
using BO;
public partial class quanlytudien : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["taikhoan"] == null)
            Response.Redirect("index.aspx");
        else{
            if (!IsPostBack)
            {
                string taikhoan = Session["taikhoan"].ToString();
                LoadDSTuDien(taikhoan);
                LoadBanBe(taikhoan);
            }
        }

    }
    TuDienBUS tudienBUS = new TuDienBUS();
    NguoiDungBUS nguoidungBUS = new NguoiDungBUS();
    BanBeBUS banbeBUS = new BanBeBUS();
    #region Sử lý Từ điển		
    //Hàm load lại danh sách từ điển
    void LoadDSTuDien(string taikhoan)
    {
        TuDienList.DataSource = tudienBUS.LayDSTuDien(taikhoan);       
        TuDienList.DataTextField = "TenTuDien";
        TuDienList.DataValueField = "TuDienID";
        TuDienList.DataBind();
    }
    //Thêm từ điển
    protected void ThemTuDienButton1_Click(object sender, EventArgs e)
    {
        //Kiểm tra từ điển có trùng hay không
        for (int i = 0; i < TuDienList.Items.Count; i++)
        {
            if (TenTuDienMoiTextBox.Text == TuDienList.Items.ToString())
            {
                KhongTheThemLabel.Visible = true;
                ModalPopupExtender1.Show();
                break;// Nếu trùng thì dừng lại ngay
            }
        }
        //Tiến hành thêm từ điển
         string taikhoan = Session["taikhoan"].ToString();
         bool res = tudienBUS.ThemTuDien(taikhoan, TenTuDienMoiTextBox.Text, false);
         if (res == true) //nếu thêm đựơc
         {
             KhongTheThemLabel.Visible = false;
             LoadDSTuDien(taikhoan);
         }
         else//nếu không thêm đựơc -->thông báo
         {
             KhongTheThemLabel.Visible = true;
             ModalPopupExtender1.Show();
         }

    }
    //Xóa từ điển
    protected void XoaTuDienButton_Click(object sender, EventArgs e)
    {
        if (TuDienList.SelectedItem != null)
        {
            bool res=tudienBUS.XoaTuDien(TuDienList.SelectedValue);
            if (res == true)
            {
                string taikhoan = Session["taikhoan"].ToString();
                LoadDSTuDien(taikhoan);
                if (TuDienList.Items.Count != 0)//nếu số từ điển > 0
                {
                    //thực hiện load lại ds ngừơi dùng 
                    TuDienList.SelectedIndex = 0;
                    string tudienid = TuDienList.SelectedValue;
                    LoadDSNguoiDung(tudienid);     
                }
            }
            else
            {
                Response.Write("<scrip>alert('Không thể xóa từ điển đựơc!')</script>");
            }
        }
    }
    //Sửa từ điển
    protected void SuaTuDienButton1_Click(object sender, EventArgs e)
    {
        if (TuDienList.SelectedItem != null)
        {
            string taikhoan = Session["taikhoan"].ToString();
            bool res = tudienBUS.SuaTuDien(TuDienList.SelectedValue, taikhoan, TenTuDienSuaTextBox.Text, false);
            if (res == true)
            {
                LoadDSTuDien(taikhoan);
                KhongTheSuaLabel.Visible = false;
            }
            else
            {
                ModalPopupExtender2.Show();
                KhongTheSuaLabel.Visible = true;
            }
        }
    }
    protected void TuDienList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (TuDienList.SelectedItem != null)
        {
            string tudienid = TuDienList.SelectedValue;
            LoadDSNguoiDung(tudienid);
        }
        else
        {
            NguoisudungList.Items.Clear();
            QuyenPanel.Visible = false;
        }
        if(NguoisudungList.Items.Count==0)
            QuyenPanel.Visible = false;
        if(NguoisudungList.SelectedItem==null)
            QuyenPanel.Visible = false;

    } 
	#endregion

    #region Sử lý ngừơi sử dụng

    //Hàm Load ds người dùng
    public void LoadDSNguoiDung(string tudienid)
    {
        NguoisudungList.DataSource = nguoidungBUS.LayDSNguoiDung_TuDien(tudienid);
        NguoisudungList.DataTextField = "taikhoan";
        NguoisudungList.DataValueField = "taikhoan";
        NguoisudungList.DataBind();
    }

    //Thêm ngừơi sử dụng vào từ điển
    protected void ThemNguoiDungButton1_Click(object sender, EventArgs e)
    {
        if (TuDienList.SelectedItem != null)
        {
            string taikhoan = TenNguoiDungMoiTextBox.Text;
            string tudienid = TuDienList.SelectedValue;
            //Kiểm tra từ điển có trùng hay không
            for (int i = 0; i < NguoiDungListBox.Items.Count; i++)
            {
                if (taikhoan == NguoiDungListBox.Items.ToString())
                {
                    KhongTheThemLabel1.Visible = true;
                    ModalPopupExtender3.Show();
                    break;// Nếu trùng thì dừng lại ngay
                }
            }
            //Tiến hành thêm người dùng vào từ điển
            bool res = tudienBUS.ThemNguoidung_TuDien(tudienid, taikhoan);
            if (res == true) //nếu thêm đựơc
            {
                KhongTheThemLabel1.Visible = false;
                LoadDSNguoiDung(tudienid);
            }
            else//nếu không thêm đựơc -->thông báo
            {
                KhongTheThemLabel1.Visible = true;
                ModalPopupExtender3.Show();
            }
        }

    }

    //Xóa người sử dụng khỏi từ điển
    protected void XoaNguoiSuDungButton_Click(object sender, EventArgs e)
    {
        if (NguoisudungList.SelectedItem != null)
        {
            bool res = nguoidungBUS.XoaNguoiDung_TuDien(TuDienList.SelectedValue, NguoisudungList.SelectedValue);
            if (res == true)
            {
                string tudienid = TuDienList.SelectedValue;
                LoadDSNguoiDung(tudienid);
                if (NguoisudungList.Items.Count != 0)
                {
                    NguoisudungList.SelectedIndex = 0;
                    LoadQuyenSuDung(tudienid, NguoisudungList.SelectedValue);
                }
                else
                {
                    QuyenPanel.Visible = false;
                }   
            }
            else
            {
                Response.Write("<scrip>alert('Không thể xóa ngừơi dùng đựơc!')</script>");
            }
        }
    }
    protected void NguoisudungList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (NguoisudungList.SelectedItem != null)
        {
            QuyenPanel.Visible = true;
            //hiển thị quyền của [người dùng] với [từ điển]
            LoadQuyenSuDung(TuDienList.SelectedValue, NguoisudungList.SelectedValue);
        }
        else
        {
            QuyenPanel.Visible = false;
        }
    } 
    #endregion
    //Load quyền sử dụng
    void LoadQuyenSuDung(string tudienID, string taikhoan)
    {
        TuDienBO tudienBO = new TuDienBO();
        tudienBO = tudienBUS.Lay_NguoiDung_Quyen(tudienID, taikhoan);
        if (tudienBO != null)
        {
            XemCheckBox.Checked = tudienBO.Xem;
            ThemCheckBox.Checked = tudienBO.Them;
            XoaCheckBox.Checked = tudienBO.Xoa;
            SuaCheckBox.Checked = tudienBO.Sua;
        }
    }
    void LoadBanBe(string taikhoan)
    {
        NguoiDungListBox.DataSource = banbeBUS.LayDSBanBe(taikhoan);
        NguoiDungListBox.DataValueField = "TaiKhoanBan";
        NguoiDungListBox.DataTextField = "TaiKhoanBan";
        NguoiDungListBox.DataBind();
    }
    void CapNhatQuyen(string tudienID, string taikhoan)
    {
        bool xem = XemCheckBox.Checked;
        bool them = ThemCheckBox.Checked;
        bool xoa = XoaCheckBox.Checked;
        bool sua = SuaCheckBox.Checked;
        bool res = tudienBUS.Sua_NguoiDung_Quyen(tudienID, taikhoan, xem, them, xoa, sua);
        if (res != true)
        {
            Response.Write("<scrip>alert('Không thể cập nhật quyền sử dụng đựơc!')</script>");
        }
        LoadQuyenSuDung(TuDienList.SelectedValue, NguoisudungList.SelectedValue);
    }
    protected void XemCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        CapNhatQuyen(TuDienList.SelectedValue, NguoisudungList.SelectedValue);
    }
    protected void ThemCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        CapNhatQuyen(TuDienList.SelectedValue, NguoisudungList.SelectedValue);
    }
    protected void XoaCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        CapNhatQuyen(TuDienList.SelectedValue, NguoisudungList.SelectedValue);
    }
    protected void SuaCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        CapNhatQuyen(TuDienList.SelectedValue, NguoisudungList.SelectedValue);
    }
}