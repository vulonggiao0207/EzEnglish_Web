using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using BUS;
public partial class hoidapchitiet : System.Web.UI.Page
{
    CauHoiBUS ccBUS = new CauHoiBUS();
    public void LoadCauHoi()
    {
        string cauhoiID = Request.QueryString["id"].ToString();
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["hoctuvungConnectionString"].ToString());
        SqlCommand cmd= new SqlCommand("SELECT TIEUDE,NOIDUNG,TAIKHOAN,convert(nvarchar(20),NGAYGOI,101) as ngaydang FROM CAUHOI_DIENDAN WHERE CAUHOIID='"+cauhoiID+"'",cnn);
        cnn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            TieuDeTextBox.Text = dr["tieude"].ToString();
            CauHoiTextBox.Text = dr["noidung"].ToString();
            NguoiDangLabel.Text = dr["taikhoan"].ToString();
            NgayDangLabel.Text = dr["ngaydang"].ToString();
            break;
        }
        cnn.Close();
    }
    public void LoadCauTraLoi()
    {
        string cauhoiID = Request.QueryString["id"].ToString();
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["hoctuvungConnectionString"].ToString());
    //    SqlCommand cmd= new SqlCommand("SELECT * FROM TRALOI_DIENDAN WHERE CAUHOIID='"+cauhoiID+"'",cnn);
        SqlDataAdapter da= new SqlDataAdapter("SELECT * FROM TRALOI_DIENDAN WHERE CAUHOIID='"+cauhoiID+"' order by ngaygoi",cnn);
        DataTable dt= new DataTable();
        da.Fill(dt);
        TraLoiGridView.DataSource=dt;
        TraLoiGridView.DataBind();
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"]!=null)
        {
            LoadCauHoi();
            LoadCauTraLoi(); 
        }
    }
    protected void DangCauTraLoiButton_Click(object sender, EventArgs e)
    {
        if (Session["taikhoan"] != null)
        {
            string cauhoiID = Request.QueryString["id"].ToString();
            string taikhoan = Session["taikhoan"].ToString();
            string noidung = NoiDungTraLoiTextBox.Text;
            bool res = ccBUS.ThemCauTraLoi(taikhoan, cauhoiID, noidung);
            if (res != true)
            {
                Response.Write("<script language='JavaScript'> alert('Lỗi! Không thể đăng câu hỏi mới đựơc, bạn hãy thử lại sau!'); </script>");
            }
            else
            {
                NoiDungTraLoiTextBox.Text = "";
                LoadCauTraLoi();
            }
        }
        else
        {
            Response.Write("<script language='JavaScript'> alert('Bạn cần đăng nhập để đăng câu trả lời'); </script>");
        }
    }
    protected void TraLoiGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        TraLoiGridView.PageIndex = e.NewPageIndex;
        LoadCauTraLoi();
    }
    protected void TraLoiGridView_DataBound(object sender, EventArgs e)
    {
     
    }
    protected void TraLoiGridView_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button btn = new Button();
            btn=(Button)e.Row.FindControl("XoaButton");
            if (Session["quyen"] != null && Session["quyen"].ToString().Trim() == "Admin")
            {               
                btn.Visible = true;
                btn.CommandArgument = e.Row.RowIndex.ToString();
            }        
        }
    }
    protected void XoaButton_Command(object sender, CommandEventArgs e)
    {
        int index =Convert.ToInt32(e.CommandArgument);
        Label tb = new Label();
        tb = (Label)TraLoiGridView.Rows[index].FindControl("traloiID");
        //Xóa
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["hoctuvungConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand("Delete traloi_diendan where traloiID='" + tb.Text + "'", cnn);
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
        LoadCauTraLoi();
    }
 
  
}