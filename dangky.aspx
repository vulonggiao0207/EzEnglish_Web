<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="dangky.aspx.cs" Inherits="hoidap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="templatemo_menu">
				<ul>
					<li><a href="index.aspx"><b>Trang chủ</b></a></li>
					<li><a href="gioithieu.aspx"><b>Giới thiệu</b></a></li>
   					<li><a href="hoctu.aspx"><b>Học từ vựng</b></a></li>
   					<li><a href="hoidap.aspx"><b>Hỏi/Đáp</b></a></li>	
				</ul>
			</div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <!-- End Of Content area top -->        
        <div id="templatemo_content_area_bottom">
          <div class="templatemo_CauHoi_section">
            	<div class="templatemo_CauHoi_Title">ĐĂNG KÝ             	
           	    </div>               
                  <div class="templatemo_section_CauHoi_mid">               
                   <p>
                      <table style="width:350px; background-color: #FFFFFF; margin-left:250px; padding-top:10px; padding-left:10px">
                          <tr>
                              <td>
                                  <asp:Label ID="Label3" runat="server" Font-Size="12pt" Text="Tài khỏan" ></asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="TaiKhoanTxt" runat="server" Font-Size="12pt" MaxLength="30" 
                                      ValidationGroup="vad1" ></asp:TextBox>
                              </td>
                              <td>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                      ErrorMessage="Tài khỏan không đựơc bỏ trống" ControlToValidate="TaiKhoanTxt" 
                                      Display="Dynamic" ForeColor="Red" ValidationGroup="vad1">(*)</asp:RequiredFieldValidator>
                                  </td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label7" runat="server" Font-Size="12pt" Text="Mật khẩu"></asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="MatKhauTxt" runat="server" Font-Size="12pt" MaxLength="30" 
                                      TextMode="Password" ValidationGroup="vad1"></asp:TextBox>
                              </td>
                              <td>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                      ControlToValidate="MatKhauTxt" Display="Dynamic" 
                                      ErrorMessage="Mật khẩu không đựơc bỏ trống" ForeColor="Red" 
                                      ValidationGroup="vad1">(*)</asp:RequiredFieldValidator>
                                  </td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label1" runat="server" Font-Size="12pt" Text="Xác nhận mật khẩu"></asp:Label>
                             </td>
                              <td>
                                  <asp:TextBox ID="XacNhanTxt" runat="server" Font-Size="12pt" MaxLength="30" 
                                      TextMode="Password" ValidationGroup="vad1"></asp:TextBox>
                              </td>
                              <td>
                                  <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                      ControlToCompare="MatKhauTxt" ControlToValidate="XacNhanTxt" Display="Dynamic" 
                                      ErrorMessage="Xác nhận mật khẩu sai" ForeColor="Red" 
                                      ValidationGroup="vad1">(*)</asp:CompareValidator>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                 <asp:Label ID="Label2" runat="server" Font-Size="12pt" Text="Email"></asp:Label>
                             </td>
                              <td>
                                  <asp:TextBox ID="EmailTxt" runat="server" Font-Size="12pt" MaxLength="50" 
                                      ValidationGroup="vad1"></asp:TextBox>
                              </td>
                              <td>
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label6" runat="server" Font-Size="12pt" Text="Số điện thọai"></asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="SoDTTxt" runat="server" Font-Size="12pt" MaxLength="12" 
                                      ValidationGroup="vad1"></asp:TextBox>
                              </td>
                              <td>
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td>
                                  &nbsp;</td>
                              <td>
                                 <asp:Button ID="DangKyTxt" runat="server" Font-Size="12pt" Text="Đăng ký" 
                                      ValidationGroup="vad1" onclick="DangKyTxt_Click" />
                              </td>
                              <td>
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td colspan="2">                            
                                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Size="12pt" 
                                      ForeColor="Red" ValidationGroup="vad1" />
                                       <center> 
                                  <asp:Label ID="ErrorLabel" runat="server" Text="Tài khỏan đã có ngừơi sử dụng" 
                                      Font-Size="12pt" ForeColor="Red" Visible="False"></asp:Label>
                                      </center>
                              </td>
                              <td>
                                  &nbsp;</td>
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
</asp:Content>

