using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
using BO;
public partial class hoctu : System.Web.UI.Page
{
    TuDienBUS tudienBUS = new TuDienBUS();
    TracNghiemBUS tracnghiemBUS = new TracNghiemBUS();
    TuVungBUS tuvungBUS = new TuVungBUS();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["taikhoan"] == null)
        {
            Response.Redirect("index.aspx");
        }
        if (!IsPostBack)
        {
            if (Session["taikhoan"] != null)
            {
                TuDienCheckBoxList.Items.Clear();
                string taikhoan = Session["taikhoan"].ToString();
                TuDienCollection tudiencanhan = new TuDienCollection();
                TuDienCollection tudienlienket = new TuDienCollection();
                TuDienCollection tudiencongdong = new TuDienCollection();
                tudiencanhan = tudienBUS.LayDSTuDien(taikhoan);
                tudienlienket = tudienBUS.LayDSTuDien_LienKet(taikhoan);
                tudiencongdong = tudienBUS.LayDSTuDien_CongDong("");
                foreach (TuDienBO td in tudiencanhan)
                {
                    ListItem item = new ListItem();
                    item.Text = td.TenTuDien + " - " + td.TaiKhoan;
                    item.Value = td.TuDienID;
                    TuDienCheckBoxList.Items.Add(item);
                }
                foreach (TuDienBO td in tudienlienket)
                {
                    ListItem item = new ListItem();
                    item.Text = td.TenTuDien + " - " + td.TaiKhoan;
                    item.Value = td.TuDienID;
                    TuDienCheckBoxList.Items.Add(item);
                }
                foreach (TuDienBO td in tudiencongdong)
                {
                    ListItem item = new ListItem();
                    item.Text = td.TenTuDien + " - " + td.TaiKhoan;
                    item.Value = td.TuDienID;
                    TuDienCheckBoxList.Items.Add(item);
                }
            }
        }
    }

    public static TuVungCollection TVLambai;//biến chức danh sách từ vựng tạo bài test
    public static TracNghiemCollection tracnghiemColl; //biến chứa bài test
    //Check và cập nhật danh sách từ vựng để làm bài test
    protected void TuDienCheckBoxList_SelectedIndexChanged(object sender, EventArgs e)
    {
        TVLambai = new TuVungCollection();
        for (int i = 0; i < TuDienCheckBoxList.Items.Count; i++)
        {
            if (TuDienCheckBoxList.Items[i].Selected == true)
            {
                TVLambai.Addrange(tuvungBUS.LayDSTuVung(TuDienCheckBoxList.Items[i].Value));
            }
        }
        TVLambai.Addrange(tuvungBUS.LayDSTuVung_CongDong());        
    }    
  
    /// /////////////////////////////tạo và làm bài [TRẮC NGHIỆM HIỂU TỪ]/////////////////////////
    #region Trắc nghiệm
    protected void TracNghiemBatDauButton_Click(object sender, EventArgs e)
    {
        int socauhoi = Convert.ToInt32(SoCauTiengAnhTextBox.Text);
        if (TVLambai.Count != 0)
        {
            tracnghiemColl = new TracNghiemCollection();
            tracnghiemColl = tracnghiemBUS.TaoBai_TracNghiem(TVLambai, socauhoi);
            //Load câu hỏi và 4 lựa chọn
            STT_cauhoi = 0;
            LoadCau(0);
            Load4LuaChon(0);
        }
        //reset lại tất cả control
        TracNghiemCauSoLabel.Text = "Câu số 1:";
        TracNghiemDungLabel.Text = "0";
        TracNghiemSaiLabel.Text = "0";
        ModalPopupExtender1.Show();
    }
    static int STT_cauhoi = 0;// biến chứa câu test đang hiển thị 
    public void LoadCau(int stt)
    {
        int cautraloidung = tracnghiemColl.Index(stt).CauTraLoiDung;
        TracNghiemCauHoiTextBox.Text = tracnghiemColl.Index(stt).Choices[cautraloidung].ViDu;
        TracNghiemCauHoiTextBox.Text += "\r\n\r\nWhat does '" + tracnghiemColl.Index(stt).Choices[tracnghiemColl.Index(stt).CauTraLoiDung].TuVung + "' mean?";

    }
    public void Load4LuaChon(int stt)
    {
        TracNghiemCauTraLoiListBox.DataSource = tracnghiemColl.Index(stt).Choices.ToList();
        TracNghiemCauTraLoiListBox.DataValueField = "TuVungID";
        TracNghiemCauTraLoiListBox.DataTextField = "NghiaTu";
        TracNghiemCauTraLoiListBox.DataBind();
    }
    protected void TracNghiemCauTiepButton_Click(object sender, EventArgs e)
    {
        if (Timer1.Enabled != true)
        {
            TracNghiemCauTraLoiListBox.Items[tracnghiemColl.Index(STT_cauhoi).CauTraLoiDung].Attributes.Add("style", "background-color:red");
            //Kiểm tra xem chọn đáp án đúng hay sai
            if (TracNghiemCauTraLoiListBox.SelectedIndex == tracnghiemColl.Index(STT_cauhoi).CauTraLoiDung)
            {
                TracNghiemDungLabel.Text = (Convert.ToInt32(TracNghiemDungLabel.Text) + 1).ToString();
            }
            else
            {
                TracNghiemSaiLabel.Text = (Convert.ToInt32(TracNghiemSaiLabel.Text) + 1).ToString();
            }
            Timer1.Enabled = true;
        }
        ModalPopupExtender1.Show();
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        //đánh dấu đáp án đúng       
        if (STT_cauhoi < tracnghiemColl.Count - 1)
        {
            STT_cauhoi++;
            LoadCau(STT_cauhoi);
            Load4LuaChon(STT_cauhoi);
            TracNghiemCauSoLabel.Text = "Câu số " + (STT_cauhoi + 1).ToString() + ":";
        }
        else
        {
            //reset các control
            tracnghiemColl = null;
            TracNghiemCauTraLoiListBox.Items.Clear();
            TracNghiemCauHoiTextBox.Text = "CHÚC MỪNG BẠN ĐÃ HÒAN THÀNH. KẾT QUẢ: \r\n - Đúng: " + TracNghiemDungLabel.Text + "\r\n - Sai: " + TracNghiemSaiLabel.Text;
            TracNghiemCauSoLabel.Text = "Câu số 0:";
            /*     TracNghiemDungLabel.Text = "0";
                 TracNghiemSaiLabel.Text = "0";*/

        }
        ModalPopupExtender1.Show();
        Timer1.Enabled = false;
    }
    protected void TracNghiemThoatButton_Click(object sender, EventArgs e)
    {
        Timer1.Enabled = false;
        ModalPopupExtender1.Hide();
        //reset các control
        tracnghiemColl = null;
        TracNghiemCauTraLoiListBox.Items.Clear();
        TracNghiemCauHoiTextBox.Text = "";
        TracNghiemCauSoLabel.Text = "Câu số 0:";
        TracNghiemDungLabel.Text = "0";
        TracNghiemSaiLabel.Text = "0";

    } 
    #endregion
    /// /////////////////////////////tạo và làm bài [TRẮC NGHIỆM HÌNH ẢNH]/////////////////////////
    #region Hình ảnh
    protected void HinhAnhBatDauButton_Click(object sender, EventArgs e)
    {
        int socauhoi = Convert.ToInt32(SoCauHinhAnhTextBox.Text);
        if (TVLambai.Count != 0)
        {
            tracnghiemColl = new TracNghiemCollection();
            tracnghiemColl = tracnghiemBUS.TaoBai_Hinhanh(TVLambai, socauhoi);
            //Load câu hỏi và 4 lựa chọn
            STT_cauhoi = 0;
            LoadHinhAnh(0);
            Load4LuaChonHinhAnh(0);
        }
        //reset lại tất cả control
        HinhAnhCauSoLabel.Text = "Câu số 1:";
        HinhAnhDungLabel.Text = "0";
        HinhAnhSaiLabel.Text = "0";
        ModalPopupExtender2.Show();
    }
    public void LoadHinhAnh(int stt)
    {
        int cautraloidung = tracnghiemColl.Index(stt).CauTraLoiDung;
        HinhAnhCauHoiImage.ImageUrl = tracnghiemColl.Index(stt).Choices[tracnghiemColl.Index(stt).CauTraLoiDung].HinhAnh;
    }
    public void Load4LuaChonHinhAnh(int stt)
    {
        HinhAnhCauTraLoiRadioList.DataSource = tracnghiemColl.Index(stt).Choices.ToList();
        HinhAnhCauTraLoiRadioList.DataValueField = "TuVungID";
        HinhAnhCauTraLoiRadioList.DataTextField = "TuVung";
        HinhAnhCauTraLoiRadioList.DataBind();
    }
    protected void HinhAnhCauTiepButton_Click(object sender, EventArgs e)
    {
        if (Timer2.Enabled != true)
        {
            HinhAnhCauTraLoiRadioList.Items[tracnghiemColl.Index(STT_cauhoi).CauTraLoiDung].Attributes.Add("style", "background-color:red");
            //Kiểm tra xem chọn đáp án đúng hay sai
            if (HinhAnhCauTraLoiRadioList.SelectedIndex == tracnghiemColl.Index(STT_cauhoi).CauTraLoiDung)
            {
                HinhAnhDungLabel.Text = (Convert.ToInt32(HinhAnhDungLabel.Text) + 1).ToString();
            }
            else
            {
                HinhAnhSaiLabel.Text = (Convert.ToInt32(HinhAnhSaiLabel.Text) + 1).ToString();
            }
            Timer2.Enabled = true;
        }
        ModalPopupExtender2.Show();
    }
    protected void Timer2_Tick(object sender, EventArgs e)
    {
        //đánh dấu đáp án đúng       
        if (STT_cauhoi < tracnghiemColl.Count - 1)
        {
            STT_cauhoi++;
            LoadHinhAnh(STT_cauhoi);
            Load4LuaChonHinhAnh(STT_cauhoi);
            HinhAnhCauSoLabel.Text = "Câu số " + (STT_cauhoi + 1).ToString() + ":";
        }
        else
        {
            //reset các control
            tracnghiemColl = null;
            HinhAnhCauTraLoiRadioList.Items.Clear();
            HinhAnhCauHoiImage.ImageUrl = "~/images/youdidit.jpg";
            HinhAnhCauSoLabel.Text = "Câu số 0:";
            /*       HinhAnhDungLabel.Text = "0";
                   HinhAnhSaiLabel.Text = "0";*/
        }
        ModalPopupExtender2.Show();
        Timer2.Enabled = false;
    }
    protected void HinhAnhThoatButton_Click(object sender, EventArgs e)
    {
        Timer2.Enabled = false;
        ModalPopupExtender2.Hide();
        //reset các control
        tracnghiemColl = null;
        HinhAnhCauTraLoiRadioList.Items.Clear();
        HinhAnhCauHoiImage.ImageUrl = "~/images/no_image.jpg";
        HinhAnhCauSoLabel.Text = "Câu số 0:";
        HinhAnhDungLabel.Text = "0";
        HinhAnhSaiLabel.Text = "0";
    } 
    #endregion
    /// /////////////////////////////tạo và làm bài [GIẢI Ô CHỮ]/////////////////////////
    #region Ô chữ
    OChuBUS ochuBUS = new OChuBUS();
    static string[,] OChu;//Biến chứa ô chữ
    static TuVungCollection GoiYOChuColl;//Biến chứa gợi ý
    static int tuhangdoclen;//biến chứa chiều dài từ dọc
    public void TaoBai()
    {
        OChuGoiYDropDown.SelectedIndex = 0;
        rights = 0;
        OChu = new string[12, 21];
        GoiYOChuColl = new TuVungCollection();
        tuhangdoclen = 0;
        OChu = ochuBUS.TaoOChu(TVLambai, ref tuhangdoclen, ref GoiYOChuColl);
        if (OChu != null)
        {
            //Tô màu hàng ngang
            int i = 0;//biến dòng
            int j = 0;//biến cột
            foreach (Control ct in OChuConTentPanel.Controls)
            {
                if (ct is TextBox)
                {
                    if (j < 21)
                    {
                        ((TextBox)ct).BackColor = System.Drawing.Color.White;
                        ((TextBox)ct).Font.Bold = true;
                        ((TextBox)ct).Text = "";
                        if (OChu[i, j] != "")
                            ((TextBox)ct).BackColor = System.Drawing.Color.LightGreen;
                        j++;
                        if (j == 21)
                        {
                            j = 0;
                            i++;
                        }
                    }
                    if (i == 12 && j == 21)
                        break;
                }
            }
            //Tô màu ô hàng dọc
            int len = 0;
            for (int c = 10; c < 200; c += 21)
            {
                foreach (Control ct in OChuConTentPanel.Controls)
                {
                    if (ct.ID == "OChu" + c.ToString())
                    {
                        ((TextBox)ct).BackColor = System.Drawing.Color.Yellow;
                        len++;
                        break;
                    }
                }
                if (len == tuhangdoclen)
                    break;
            }
            OChuGoiYTextBox.Text = GoiYOChuColl.Index(0).NghiaTu;
        }
    }
    protected void OChuTaoBaiButton_Click(object sender, EventArgs e)
    {
        Timer3.Enabled = false;
        TaoBai();
        ModalPopupExtender3.Show();
    }
    protected void OChuGoiYDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        OChuGoiYTextBox.Text = "";
        if (Convert.ToInt32(OChuGoiYDropDown.SelectedValue) < tuhangdoclen)
        {
            OChuGoiYTextBox.Text = GoiYOChuColl.Index(Convert.ToInt32(OChuGoiYDropDown.SelectedValue)).NghiaTu;
        }
        ModalPopupExtender3.Show();
    }
    static int rights;//biến đếm câu đúng
    protected void OChuDienVaoButton_Click(object sender, EventArgs e)
    {
        if (OChuGoiYDropDown.SelectedItem != null)
        {
            int TTHangNgang = Convert.ToInt32(OChuGoiYDropDown.SelectedValue);
            if (OChuTraLoiTextBox.Text.ToUpper() == GoiYOChuColl.Index(TTHangNgang).TuVung.ToUpper())
            {
                int i = 0;
                foreach (Control ct in OChuConTentPanel.Controls)
                {
                    if (ct is TextBox)
                    {
                        if (((TextBox)ct).ID == "OChu" + (21 * TTHangNgang + i).ToString())
                        {
                            ((TextBox)ct).Text = OChu[TTHangNgang, i];
                            i++;
                        }
                        if (i == 21)
                            break;

                    }
                }
                rights++;
                if (rights == tuhangdoclen)
                {
                    Timer3.Enabled = true;
                }
            }
        }
        ModalPopupExtender3.Show();
    }
    protected void GiaiToanBoOChuButton_Click(object sender, EventArgs e)
    {
        if (OChu != null)
        {
            int i = 0;//biến dòng
            int j = 0;//biến cột
            foreach (Control ct in OChuConTentPanel.Controls)
            {
                if (ct is TextBox)
                {
                    if (j < 21)
                    {
                        ((TextBox)ct).Text = OChu[i, j];
                        j++;
                        if (j == 21)
                        {
                            j = 0;
                            i++;
                        }
                    }
                    if (i == 12 && j == 21)
                        break;
                }
            }
        }
        ModalPopupExtender3.Show();
    }
    protected void Timer3_Tick(object sender, EventArgs e)
    {
        int ii = 0;//biến dòng
        int j = 0;//biến cột
        foreach (Control ct in OChuConTentPanel.Controls)
        {
            if (ct is TextBox)
            {
                if (j < 21)
                {
                    ((TextBox)ct).BackColor = System.Drawing.Color.White;
                    ((TextBox)ct).Font.Bold = true;
                    ((TextBox)ct).Text = "";
                    j++;
                    if (j == 21)
                    {
                        j = 0;
                        ii++;
                    }
                }
                if (ii == 12 && j == 21)
                    break;
            }
        }

        //Chúc mừng chiến thắng
        OChu45.Text = "C";
        OChu46.Text = "O";
        OChu47.Text = "N";
        OChu48.Text = "G";
        OChu49.Text = "R";
        OChu50.Text = "A";
        OChu51.Text = "T";
        OChu52.Text = "U";
        OChu53.Text = "L";
        OChu54.Text = "A";
        OChu55.Text = "T";
        OChu55.Text = "I";
        OChu55.Text = "O";
        OChu56.Text = "N";
        OChu88.Text = "Y";
        OChu89.Text = "O";
        OChu90.Text = "U";
        OChu92.Text = "D";
        OChu93.Text = "I";
        OChu94.Text = "D";
        OChu96.Text = "I";
        OChu97.Text = "T";
        Timer3.Enabled = false;
        ModalPopupExtender3.Show();
    } 
    #endregion
}