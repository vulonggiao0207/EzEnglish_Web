<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dangnhap.aspx.cs" Inherits="tratu" %>

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
           	    </div>
                  <div class="templatemo_section_CauHoi_mid">   
                      <asp:ScriptManager ID="ScriptManager1" runat="server">
                      </asp:ScriptManager>
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server"  class="templatemo_section_CauHoi_mid" >
                      <ContentTemplate>
                      
                      <table class="style2" 
                              style="padding: 0px; width: 400px; margin-left: 200px; background-color: #FFFFFF; ">

                         <tr>
                         <td bgcolor="#8BAC43" colspan="2">
                             <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="12pt" 
                                 ForeColor="White" Text="ĐĂNG NHẬP"></asp:Label>
                             </td>
                       
                         </tr>
                          <tr>
                         <td>
                             <asp:Label ID="Label2" runat="server" Font-Size="12pt" Text="Tài khỏan:"></asp:Label>
                              </td>
                         <td>
                             <asp:TextBox ID="TaiKhoanTextBox" runat="server" Font-Size="12pt" Width="280px"></asp:TextBox>
                              </td>
                       
                         </tr>
                          <tr>
                         <td>
                             <asp:Label ID="Label3" runat="server" Font-Size="12pt" Text="Mật khẩu:"></asp:Label>
                              </td>
                         <td>
                             <asp:TextBox ID="MatKhauTextbox" runat="server" Font-Size="12pt" 
                                 TextMode="Password" Width="280px"></asp:TextBox>
                              </td>
                       
                         </tr>
                          <tr>
                         <td></td>
                         <td>
                             <asp:Button ID="DangNhapButton" runat="server" Font-Size="12pt" 
                                 onclick="DangNhapButton_Click" Text="Đăng nhập" />
                              </td>
                       
                         </tr>
                          <tr>
                              <td colspan="2">
                                  <asp:Label ID="ThongBaoLabel" runat="server" Font-Size="12pt" ForeColor="Red" 
                                      Text="Sai mật khẩu! Mời nhập lại" Visible="False"></asp:Label>
                              </td>
                          </tr>
                      </table>
                      </ContentTemplate>
                      </asp:UpdatePanel>
                    
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