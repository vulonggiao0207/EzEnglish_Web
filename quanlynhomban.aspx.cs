using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BUS;
using BO;
public partial class quanlynhomban : System.Web.UI.Page
{
    BanBeBUS banbeBUS = new BanBeBUS();
    NguoiDungBUS nguoidungBUS = new NguoiDungBUS();
    TinNhanBUS tinnhanBUS = new TinNhanBUS();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["taikhoan"] == null)
            Response.Redirect("index.aspx");
   
        if (!IsPostBack)
        {
            LoadDSBanBe();
            LoadTinNhanChuaDoc(Session["taikhoan"].ToString()); 
        }
        if (TinNhanChuaDocListBox.Items.Count != 0)
        {
            Label3.Text = "Bạn có " + TinNhanChuaDocListBox.Items.Count.ToString() + " tin nhắn chưa đọc";
        }
    } 
    #region Xử lý danh sách bạn bè
    public void LoadDSBanBe()
    {
        string taikhoan = Session["taikhoan"].ToString();
        BanBeListBox.DataSource = banbeBUS.LayDSBanBe(taikhoan);
        BanBeListBox.DataTextField = "taikhoanban";
        BanBeListBox.DataValueField = "taikhoanban";
        BanBeListBox.DataBind();
    }
    protected void XoaButton_Click(object sender, EventArgs e)
    {
        if (BanBeListBox.SelectedItem != null)
        {
            string taikhoan = Session["taikhoan"].ToString();
            string taikhoanban = BanBeListBox.SelectedValue;
            banbeBUS.XoaBanBe(taikhoan, taikhoanban);
            LoadDSBanBe();
        }
    }
    protected void ThemBanButton_Click(object sender, EventArgs e)
    {
        if (ThemBanTextBox.Text != "" && nguoidungBUS.KTTrung2(ThemBanTextBox.Text)==true)
        {
            string taikhoan = Session["taikhoan"].ToString();
            string taikhoanban = ThemBanTextBox.Text;
            banbeBUS.ThemBanBe(taikhoan, taikhoanban);
            LoadDSBanBe();
            ThemBanTextBox.Text = "";
            ThongBaolabel.Visible = false;
        }
        else
        {
            ThongBaolabel.Visible = true;
            ModalPopupExtender1.Show();
        }
    }
    #endregion 
    #region Xử lý tin nhắn
    public void LoadTinNhanChuaDoc(string nguoinhan)
    {
        TinNhanChuaDocListBox.DataSource = tinnhanBUS.LayDSTinNhan_ChuaDoc(nguoinhan);
        TinNhanChuaDocListBox.DataTextField = "NguoiGoi";
        TinNhanChuaDocListBox.DataValueField = "TinNhanID";
        TinNhanChuaDocListBox.DataBind();
    }
    public void LoadChiTietTinNhan(string nguoinhan, string nguoigoi)
    {
        if (nguoinhan != "")
        {
            //Lấy nội dung tin nhắn
            TinNhanCollection tnColl = new TinNhanCollection();
            tnColl = tinnhanBUS.LayTinNhan(nguoinhan, nguoigoi);
            //tạo datasource cho GriView1
            DataTable dt = new DataTable();
            dt.Columns.Add("tinnhan");
            foreach (TinNhanBO tn in tnColl)
            {
                DataRow row= dt.NewRow();
                row["tinnhan"] = "- "+tn.NguoiGoi + " (" + tn.NgayGoi + "): " + tn.NoiDung;
                dt.Rows.Add(row);     
            }
            //Đổ dữ liệu vào GridView1
            GridView1.DataSource = dt;
            GridView1.DataBind();
         
          
        }

    }
    //Gởi cho người ngòai danh sách bạn
    protected void GuiButton1_Click(object sender, EventArgs e)
    {
        if (TenBanTinNhanTextBox.Text != "" && nguoidungBUS.KTTrung(TenBanTinNhanTextBox.Text) == true)
        {
            string nguoigoi = Session["taikhoan"].ToString();
            string nguoinhan = TenBanTinNhanTextBox.Text;
            string noidung = NoiDungTiNhanTextBox.Text;            
            tinnhanBUS.ThemTinNhan(nguoigoi, nguoinhan, noidung);
            TenBanTinNhanTextBox.Text = "";
            NoiDungTiNhanTextBox.Text = "";
            ThongBaolabel1.Visible = false;
        }
        else
        {
            ThongBaolabel1.Visible = true;
            ModalPopupExtender2.Show();
        }
    }
    //Gởi cho nguời trong danh sách bạn bè
    protected void GuiTinNhanButton_Click(object sender, EventArgs e)
    {
        if (TinNhanTextBox.Text != "" && (BanBeListBox.SelectedItem!=null || TinNhanChuaDocListBox.SelectedItem!=null ))
        {
            string nguoigoi=Session["taikhoan"].ToString();
            string nguoinhan;
            string noidung=TinNhanTextBox.Text;
            if(BanBeListBox.SelectedItem!=null )
                nguoinhan=BanBeListBox.SelectedItem.ToString();
            else
                nguoinhan = TinNhanChuaDocListBox.SelectedItem.ToString();
            tinnhanBUS.ThemTinNhan(nguoigoi,nguoinhan,noidung);
            //Load Chi Tiết Tin Nhắn
            LoadChiTietTinNhan(nguoinhan, nguoigoi);
            TinNhanTextBox.Text = "";
        }
    }
    /// <summary>
    /// ////////////hiện thị tin nhắn
    /// </summary>
    /// <param name="sender"></param>
    protected void BanBeListBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (TinNhanChuaDocListBox.SelectedIndex != -1) TinNhanChuaDocListBox.SelectedIndex = -1;
        //Load Chi Tiết Tin Nhắn
        string nguoinhan = Session["taikhoan"].ToString();
        string nguoigoi;
        if (BanBeListBox.SelectedItem != null)
            nguoigoi = BanBeListBox.SelectedItem.ToString();
        else
            nguoigoi = TinNhanChuaDocListBox.SelectedItem.ToString();
        LoadChiTietTinNhan(nguoinhan, nguoigoi);
    }
    protected void TinNhanChuaDocListBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (BanBeListBox.SelectedIndex != -1) BanBeListBox.SelectedIndex = -1;
        //Load Chi Tiết Tin Nhắn
        string nguoinhan = Session["taikhoan"].ToString();
        string nguoigoi;
        if (BanBeListBox.SelectedItem != null)
            nguoigoi = BanBeListBox.SelectedItem.ToString();
        else
            nguoigoi = TinNhanChuaDocListBox.SelectedItem.ToString();
        LoadChiTietTinNhan(nguoinhan, nguoigoi);
        //Cập nhật lại là đã đọc
        if (TinNhanChuaDocListBox.SelectedItem != null)
            tinnhanBUS.CapNhatTinNhan(TinNhanChuaDocListBox.SelectedValue, true);
    } 
    #endregion
}

  