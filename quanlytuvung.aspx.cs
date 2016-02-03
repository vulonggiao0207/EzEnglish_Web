﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
using BO;
public partial class quanlytuvung : System.Web.UI.Page
{
    TuVungBUS tuvungBUS = new TuVungBUS();
    TuDienBUS tudienBUS = new TuDienBUS();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["taikhoan"] == null)
            Response.Redirect("index.aspx");
        if (!IsPostBack)
        {
            LoadTuDien();
            if (TuDienDropDown.Items.Count != 0)
            {
                TuDienDropDown.SelectedIndex = 0;
                ThemTuDienTextBox.Text = TuDienDropDown.Items[0].ToString();
                //nạp danh sách từ vựng
                TuVungListBox.Items.Clear();
                LoadTuVung(TimTuTextBox.Text, Session["taikhoan"].ToString(), Convert.ToInt32(LoaiTuDienDropDown.SelectedValue));
            }
        }
      
    }
    #region Hàm Load Từ vựng
    public void LoadTuVung(string tuvung, string taikhoan,int loai)
    {
        TuVungCollection tuvungColl= new TuVungCollection();
        string tudienID = TuDienDropDown.SelectedValue;
        if (loai == 1) tuvungColl = tuvungBUS.LayDSTuVung_CaNhan(tuvung, taikhoan,tudienID);
        if (loai == 2) tuvungColl = tuvungBUS.LayDSTuVung_LienKet(tuvung, taikhoan, tudienID);
        if (loai == 3) tuvungColl = tuvungBUS.LayDSTuVung_CongDong(tuvung, tudienID);
        TuVungListBox.DataSource = tuvungColl;
        TuVungListBox.DataTextField = "TuVung";
        TuVungListBox.DataValueField = "TuVungID";
        TuVungListBox.DataBind();
    }
    #endregion

    #region Hàm Load từ điển
    public void LoadTuDien()
    {
        string taikhoan = Session["taikhoan"].ToString();
        if (Convert.ToInt32(LoaiTuDienDropDown.SelectedValue) == 1)
        {
            TuDienDropDown.DataSource = tudienBUS.LayDSTuDien(taikhoan);
            TuDienDropDown1.DataSource = tudienBUS.LayDSTuDien(taikhoan);
        }
        else if (Convert.ToInt32(LoaiTuDienDropDown.SelectedValue) == 2)
        {
            TuDienDropDown.DataSource = tudienBUS.LayDSTuDien_LienKet(taikhoan);
            TuDienDropDown1.DataSource = tudienBUS.LayDSTuDien_LienKet(taikhoan);
        }
        else if (Convert.ToInt32(LoaiTuDienDropDown.SelectedValue) == 3)
        {
            TuDienDropDown.DataSource = tudienBUS.LayDSTuDien_CongDong("");
            TuDienDropDown1.DataSource = tudienBUS.LayDSTuDien_CongDong("");
        }

        TuDienDropDown.DataTextField = "TenTuDien";
        TuDienDropDown.DataValueField = "TuDienID";
        TuDienDropDown.DataBind();

        TuDienDropDown1.DataTextField = "TenTuDien";
        TuDienDropDown1.DataValueField = "TuDienID";
        TuDienDropDown1.DataBind(); 


    }
    #endregion

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
    protected void LoaiTuDienDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        TuVungListBox.Items.Clear();
        TuDienDropDown.Items.Clear();
        LoadTuDien();
        if (TuDienDropDown.Items.Count == 0)
            TuVungListBox.Items.Clear();
        if (TuDienDropDown.Items.Count != 0)
        {
            LoadTuVung(TimTuTextBox.Text, Session["taikhoan"].ToString(), Convert.ToInt32(LoaiTuDienDropDown.SelectedValue));
            ThemTuDienTextBox.Text = TuDienDropDown.SelectedItem.ToString();
            TuDienDropDown.SelectedIndex = 0;
        }
        //    LoadTuVung(TimTuTextBox.Text, Session["taikhoan"].ToString(), Convert.ToInt32(TuDienDropDown.Items[0].Value));
        if (Session["quyen"].ToString().Trim() == "User" && LoaiTuDienDropDown.SelectedValue == "3")
        {
            XoaButton.Visible = false;
            ChinhSuaCheckBox.Visible = false;
            enableControls(false);
        }
        else
        {
            ChinhSuaCheckBox.Visible = true;
            XoaButton.Visible = true;
        }
       //reset all
        TuTextBox.Text = "";
        NghiaTuTextBox.Text = "";
        ViDuTextBox.Text = "";
        HinhAnhImage.ImageUrl = "~/images/no_image.jpg";
        NguoiDangLabel.Text = "";
        
        
    }
    protected void TuDienDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        TuVungListBox.Items.Clear();
        LoadTuVung(TimTuTextBox.Text, Session["taikhoan"].ToString(), Convert.ToInt32(LoaiTuDienDropDown.SelectedValue));
        ThemTuDienTextBox.Text = TuDienDropDown.SelectedItem.ToString();
        //nạp danh sách từ vựng
        TuVungListBox.Items.Clear();
        if(TuDienDropDown.Items.Count!=0)     
            LoadTuVung(TimTuTextBox.Text, Session["taikhoan"].ToString(), Convert.ToInt32(LoaiTuDienDropDown.SelectedValue));
        
        //reset all
        TuTextBox.Text = "";
        NghiaTuTextBox.Text = "";
        ViDuTextBox.Text = "";
        HinhAnhImage.ImageUrl = "~/images/no_image.jpg";
        NguoiDangLabel.Text = "";
           
    }
    protected void TìmButton_Click(object sender, EventArgs e)
    {
        TuVungListBox.Items.Clear();
        LoadTuVung(TimTuTextBox.Text, Session["taikhoan"].ToString(), Convert.ToInt32(LoaiTuDienDropDown.SelectedValue));
        ThemTuDienTextBox.Text = TuDienDropDown.SelectedItem.ToString();
        //nạp danh sách từ vựng
        TuVungListBox.Items.Clear();
        if (TuDienDropDown.Items.Count != 0)
            LoadTuVung(TimTuTextBox.Text, Session["taikhoan"].ToString(), Convert.ToInt32(LoaiTuDienDropDown.SelectedValue));
        LoadchitietTuVung("");
    }
  
    #region THÊM từ vựng vào từ điển
    public string GetFileName(string Image)
    {
        try
        {
            string duongdan = Server.MapPath("tuvung_images\\");
            string tenfile = Image;
            if (System.IO.Path.GetFileName(tenfile).ToString() != "")
            {
                while (System.IO.File.Exists(duongdan + tenfile) == true)
                    tenfile = tenfile.Split('.')[0] + "1" + "." + tenfile.ToString().Split('.')[1];
            }
            return tenfile;
        }
        catch
        {
            return string.Empty;
        }
    }
    protected void ThemHinhanhFileUpLoad_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        if (ThemHinhanhFileUpLoad.HasFile == true)
            Session["hinhanh"] = ThemHinhanhFileUpLoad;
    }
    protected void ThemTuButton_Click(object sender, EventArgs e)
    {
        //Save Image to DATABASE   
        if(Session["hinhanh"]!=null)
        {
            ThemHinhanhFileUpLoad = (AjaxControlToolkit.AsyncFileUpload)Session["hinhanh"];
            Session["hinhanh"] = null;
        }
        bool hasimage = true;
        string imagefile;
        if (ThemHinhanhFileUpLoad.PostedFile != null && ThemHinhanhFileUpLoad.PostedFile.FileName != "")
            imagefile = "~/tuvung_images/" + GetFileName(ThemHinhanhFileUpLoad.PostedFile.FileName);
        else
        {
            imagefile = "";
            hasimage = false;
        }  
        string tuvung = ThemTuVungTextBox.Text;
        int loaituid = Convert.ToInt32(ThemLoaiTuDropDown.SelectedValue);
        string nghiatu = ThemNghiaTuTextBox.Text;
        string hinhanh = imagefile;
        string vidu = ThemViDuTextBox.Text;
        string taikhoan = Session["taikhoan"].ToString();
        string tudienid = TuDienDropDown.SelectedValue;
        int loai = Convert.ToInt32(LoaiTuDienDropDown.SelectedValue);
        bool res =tuvungBUS.ThemTuVung(loaituid, tuvung, nghiatu, hinhanh, vidu, taikhoan, 0, 0, tudienid,false, loai);
        if(res==true)
        {
            //Save Image to DIRECTORY
            if (hasimage == true)
                ThemHinhanhFileUpLoad.SaveAs(Server.MapPath("tuvung_images\\") + System.IO.Path.GetFileName(imagefile));
            //nạp lại danh sách từ vựng
            TuVungListBox.Items.Clear();
            LoadTuVung(TimTuTextBox.Text, taikhoan,Convert.ToInt32(LoaiTuDienDropDown.SelectedValue));
        }
    }
    #endregion

    #region XÓA từ vựng
    protected void XoaButton_Click(object sender, EventArgs e)
    {
        if (TuVungListBox.Items.Count != 0 && TuVungListBox.SelectedItem != null)
        {
            tuvungBUS.XoaTuVung(TuVungListBox.SelectedValue);
            //nạp lại danh sách từ vựng
            TuVungListBox.Items.Clear();
            LoadTuVung(TimTuTextBox.Text, Session["taikhoan"].ToString(), Convert.ToInt32(LoaiTuDienDropDown.SelectedValue));
            string imagefile = HinhAnhImage.ImageUrl;
            if (System.IO.File.Exists(Server.MapPath(imagefile)))//if exist
                System.IO.File.Delete(Server.MapPath(imagefile));//delete it
            if (TuVungListBox.Items.Count == 0)
                LoadchitietTuVung("");
        }
    }
    #endregion

    #region CHỈNH SỬA từ vựng    

    #region Hàm Enable - Disable các control hiển thị từ vựng
    public void enableControls(bool value)
    {
        if (value==true)
        {
            TuTextBox.Enabled = true;
            NghiaTuTextBox.Enabled = true;
            TuDienDropDown1.Enabled = true;
            LoaiTuDropDown.Enabled = true;
            HinhAnhImage.Visible = false;
            HinhanhFileUpLoad.Visible = true;
            ViDuTextBox.Enabled = true;
            LuuButton.Enabled = true;
        }
        else
        {
            TuTextBox.Enabled = false;
            NghiaTuTextBox.Enabled = false;
            TuDienDropDown1.Enabled = false;
            LoaiTuDropDown.Enabled = false;
            HinhAnhImage.Visible = true;
            HinhanhFileUpLoad.Visible = false;
            ViDuTextBox.Enabled = false;
            LuuButton.Enabled = false;
        }
    }

    #endregion
    protected void ChinhSuaCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        if (ChinhSuaCheckBox.Checked == true)
            enableControls(true);
        else
            enableControls(false);     
    }
    protected void TuVungListBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        string tuvungID = "";
        if (TuVungListBox.Items.Count != 0 && TuVungListBox.SelectedItem != null)
        {
            tuvungID = TuVungListBox.SelectedValue;
        }
        if(tuvungID!="")
            LoadchitietTuVung(tuvungID);
        //disable các control
        ChinhSuaCheckBox.Checked = false;
        enableControls(false);
    }
    protected void HinhanhFileUpLoad_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        if (HinhanhFileUpLoad.HasFile == true)
            Session["HinhAnhUp"] = HinhanhFileUpLoad;
    }
    protected void LuuButton_Click(object sender, EventArgs e)
    {
        //Save Image to DATABASE   
        if (Session["HinhAnhUp"] != null)
        {
            HinhanhFileUpLoad = (AjaxControlToolkit.AsyncFileUpload)Session["HinhAnhUp"];
            Session["HinhAnhUp"] = null;
        }
        bool hasimage = true;
        string imagefile;
        if (HinhanhFileUpLoad.PostedFile == null)
        {
            imagefile = "";
            hasimage = false;            
        }
        else
        {
            imagefile = "~/tuvung_images/" + GetFileName(HinhanhFileUpLoad.PostedFile.FileName);
        }  
        string tuvungID = TuVungListBox.SelectedValue;     
        string tuvung = TuTextBox.Text;
        int loaituid = Convert.ToInt32(LoaiTuDropDown.SelectedValue);
        string nghiatu = NghiaTuTextBox.Text;
        string hinhanh = imagefile;
        string vidu = ViDuTextBox.Text;
        string taikhoan = Session["taikhoan"].ToString();
        string tudienid = TuDienDropDown1.SelectedValue;
        int loai = Convert.ToInt32(LoaiTuDropDown.SelectedValue);
        bool res= tuvungBUS.CapNhatTuVung(tuvungID,loaituid, tuvung, nghiatu, hinhanh, vidu, taikhoan, 0, 0, tudienid,false, loai,hasimage);
        if (res == true)
        {
            //Save Image to DIRECTORY
            if (hasimage == true)
            {
                if (hasimage == true)
                {
                    if (System.IO.File.Exists(Server.MapPath(imagefile)))//if exist
                        System.IO.File.Delete(Server.MapPath(imagefile));//delete it
                    HinhanhFileUpLoad.SaveAs(Server.MapPath("tuvung_images\\") + System.IO.Path.GetFileName(imagefile));
                }
            }
            //nạp lại danh sách từ vựng
            TuVungListBox.Items.Clear();
            LoadTuVung(TimTuTextBox.Text, taikhoan, Convert.ToInt32(LoaiTuDienDropDown.SelectedValue));
            //nạp lại danh sách từ vựng
            TuVungListBox.Items.Clear();
            LoadTuVung(TimTuTextBox.Text, taikhoan, Convert.ToInt32(LoaiTuDienDropDown.SelectedValue));
            //clear chi tiết từ vựng
            LoadchitietTuVung("");
            //disable các control
            ChinhSuaCheckBox.Checked = false;
            enableControls(false);
            HinhanhFileUpLoad.Visible = false;
            
        }
    }

    #endregion



    
}