<%@ Page Language="C#" AutoEventWireup="true" CodeFile="thongtincanhan.aspx.cs" Inherits="thongtincanhan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
      </div>
      <!-- End Of Content area top -->
        
        <div id="templatemo_content_area_bottom">
          <div class="templatemo_CauHoi_section">
            	<div class="templatemo_CauHoi_Title">
            	     <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/taikhoan.aspx" ForeColor="White" Font-Size="13"> TÀI KHỎAN CÁ NHÂN</asp:HyperLink> >> THAY ĐỔI THÔNG TIN CÁ NHÂN          	
           	    </div>
                  <div class="templatemo_section_CauHoi_mid">   
                           <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>   
                      <table class="style2" style="width: 400px; margin-left: 250px; background-color: #FFFFFF; padding-top: 10px; padding-left: 10px;">
                       <tr>
                       <td>
                        <hr/>

                           <table class="style2">
                               <tr>
                                   <td>
                                       <asp:Label runat="server" Text="Tài khỏan:" Font-Bold="True" Font-Size="12pt" 
                                           ID="Label7"></asp:Label>
                                   </td>
                                   <td>
                                       <asp:Label ID="TaiKhoanLabel" runat="server" Font-Size="12pt" Text="Label" 
                                           Width="250px"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                       <asp:Label runat="server" Text="Email:" Font-Bold="True" Font-Size="12pt" 
                                           ID="Label8"></asp:Label>
                                   </td>
                                   <td>
                                       <asp:Label ID="EmailLabel" runat="server" Font-Size="12pt" Text="Label" 
                                           Width="250px"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                       <asp:Label runat="server" Text="Số điện thọai:" Font-Bold="True" 
                                           Font-Size="12pt" ID="Label9"></asp:Label>
                                   </td>
                                   <td>
                                       <asp:Label ID="SoDienThoaiLabel" runat="server" Font-Size="12pt" Text="Label" 
                                           Width="250px"></asp:Label>
                                   </td>
                               </tr>
                           </table>

                        <hr/>
                       </td>
                       </tr>
                        <tr>
                        <td>
                            <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
                                Height="180px" Width="400px" Font-Size="12pt" Font-Bold="True">
                                <asp:TabPanel runat="server" HeaderText="Đổi mật khẩu" ID="TabPanel1">
                                    <ContentTemplate>
                                        <table class="style2">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                        Text="Mật khẩu cũ:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="MatKhauTextBox" runat="server" Font-Size="12pt" MaxLength="30" 
                                                        TextMode="Password" Width="230px" ValidationGroup="doimatkhauvalid"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                        Text="Mật khẩu mới:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="MatKhauMoiTextBox" runat="server" Font-Size="12pt" 
                                                        MaxLength="30" TextMode="Password" Width="230px" 
                                                        ValidationGroup="doimatkhauvalid"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                        Text="Xác nhận:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="XacNhanTextBox" runat="server" Font-Size="12pt" MaxLength="30" 
                                                        TextMode="Password" Width="230px" ValidationGroup="doimatkhauvalid"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:Button ID="DoiMatKhauButton" runat="server" Font-Size="12pt" 
                                                        Text="Đồng ý" onclick="DoiMatKhauButton_Click" 
                                                        ValidationGroup="doimatkhauvalid" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                        ControlToValidate="MatKhauMoiTextBox" Display="None" 
                                                        ErrorMessage="Không đựơc bỏ trống mật khẩu mới" Font-Size="12pt" 
                                                        ForeColor="Red" ValidationGroup="doimatkhauvalid">(*)</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                        ControlToCompare="MatKhauMoiTextBox" ControlToValidate="XacNhanTextBox" 
                                                        Display="None" ErrorMessage="Mật khẩu xác nhận không đúng" Font-Size="12pt" 
                                                        ForeColor="Red" ValidationGroup="doimatkhauvalid">(*)</asp:CompareValidator>
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" 
                                                        ErrorMessage="Mật khẩu sai" ForeColor="Red" 
                                                        ValidationGroup="doimatkhauvalid">(*)</asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                                                        ValidationGroup="doimatkhauvalid" />                                                        
                                              <center> <asp:Label ID="ThanhCongLabel1" runat="server" Text="Thay đổi mật khẩu thành công" 
                                                        ForeColor="Red" Visible="False"></asp:Label>
                                             </center>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Đổi Email">
                                    <ContentTemplate>
                                        <table class="style2">
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                        Text="Email mới:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="EmailMoiTextBox" runat="server" Font-Size="12pt" 
                                                        MaxLength="50" Width="270px" ValidationGroup="EmailValid"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:Button ID="DoiEmailButton" runat="server" Font-Size="12pt" Text="Đồng ý" 
                                                        onclick="DoiEmailButton_Click" ValidationGroup="EmailValid" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                        ControlToValidate="EmailMoiTextBox" Display="None" 
                                                        ErrorMessage="Email không đựơc bỏ trống" ForeColor="Red" 
                                                        ValidationGroup="EmailValid">(*)</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                        ControlToValidate="EmailMoiTextBox" Display="None" 
                                                        ErrorMessage="Email sai định dạng" ForeColor="Red" 
                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                        ValidationGroup="EmailValid">(*)</asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" 
                                                        ValidationGroup="EmailValid" />
                                                <center>
                                                    <asp:Label ID="ThanhCongLabel2" runat="server" ForeColor="Red" 
                                                        Text="Thay đổi email thành công" Visible="False"></asp:Label>
                                                </center>


                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="Đổi số điện thọai">
                                    <ContentTemplate>
                                        <table class="style2">
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                        Text="Số điện thọai mới:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="SoDTMoiTextBox" runat="server" Font-Size="12pt" MaxLength="12" 
                                                        Width="200px" ValidationGroup="SoDTValid"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:Button ID="DoiSoDTButton" runat="server" Font-Size="12pt" Text="Đồng ý" 
                                                        onclick="DoiSoDTlButton_Click" ValidationGroup="SoDTValid" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                        ControlToValidate="SoDTMoiTextBox" 
                                                        ErrorMessage="Số điện thọai không đựơc bỏ trống" ForeColor="Red" 
                                                        ValidationGroup="SoDTValid">(*)</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:ValidationSummary ID="ValidationSummary3" runat="server" ForeColor="Red" 
                                                        ValidationGroup="SoDTValid" />
                                                    <center>
                                                    <asp:Label ID="ThanhCongLabel3" runat="server" ForeColor="Red" 
                                                        Text="Thay đổi số điện thọai thành công" Visible="False"></asp:Label>
                                                        </center>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
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
