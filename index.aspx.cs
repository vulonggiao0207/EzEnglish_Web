﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CauHoiMoiList_Click(object sender, BulletedListEventArgs e)
    {
        Response.Redirect("hoidapchitiet.aspx?id="+CauHoiMoiList.Items[e.Index].Value);
    }
    protected void CauTLMoiList_Click(object sender, BulletedListEventArgs e)
    {
        Response.Redirect("hoidapchitiet.aspx?id=" + CauTLMoiList.Items[e.Index].Value);
    }
}