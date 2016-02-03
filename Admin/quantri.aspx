<%@ Page Language="C#" AutoEventWireup="true" CodeFile="quantri.aspx.cs" Inherits="tratu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>hoctuvung.com</title>
<meta name="keywords" content="Floral, CSS Template, XHTML, Free Download" />
<meta name="description" content="Floral, Free CSS Template, XHTML CSS Layout" />
<link href="../Styles/templatemo_style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
    function clearText(field) {
        if (field.defaultValue == field.value) field.value = '';
        else if (field.value == '') field.value = field.defaultValue;
    }
</script>
 <style type="text/css">
<!--
     .style2
     {
         width: 100%;
     }
-->
 </style>
</head>
 <body>
	 <form id="form1" runat="server">
	<div id="templatemo_container">  	  
    	<div id="templatemo_header">
       	  <div id="templatemo_logo">
           	  <h1>hoctuvung.com</h1>
          </div>
            
            <div id="templatemo_menu">
				
			</div>
            <div class="cleaner"></div>
        </div>

        <div id="templatemo_content_area_top">

        	<div class="templatemo_left_top" style="height:0px">		
        	  
		  </div>   
       	  	
            <div class="cleaner"></div>
      </div><!-- End Of Content area top -->
        
        <div id="templatemo_content_area_bottom">
          <div class="templatemo_CauHoi_section">
            	<div class="templatemo_CauHoi_Title">     
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Đăng xuất</asp:LinkButton>      	
           	    </div>
                  <div class="templatemo_section_CauHoi_mid">   
                      <asp:ScriptManager ID="ScriptManager1" runat="server">
                      </asp:ScriptManager>
                      <table style="border-style: ridge; width: 200px; margin-left:320px; background-color: #FFFFFF;" 
                          border="2">
                        <tr>  
                        <td bgcolor="#ffffff" onmouseover="this.style.backgroundColor='LightGrey'" onmouseout="this.style.color='White'; this.style.backgroundColor='';" onclick="window.open('doimatkhau.aspx','_self');">
                        <center>
                            <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl="~/images/password.jpg" />
                            <br />
                            <asp:HyperLink ID="DoiMatKhauLink" runat="server" Font-Size="12pt" 
                                ForeColor="Blue" NavigateUrl="~/Admin/doimatkhau.aspx">Đổi mật khẩu</asp:HyperLink>
                        </center>
                        </td>
                        </tr>
                        <tr>
                          <td bgcolor="#ffffff" onmouseover="this.style.backgroundColor='LightGrey'" onmouseout="this.style.color='White'; this.style.backgroundColor='';" onclick="window.open('quanlynguoidung.aspx','_self');">
                          <center>
                             <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" ImageUrl="~/images/nhom.jpg" />
                              <br />
                            <asp:HyperLink ID="NhomLink" runat="server" Font-Size="12pt" 
                                ForeColor="Blue" NavigateUrl="~/Admin/quanlynguoidung.aspx">Quản lý người dùng</asp:HyperLink>
                          </center>
                        </td>
                        </tr>
                        <tr>
                          <td bgcolor="#ffffff" onmouseover="this.style.backgroundColor='LightGrey'" onmouseout="this.style.color='White'; this.style.backgroundColor='';" onclick="window.open('quanlytudiencongdong.aspx','_self');">
                          <center>
                             <asp:Image ID="Image3" runat="server" Height="100px" Width="100px" ImageUrl="~/images/tudien.jpg" />
                              <br />
                            <asp:HyperLink ID="TudienLink" runat="server" Font-Size="12pt" 
                                ForeColor="Blue" NavigateUrl="~/Admin/quanlytudiencongdong.aspx">Quản lý từ điển cộng đồng</asp:HyperLink>
                          </center>
                        </td>
                        </tr>
                        <tr>
                          <td bgcolor="#ffffff" onmouseover="this.style.backgroundColor='LightGrey'" onmouseout="this.style.color='White'; this.style.backgroundColor='';" onclick="window.open('quanlytuvung.aspx','_self');">
                          <center>     
                             <asp:Image ID="Image4" runat="server" Height="100px" Width="100px" ImageUrl="~/images/tuvung.jpg" />                       
                              <br />
                              <asp:HyperLink ID="TuVungLink" runat="server" Font-Size="12pt" 
                                ForeColor="Blue" NavigateUrl="~/Admin/quanlytuvung.aspx">Quản lý từ vựng</asp:HyperLink>
                          </center>

                        </td>
                        </tr>
                       </table>
                    
                  </div>  
          </div>
		  
        	<!-- End of Left Section -->
        	<!-- End of Right Section -->
			<div class="space"></div>
        	<div class="cleaner"></div>
      </div>
	  <!-- End Of Content area bottom -->

	<div id="templatemo_footer">
    	Copyright © 2048 <a href="#">Your Company Name</a> | <a href="http://www.iwebsitetemplate.com" target="_parent">Website Templates</a> by <a href="http://www.templatemo.com" target="_parent">Free CSS Templates</a>
      </div>
    </div><!-- End Of Container -->
<!--  Free CSS Templates by TemplateMo.com  -->
     </form>
</body>
</html>