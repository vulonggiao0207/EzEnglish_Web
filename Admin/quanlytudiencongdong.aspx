<%@ Page Language="C#" AutoEventWireup="true" CodeFile="quanlytudiencongdong.aspx.cs" Inherits="tratu" %>

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
            	<div class="templatemo_CauHoi_Title"><asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#00000C" 
                        Font-Size="12pt" NavigateUrl="~/Admin/quantri.aspx">quản trị</asp:HyperLink>    
                    <asp:Label ID="Label2" runat="server" ForeColor="#00000C" 
                        Font-Size="12pt" Text=">> quản lý từ điển cộng đồng"></asp:Label>         	
           	        <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="12pt" 
                        onclick="LinkButton1_Click">Đăng xuất</asp:LinkButton>      	
           	    </div>
                  <div class="templatemo_section_CauHoi_mid">   
                      <asp:ScriptManager ID="ScriptManager1" runat="server">
                      </asp:ScriptManager>
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server"  class="templatemo_section_CauHoi_mid" >
                      <ContentTemplate>
                      
                      <table class="style2" style="padding: 0px; width: 400px; margin-left: 200px; background-color: #FFFFFF; ">
                      <tr>
                      <td bgcolor="#8EAC48" colspan="6">
                          <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="12pt" 
                              ForeColor="White" Text="QUẢN LÝ TỪ ĐIỂN CỘNG ĐỒNG"></asp:Label>
                          </td>
                      </tr>
                        <tr>
                      <td colspan="4">
                          <asp:TextBox ID="TimTuDienTextBox" runat="server" Font-Size="12pt" 
                              Width="260px"></asp:TextBox>
                            </td>
                            <td colspan="2">
                                <asp:Button ID="TimButton" runat="server" Font-Size="12pt" 
                                    onclick="TimButton_Click" Text="Tìm" Width="80px" />
                            </td>
                      </tr>
                        <tr>
                      <td colspan="6">
                          <asp:ListBox ID="TuDienList" runat="server" Font-Size="12pt" 
                              Height="200px" Width="395px"></asp:ListBox>
                            </td>
                      </tr>

                       
                        <tr>
                      <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="ThemButton" runat="server" Font-Size="12pt" Text="Thêm" 
                                    Width="80px" />
                            </td>
                            <td>
                                <asp:Button ID="XoaButton" runat="server" Font-Size="12pt" Text="Xóa" 
                                    Width="80px" onclick="XoaButton_Click" />
                            </td>
                      <td colspan="2">
                          <asp:Button ID="SuaButton" runat="server" Font-Size="12pt" Text="Sửa" 
                              Width="80px" onclick="SuaButton_Click" />
                            </td>
                      <td>&nbsp;</td>
                      </tr>                       
                      </table>
                      <!---------------------CÁC MODALPOPUP------------------------->
                          <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                           DropShadow="True"
                               PopupControlID="ThemTuDienPanel" TargetControlID="ThemButton" 
                               BackgroundCssClass="modalBackground " BehaviorID="bePopup"
                               CancelControlID="ThoatButton1" 
                                RepositionMode="RepositionOnWindowResizeAndScroll">

                          </asp:ModalPopupExtender>
                          <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                             DropShadow="True"
                               PopupControlID="SuaTuDienPanel" TargetControlID="SuaButton" 
                               BackgroundCssClass="modalBackground " BehaviorID="bePopup2"
                               CancelControlID="ThoatButton2"
                                RepositionMode="RepositionOnWindowResizeAndScroll">
                          </asp:ModalPopupExtender>
                        
                     
                      <!----------------------------THÊM TỪ ĐIỂN PANEL------------------------------>
                        <!-- THÊM TỪ ĐIỂN PANEL -->                            
                      <asp:Panel ID="ThemTuDienPanel" runat="server" BackColor="White" Width="300px" 
                          Style="display: none;" >
                        <table width="300">
                             <tr>
                                <td bgcolor="#749C1F" colspan="3">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="12pt" 
                                        ForeColor="White" Text="Thêm từ điển"></asp:Label>
                                 </td>
                             </tr>
                               <tr>
                                <td colspan="3">
                                    <asp:TextBox ID="TenTuDienMoiTextBox" runat="server" Width="290px"></asp:TextBox>
                                   </td>
                             </tr>
                                 <tr>
                                <td>&nbsp;
                                    </td>
                                    <td>
                                        <asp:Button ID="ThemTuDienButton1" runat="server" Font-Size="12pt" 
                                            Text="Thêm" onclick="ThemTuDienButton1_Click" />
                                     </td>
                                 <td>
                                     <asp:Button ID="ThoatButton1" runat="server" Font-Size="12pt" Text="Thóat" />
                                     </td>
                             </tr>
                             <tr>
                                 <td colspan="3">
                                     <asp:Label ID="KhongTheThemLabel" runat="server" Font-Size="12pt" ForeColor="Red" 
                                         Text="Không thể thêm hoặc Từ điển đã tồn tại" Visible="False"></asp:Label>
                                 </td>
                             </tr>
                       </table>
                      </asp:Panel>
                      <!-- SỬA TỪ ĐIỂN PANEL -->
                      
                       <asp:Panel ID="SuaTuDienPanel" runat="server" BackColor="White" Width="300px" 
                          Style="display: none;">
                       <table width="300">
                             <tr>
                                <td bgcolor="#749C1F" colspan="3">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="12pt" 
                                        ForeColor="White" Text="Sửa từ điển"></asp:Label>
                                 </td>
                             </tr>
                               <tr>
                                <td colspan="3">
                                    <asp:TextBox ID="TenTuDienSuaTextBox" runat="server" Width="290px"></asp:TextBox>
                                   </td>
                             </tr>

                             <tr>
                                 <td>&nbsp;
                                     </td>
                                 <td>
                                     <asp:Button ID="SuaTuDienButton1" runat="server" Font-Size="12pt" Text="Sửa" 
                                         onclick="SuaTuDienButton1_Click" />
                                 </td>
                                 <td>
                                     <asp:Button ID="ThoatButton2" runat="server" Font-Size="12pt" Text="Thóat" />
                                 </td>
                             </tr>

                             <tr>
                                 <td colspan="3">
                                     <asp:Label ID="KhongTheSuaLabel" runat="server" Font-Size="12pt" ForeColor="Red" 
                                         Text="Không thể sửa hoặc Từ điển đã tồn tại" Visible="False"></asp:Label>
                                 </td>
                             </tr>

                             
                       </table>
                      </asp:Panel>
                      <!-----------------------------END PANEL------------------------------>
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