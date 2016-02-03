<%@ Page Language="C#" AutoEventWireup="true" CodeFile="taikhoan.aspx.cs" Inherits="taikhoan" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>hoctuvung.com</title>
<meta name="keywords" content="Floral, CSS Template, XHTML, Free Download" />
<meta name="description" content="Floral, Free CSS Template, XHTML CSS Layout" />
<link href="Styles/templatemo_style.css" rel="stylesheet" type="text/css" />
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
				<ul>
					<li><a href="index.aspx"><b>Trang chủ</b></a></li>
					<li><a href="gioithieu.aspx"><b>Giới thiệu</b></a></li>
   					<li><a href="hoctu.aspx"><b>Học từ vựng</b></a></li>
   					<li><a href="hoidap.aspx"><b>Hỏi/Đáp</b></a></li>	
				</ul>
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
            	<div class="templatemo_CauHoi_Title">TÀI KHỎAN CÁ NHÂN          	
           	    </div>
                  <div class="templatemo_section_CauHoi_mid"> 
               
                  <p>  
                      <table style="border-style: ridge; width: 200px; margin-left:320px; background-color: #FFFFFF;" 
                          border="2">
                        <tr>  
                        <td bgcolor="#ffffff" onmouseover="this.style.backgroundColor='LightGrey'" onmouseout="this.style.color='White'; this.style.backgroundColor='';" onclick="window.open('thongtincanhan.aspx','_self');">
                        <center>
                            <asp:HyperLink ID="DoiMatKhauLink" runat="server" Font-Size="12pt" 
                                ForeColor="Blue" NavigateUrl="~/thongtincanhan.aspx">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/thongtin.jpg" Width="100" Height="100" /><br/>Thay đổi thông tin cá nhân</asp:HyperLink>
                        </center>
                        </td>
                        </tr>
                        <tr>
                          <td bgcolor="#ffffff" onmouseover="this.style.backgroundColor='LightGrey'" onmouseout="this.style.color='White'; this.style.backgroundColor='';" onclick="window.open('quanlynhomban.aspx','_self');">
                          <center>
                            <asp:HyperLink ID="NhomLink" runat="server" Font-Size="12pt" 
                                ForeColor="Blue" NavigateUrl="~/quanlynhomban.aspx">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/nhom.jpg" Width="100" Height="100" /><br/>Quản lý bạn bè</asp:HyperLink>
                          </center>
                        </td>
                        </tr>
                        <tr>
                          <td bgcolor="#ffffff" onmouseover="this.style.backgroundColor='LightGrey'" onmouseout="this.style.color='White'; this.style.backgroundColor='';" onclick="window.open('quanlytudien.aspx','_self');">
                          <center>
                            <asp:HyperLink ID="TudienLink" runat="server" Font-Size="12pt" 
                                ForeColor="Blue" NavigateUrl="~/quanlytudien.aspx">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/tudien.jpg" Width="100" Height="100" /><br/>Quản lý từ điển</asp:HyperLink>
                          </center>
                        </td>
                        </tr>
                        <tr>
                          <td bgcolor="#ffffff" onmouseover="this.style.backgroundColor='LightGrey'" onmouseout="this.style.color='White'; this.style.backgroundColor='';" onclick="window.open('quanlytuvung.aspx','_self');">
                          <center>                            <asp:HyperLink ID="TuVungLink" runat="server" Font-Size="12pt" 
                                ForeColor="Blue" NavigateUrl="~/quanlytuvung.aspx">
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/images/tuvung.jpg" Width="100" Height="100" /><br/>Quản lý từ vựng</asp:HyperLink>
                          </center>

                        </td>
                        </tr>
                       </table>
                 </p> 
                 

                    
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
