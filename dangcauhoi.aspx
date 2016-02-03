<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="dangcauhoi.aspx.cs" Inherits="dangcauhoi" %>

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
 <div id="templatemo_content_area_bottom">
    <div class="templatemo_CauHoi_section">
            	<div class="templatemo_CauHoi_Title">CÂU HỎI MỚI NHẤT             	 
           	    </div>               
                  <div class="templatemo_section_CauHoi_mid">   
                      
                      <table bgcolor="White" style="width: 700px; margin-left: 50px;">
                          <tr>
                              <td>
                                  <asp:Label ID="Label3" runat="server" Font-Size="12pt" Text="Tiêu đề: "></asp:Label>
                                  <asp:TextBox ID="TieudeTextBox" runat="server" Font-Size="12pt" Width="530px"></asp:TextBox>
                                  <asp:Button ID="DangBaiButton" runat="server" Font-Size="12pt" 
                                      onclick="DangBaiButton_Click" Text="Đăng bài" />
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:TextBox ID="NoiDungTextBox" runat="server" Font-Size="12pt" Height="250px" 
                                      TextMode="MultiLine" Width="700px"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  &nbsp;</td>
                          </tr>
                      </table>
                      
                  </div>  
          </div>
          	<div class="space"></div>
        	<div class="cleaner"></div>
       
      </div>
	  <!-- End Of Content area bottom -->
</asp:Content>

