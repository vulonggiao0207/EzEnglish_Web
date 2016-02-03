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
    bool eng = true;//tham số cho biết đang là từ điển Việt hay Anh
         //Khai báo biến chứa các từ tra đựơc
    static TuVungCollection tvColl;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["lang"] == null)
        {
            Response.Redirect("tratu.aspx?lang=eng");
        }
        else
        {
            if (Request.QueryString["lang"].ToString() == "eng")
            {
                Label1.Visible = false;
                Label2.Visible = false;
                Label3.Visible = false;
                Label4.Visible = false;            
                Label6.Visible = false;
                Label7.Visible = true;
                Label8.Visible = true;
                Label9.Visible = true;               
                Label11.Visible = true;
                Label12.Visible = true;
                //gán tham số từ điển là true (Anh)
                eng = true;
            }
            else
            {
                Label1.Visible = true;
                Label2.Visible = true;
                Label3.Visible = true;
                Label4.Visible = true;            
                Label6.Visible = true;
                Label7.Visible = false;
                Label8.Visible = false;
                Label9.Visible = false;               
                Label11.Visible = false;
                Label12.Visible = false;
                //gán tham số từ điển là false (Việt)
                eng = false;
            }
        }
    }
    protected void TraTuButton_Click(object sender, ImageClickEventArgs e)
    {        
        //Lấy tài khỏan người dùng từ Sesstion[]
        string taikhoan;
        if (Session["taikhoan"] != null)
            taikhoan = Session["taikhoan"].ToString();
        else
            taikhoan = "";
        //Thực hiện tra từ 
        tvColl= new TuVungCollection();
            //Thực hiện hàm tratu
        if(eng==true)
            tvColl = tuvungBUS.LayDSTuVung_Eng(TuTraTxt.Text,taikhoan);
        else
            tvColl = tuvungBUS.LayDSTuVung_Viet(TuTraTxt.Text, taikhoan);

        if (tvColl.Count != 0)
        {
            //Load từ đầutiên
            stt = 0;
            LoadTuVung(stt);
            //Load TTTuVUngDropDown
            TTTuVungDropDown.Items.Clear();
            for (int i = 0; i < tvColl.Count; i++)
            {
                TTTuVungDropDown.Items.Add((i + 1).ToString());
            }
            if (TTTuVungDropDown.Items.Count != 0)
                TTTuVungDropDown.SelectedIndex = 0;
        }
        else
        {
            TTTuVungDropDown.Items.Clear();
            ClearTuVung();
        }
    }
    static int stt ;
    public void ClearTuVung()
    {
        TuVungTxt.Text = "";
        NghiaTuTxt.Text = "";
        LoaiTu.Text = "";
        HinhAnhImage.ImageUrl = "~/images/no_image.jpg";
        UngDungTxt.Text = "";
        taikhoanTxt.Text = "";
    }
    public void LoadTuVung(int stt)
    {
        TuVungTxt.Text = tvColl.Index(stt).TuVung;
        NghiaTuTxt.Text = tvColl.Index(stt).NghiaTu;
        LoaiTu.Text = tvColl.Index(stt).LoaiTuID.ToString();
        HinhAnhImage.ImageUrl = tvColl.Index(stt).HinhAnh;
        UngDungTxt.Text = tvColl.Index(stt).ViDu;
        taikhoanTxt.Text = tvColl.Index(stt).TaiKhoan;
    }
    protected void TuTruocButton_Click(object sender, EventArgs e)
    {
        if (stt > 0)
        {
            stt--;
            TTTuVungDropDown.SelectedIndex = stt;
            LoadTuVung(stt);
        }

    }
    protected void TuTiepButton_Click(object sender, EventArgs e)
    {
        if (stt < tvColl.Count-1)
        {
            stt++;
            TTTuVungDropDown.SelectedIndex = stt;
            LoadTuVung(stt);
        }
    }
    protected void TTTuVungDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        stt = Convert.ToInt32(TTTuVungDropDown.SelectedItem.ToString()) - 1;
        LoadTuVung(stt);
    }
}