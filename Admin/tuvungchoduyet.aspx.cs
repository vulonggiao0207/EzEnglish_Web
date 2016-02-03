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
    TuVungBUS tuvungBUS = new TuVungBUS();
    TinNhanBUS tinnhanBUS = new TinNhanBUS();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["taikhoan"] == null || Session["quyen"].ToString() !="Admin")
        {
            Response.Redirect("dangnhap.aspx");
        }
        if (!IsPostBack)
        {
            LoadDSTuVungChoDuyet();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("dangnhap.aspx");
    }

    #region Hàm Load chi tiết từ vựng
    public void LoadchitietTuVung(string tuvungID)
    {
        if (tuvungID == "")
        {
            TuTextBox.Text = "";
            TuDienDropDown1.SelectedIndex = 0;
            LoaiTuDropDown.SelectedIndex = 0;
            NghiaTuTextBox.Text = "";
            HinhAnhImage.ImageUrl = "~/images/no_image.jpg";
            ViDuTextBox.Text = "";
            NguoiDangLabel.Text = "";
        }
        else
        {
            //   ViewState["tuvungID"] = tuvungID;
            TuVungBO tvBO = new TuVungBO();
            tvBO = tuvungBUS.Lay_ChiTiet_TuVung(tuvungID);
            TuTextBox.Text = tvBO.TuVung;
            TuDienDropDown1.SelectedValue = tvBO.TuDienID.ToString();
            LoaiTuDropDown.SelectedValue = tvBO.LoaiTuID.ToString();
            NghiaTuTextBox.Text = tvBO.NghiaTu;
            //Load hình ảnh
            if (tvBO.HinhAnh != "")
                HinhAnhImage.ImageUrl = tvBO.HinhAnh;
            else
                HinhAnhImage.ImageUrl = "~/images/no_image.jpg";
            ViDuTextBox.Text = tvBO.ViDu;
            NguoiDangLabel.Text = tvBO.TaiKhoan;
        }
    }

    #endregion
    public void LoadDSTuVungChoDuyet()
    {
        TuVungCollection tuvungColl = new TuVungCollection();
        tuvungColl = tuvungBUS.LayDSTuVungChoDuyet(TimTuTextBox.Text);
        TuVungListBox.DataSource = tuvungColl;
        TuVungListBox.DataTextField = "TuVung";
        TuVungListBox.DataValueField = "TuVungID";
        TuVungListBox.DataBind();
    }
    protected void TuVungListBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        //reset all
        TuTextBox.Text = "";
        NghiaTuTextBox.Text = "";
        ViDuTextBox.Text = "";
        HinhAnhImage.ImageUrl = "~/images/no_image.jpg";
        NguoiDangLabel.Text = "";
        //nạp lại
        string tuvungID = "";
        if (TuVungListBox.Items.Count != 0 && TuVungListBox.SelectedItem != null)
        {
            tuvungID = TuVungListBox.SelectedValue;
        }
        if (tuvungID != "")
            LoadchitietTuVung(tuvungID);     
    }
    protected void TimButton_Click(object sender, EventArgs e)
    {
        LoadDSTuVungChoDuyet();
    }
    protected void DongYButton_Click(object sender, EventArgs e)
    {
        if (TuVungListBox.Items.Count != 0 && TuVungListBox.SelectedItem != null)
        {
            bool res=tuvungBUS.DuyetTuVung(TuVungListBox.SelectedValue);
            if (res == true)
            {
                LoadDSTuVungChoDuyet();
                string noidung = "Từ vựng: " + TuTextBox.Text + "; Nghĩa từ: " + NghiaTuTextBox.Text + "; Loại từ: " + LoaiTuDropDown.SelectedItem.Text + " đã đựơc đồng ý vào từ điển cộng đồng";
                tinnhanBUS.ThemTinNhan(Session["taikhoan"].ToString(),NguoiDangLabel.Text,noidung);
            }
        }
    }
    protected void TuChoiButton_Click(object sender, EventArgs e)
    {
        if (TuVungListBox.Items.Count != 0 && TuVungListBox.SelectedItem != null)
        {
            bool res = tuvungBUS.XoaTuVung(TuVungListBox.SelectedValue);
            if (res == true)
            {
                LoadDSTuVungChoDuyet();
                string noidung = "Từ vựng: " + TuTextBox.Text + "; Nghĩa từ: " + NghiaTuTextBox.Text + "; Loại từ: " + LoaiTuDropDown.SelectedItem.Text + " không đựơc đồng ý vào từ điển cộng đồng";
                tinnhanBUS.ThemTinNhan(Session["taikhoan"].ToString(),NguoiDangLabel.Text,noidung);
            }

        }
    }
}