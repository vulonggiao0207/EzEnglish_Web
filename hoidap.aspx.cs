using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hoidap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DangCauHoiMoiButton_Click(object sender, EventArgs e)
    {
        if (Session["taikhoan"] != null)
        {
            Response.Redirect("dangcauhoi.aspx");
        }
        else
        {
            Response.Write("<script language='JavaScript'> alert('Bạn cần đăng nhập để đăng câu hỏi mới!!'); </script>"); 
        }
    }
}