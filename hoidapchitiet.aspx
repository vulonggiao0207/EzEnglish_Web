<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="hoidapchitiet.aspx.cs" Inherits="hoidapchitiet" EnableEventValidation="false" %>


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
            	<div class="templatemo_CauHoi_Title">HỎI ĐÁP             	 
           	    </div>               
                  <div class="templatemo_section_CauHoi_mid">   
                      
                      <table bgcolor="White" style="width: 700px; margin-left: 50px;">
                          <tr>
                              <td colspan="2">
                                  <asp:Label ID="Label5" runat="server" Font-Size="12pt" Text="Tiêu đề: "></asp:Label>
                                  <asp:Label ID="TieuDeTextBox" runat="server" Font-Bold="True" Font-Size="12pt" 
                                      ForeColor="#333333"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  <asp:Label ID="Label6" runat="server" Text="Người đăng: "></asp:Label>
                                  <asp:Label ID="NguoiDangLabel" runat="server"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="Label8" runat="server" Text="Ngày đăng:"></asp:Label>
                                  <asp:Label ID="NgayDangLabel" runat="server"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td colspan="2">
                                  <asp:TextBox ID="CauHoiTextBox" runat="server" TextMode="MultiLine" 
                                      Width="700px" BackColor="White" Font-Size="12pt" Height="100px" 
                                      ReadOnly="True" BorderColor="Black" BorderWidth="1px" ></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td colspan="2">
                                  <asp:GridView ID="TraLoiGridView" runat="server" AutoGenerateColumns="False" 
                                      Font-Size="12pt" ShowHeader="False" 
                                      Width="700px" onpageindexchanging="TraLoiGridView_PageIndexChanging" 
                                      AllowPaging="True" ondatabound="TraLoiGridView_DataBound"
                                      OnRowCreated="TraLoiGridView_RowCreated">
                                      <Columns>
                                          <asp:TemplateField ShowHeader="False">
                                              <ItemTemplate>
                                                  <table style="width: 260px" bgcolor="#EAEAEA">
                                                      <tr>
                                                          <td>
                                                              <asp:Label ID="traloiID" runat="server" Text='<%# Eval("TraLoiID") %>' 
                                                                  Visible="False"></asp:Label>
                                                          </td>
                                                      </tr>
                                                      <tr>
                                                          <td>
                                                              <asp:Label ID="Label3" runat="server" Font-Size="11pt" Text="Người đăng: "></asp:Label>
                                                              <asp:Label ID="NguoiDangLabel" runat="server" Font-Size="11pt" 
                                                                  Text='<%# Eval("TaiKhoan") %>'></asp:Label>
                                                          </td>
                                                      </tr>
                                                      <tr>
                                                          <td>
                                                              <asp:Label ID="Label4" runat="server" Font-Size="11pt" Text="Ngày đăng: "></asp:Label>
                                                              <asp:Label ID="NgayDangLabel" runat="server" Font-Size="11pt" 
                                                                  Text='<%# Eval("NgayGoi") %>'></asp:Label>
                                                          </td>
                                                      </tr>
                                                      <tr>
                                                          <td>
                                                              <asp:Button ID="XoaButton" runat="server" Font-Size="12pt" Text="Xóa" 
                                                                  Visible="False" Width="61px" 
                                                                  oncommand="XoaButton_Command" />
                                                          </td>
                                                      </tr>
                                                  </table>
                                              </ItemTemplate>
                                              <ItemStyle Width="260px" />
                                          </asp:TemplateField>
                                          <asp:BoundField DataField="NoiDung" ShowHeader="False" />
                                    </Columns>
                                    </asp:GridView>
                              </td>
                          </tr>
                          <tr>
                              <td colspan="2">
                                  <asp:TextBox ID="NoiDungTraLoiTextBox" runat="server" Font-Size="12pt" Height="100px" 
                                      TextMode="MultiLine" Width="700px" BackColor="White"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td colspan="2">
                                  <asp:Button ID="DangCauTraLoiButton" runat="server" Font-Size="12pt" 
                                       Text="Đăng câu trả lời" onclick="DangCauTraLoiButton_Click" />
                              </td>
                          </tr>
                      </table>
                      
                  </div>  
          </div>
          	<div class="space"></div>
        	<div class="cleaner"></div>
       
      </div>
</asp:Content>

