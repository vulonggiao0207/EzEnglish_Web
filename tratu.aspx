<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tratu.aspx.cs" Inherits="tratu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
            	<div class="templatemo_CauHoi_Title">TRA TỪ ĐIỂN            	
           	    </div>
                  <div class="templatemo_section_CauHoi_mid">   
                      <asp:ScriptManager ID="ScriptManager1" runat="server">
                      </asp:ScriptManager>
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server"  class="templatemo_section_CauHoi_mid" >
                      <ContentTemplate>
                      
                      <table class="style2" 
                          
                          style="width: 400px; margin-left: 200px; background-color: #FFFFFF; padding-top: 10px; padding-left: 10px;">
                          <tr>
                              <td colspan="2">
                            <hr style="margin-top:0px" />
                              <center>
                                    <asp:TextBox ID="TuTraTxt" runat="server" Font-Size="15pt" Width="300px"></asp:TextBox>
                                  <asp:ImageButton ID="TraTuButton" runat="server" Height="30px" 
                                      ImageUrl="~/images/tratu.jpg" Width="30px" ImageAlign="Baseline" 
                                        onclick="TraTuButton_Click" />
                           
                               </center>
                               <hr />
                                  </td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label1" runat="server" Text="Từ:" Font-Size="12pt" 
                                      Visible="False" Font-Bold="True"></asp:Label>
                                  <asp:Label ID="Label11" runat="server" Text="Word:" Font-Size="12pt" 
                                      Font-Bold="True"></asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="TuVungTxt" runat="server" BackColor="White" Font-Size="12pt" 
                                      ReadOnly="True" Width="250px" BorderStyle="None"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label2" runat="server" Text="Lọai từ:" Font-Size="12pt" 
                                      Visible="False" Font-Bold="True"></asp:Label>
                                  <asp:Label ID="Label7" runat="server" Text="Part:" Font-Size="12pt" 
                                      Font-Bold="True"></asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="LoaiTu" runat="server" BackColor="White" Font-Size="12pt" 
                                      ReadOnly="True" Width="250px" BorderStyle="None"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label3" runat="server" Text="Nghĩa từ:" Font-Size="12pt" 
                                      Visible="False" Font-Bold="True"></asp:Label>
                                  <asp:Label ID="Label8" runat="server" Text="Mean:" Font-Size="12pt" 
                                      Font-Bold="True"></asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="NghiaTuTxt" runat="server" BackColor="White" Font-Size="12pt" 
                                      ReadOnly="True" Width="250px" BorderStyle="None"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label4" runat="server" Text="Hình ảnh:" Font-Size="12pt" 
                                      Visible="False" Font-Bold="True"></asp:Label>
                                  <asp:Label ID="Label9" runat="server" Text="Image:" Font-Size="12pt" 
                                      Font-Bold="True"></asp:Label>
                              </td>
                              <td rowspan="2">
                                  <asp:Image ID="HinhAnhImage" runat="server" Height="150px" Width="250px" 
                                      BackColor="White" ImageUrl="~/images/no_image.jpg" />
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td>
                                  &nbsp;</td>
                              <td rowspan="2">
                                  <asp:TextBox ID="UngDungTxt" runat="server" Font-Size="12pt" 
                                      TextMode="MultiLine" Width="250px" BackColor="White" Font-Overline="False" 
                                      Font-Strikeout="False" Height="150px"
                                      ReadOnly="True" BorderStyle="None"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label6" runat="server" Text="Đăng bởi:" Font-Size="12pt" 
                                      Visible="False" Font-Bold="True"></asp:Label>
                                  <asp:Label ID="Label12" runat="server" Text="Edited by:" Font-Size="12pt" 
                                      Font-Bold="True"></asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="taikhoanTxt" runat="server" BackColor="White" Font-Size="12pt" 
                                      ReadOnly="True" Width="250px" BorderStyle="None"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td colspan="2">
                              <hr />
                                  <center>

                                      <asp:Button ID="TuTruocButton" runat="server" Font-Size="12pt" 
                                          Text="&lt;&lt;&lt;" onclick="TuTruocButton_Click" />
                                      <asp:DropDownList ID="TTTuVungDropDown" runat="server" Font-Size="12pt" 
                                          Width="60px" AutoPostBack="True" 
                                          onselectedindexchanged="TTTuVungDropDown_SelectedIndexChanged">
                                      </asp:DropDownList>
                                      <asp:Button ID="TuTiepButton" runat="server" Font-Size="12pt" 
                                          Text="&gt;&gt;&gt;" onclick="TuTiepButton_Click" />

                                  </center>
                                   <hr />
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