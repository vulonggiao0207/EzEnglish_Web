<%@ Page Language="C#" AutoEventWireup="true" CodeFile="quanlynhomban.aspx.cs" Inherits="quanlynhomban" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>hoctuvung.com</title>
<style type="text/css">
        .modalBackground 
        {
            background-color:#333333;
            filter:alpha(opacity=70);
            opacity:0.7;    
            overflow:scroll;    
        }      
    </style> 
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
     .style3
     {
         width: 400px;
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
            	<div class="templatemo_CauHoi_Title">
            	     <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/taikhoan.aspx" ForeColor="White" Font-Size="13"> TÀI KHỎAN CÁ NHÂN</asp:HyperLink> >> QUẢN LÝ BẠN BÈ    	
           	    </div>
                  <div class="templatemo_section_CauHoi_mid"> 
                      <asp:ScriptManager ID="ScriptManager1" runat="server">
                      </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="templatemo_section_CauHoi_mid">
                          <ContentTemplate>
                              <table class="style2" 
                                  style="padding: 0px; width: 750px; margin-left: 30px; background-color: #FFFFFF; ">
                                  <tr>
                                      <td style="background-color: #7FA432; width: 280px;">
                                          <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="12pt" 
                                              ForeColor="White" Text="Bạn bè"></asp:Label>
                                      </td>
                                      <td colspan="2" style="background-color: #7FA432">
                                          <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="12pt" 
                                              ForeColor="White" Text="Nội dung tin nhắn:"></asp:Label>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <asp:ListBox ID="BanBeListBox" runat="server" Font-Size="12pt" Height="300px" 
                                              Width="275px" onselectedindexchanged="BanBeListBox_SelectedIndexChanged" 
                                              AutoPostBack="True"></asp:ListBox>
                                      </td>
                                      <td colspan="2" rowspan="4">
                                   <asp:Panel ID="TinNhanPanel" ScrollBars="Vertical" runat="server" BorderStyle="Groove" Height="515px">                                          
                                   <asp:GridView ID="GridView1" runat="server" Font-Size="12pt" 
                                              ShowHeader="False" Width="465px" CellPadding="4" ForeColor="#333333" 
                                           GridLines="None">
                                          <AlternatingRowStyle BackColor="White" />
                                          <EditRowStyle BackColor="#2461BF" />
                                          <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                          <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                          <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                          <RowStyle BackColor="White" />
                                          <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                          <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                          <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                          <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                          <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                          </asp:GridView>
                                          </asp:Panel>

                                     
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <table class="style2">
                                              <tr>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      <asp:Button ID="ThemButton" runat="server" Font-Size="12pt" Text="Thêm" 
                                                          />
                                                  </td>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                     <asp:Button ID="XoaButton" runat="server" Font-Size="12pt" Text="Xóa" 
                                                          Width="54px" onclick="XoaButton_Click" />
                                                  </td>
                                              </tr>
                                          </table>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td style="background-color: #7FA432;">
                                          <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="12pt" 
                                              ForeColor="White" Text="Tin nhắn chưa đọc:"></asp:Label>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <asp:ListBox ID="TinNhanChuaDocListBox" runat="server" Font-Size="12pt" 
                                              Height="150px" Width="275px" 
                                              onselectedindexchanged="TinNhanChuaDocListBox_SelectedIndexChanged" 
                                              AutoPostBack="True"></asp:ListBox>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td rowspan="2">
                                          <table class="style2">
                                              <tr>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      <asp:Button ID="GuiTinNhanButton1" runat="server" Font-Size="12pt" 
                                                          Text="Gửi tin nhắn ngòai danh sách..." Width="234px" />
                                                  </td>
                                              </tr>
                                          </table>
                                      </td>
                                      <td class="style3" rowspan="2">
                                          <asp:TextBox ID="TinNhanTextBox" runat="server" Height="50px" 
                                              TextMode="MultiLine" Width="400px"></asp:TextBox>
                                      </td>
                                      <td>
                                          <asp:Button ID="GuiTinNhanButton" runat="server" Font-Size="12pt" Text="Gửi" 
                                              Width="47px" onclick="GuiTinNhanButton_Click"/>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                                
                              </table>
                            
                              <%---------------------Thêm bạn mới------------------%>
                            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                             DropShadow="True"
                               PopupControlID="ThemBanPanel" TargetControlID="ThemButton" 
                               BackgroundCssClass="modalBackground " BehaviorID="bePopup"
                               CancelControlID="ThoatButton" 
                                RepositionMode="RepositionOnWindowResizeAndScroll">                              
                            </asp:ModalPopupExtender>
                              <asp:Panel ID="ThemBanPanel" runat="server" Style="display: none;">
                              <table style="padding: 0px; width:300px; background-color: #FFFFFF; margin-left: 200;">
                              <tr>
                              <td style="background-color: #7FA432;">
                                  <asp:Label ID="Label4" runat="server" Text="Thêm bạn bè" Font-Size="12" Font-Bold="True" ForeColor="White"></asp:Label>
                              </td>
                              </tr>
                              <tr>
                              <td>
                                  <asp:TextBox ID="ThemBanTextBox" runat="server" Font-Size="12pt" Width="290px"></asp:TextBox></td>
                              </tr>
                              <tr>
                              <td>
                                  <table class="style2">
                                      <tr>
                                          <td>
                                              &nbsp;</td>
                                          <td>
                                              &nbsp;</td>
                                          <td>
                                              <asp:Button ID="ThemBanButton" runat="server" Font-Size="12pt" Text="Thêm" 
                                                  onclick="ThemBanButton_Click" />
                                          </td>
                                          <td>
                                              <asp:Button ID="ThoatButton" runat="server" Font-Size="12pt" Text="Thóat" />
                                          </td>
                                      </tr>
                                  </table>
                                  </td>
                              </tr>
                              <tr>
                              <td>
                              <asp:Label ID="ThongBaolabel" runat="server" Text="Người bạn này không tồn tại" Font-Bold="true" Font-Size="12pt" ForeColor="Red"  Visible="false"></asp:Label>
                              </td>
                              </tr>

                              </table>
                                </asp:Panel>
                          <%---------------------Gửi tin nhắn------------------%>
                             <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                             DropShadow="True"
                               PopupControlID="GuiTinNhanPanel" TargetControlID="GuiTinNhanButton1" 
                               BackgroundCssClass="modalBackground " BehaviorID="bePopup1"
                               CancelControlID="ThoatButton1" 
                                RepositionMode="RepositionOnWindowResizeAndScroll">                              
                            </asp:ModalPopupExtender>
                              <asp:Panel ID="GuiTinNhanPanel" runat="server" Style="display: none;">
                              <table style="padding: 0px; width:300px; background-color: #FFFFFF; margin-left: 200;">
                              <tr>
                              <td style="background-color: #7FA432;">
                                  <asp:Label ID="Label5" runat="server" Text="Gửi tin nhắn " Font-Size="12pt" 
                                      Font-Bold="True" ForeColor="White"></asp:Label>
                              </td>
                              </tr>
                              <tr>
                              <td>
                                  <asp:TextBox ID="TenBanTinNhanTextBox" runat="server" Font-Size="12pt" Width="290px"></asp:TextBox></td>
                              </tr>
                                  <tr>
                                      <td>
                                          <asp:TextBox ID="NoiDungTiNhanTextBox" runat="server" Font-Size="12pt" 
                                              Height="150px" TextMode="MultiLine" Width="290px"></asp:TextBox>
                                      </td>
                                  </tr>
                              <tr>
                              <td>
                                  <table class="style2">
                                      <tr>
                                          <td>
                                              &nbsp;</td>
                                          <td>
                                              &nbsp;</td>
                                          <td>
                                              <asp:Button ID="GuiButton1" runat="server" Font-Size="12pt" Text="Gửi" onclick="GuiButton1_Click" 
                                                />
                                          </td>
                                          <td>
                                              <asp:Button ID="ThoatButton1" runat="server" Font-Size="12pt" Text="Thóat" />
                                          </td>
                                      </tr>
                                  </table>
                                  </td>
                              </tr>
                                <tr>
                                  <td>                                  
                              <asp:Label ID="ThongBaolabel1" runat="server" Text="Người bạn này không tồn tại" Font-Bold="true" Font-Size="12pt" ForeColor="Red" Visible="false"></asp:Label>
                            
                                  </td>
                                  </tr>
                              </table>
                                </asp:Panel>
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
    	Copyright © 2048  Company Name://www.iwebsitetemplate.com" target="_parent">Website Templates</a> by <a href="http://www.templatemo.com" target="_parent">Free CSS Templates</a>
      </div>
    </div><!-- End Of Container -->
<!--  Free CSS Templates by TemplateMo.com  -->
     </form>
</body>
</html>
