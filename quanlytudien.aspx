<%@ Page Language="C#" AutoEventWireup="true" CodeFile="quanlytudien.aspx.cs" Inherits="quanlytudien" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
               <asp:ScriptManager ID="ScriptManager2" runat="server">
                      </asp:ScriptManager>
        <div id="templatemo_content_area_bottom">
          <div class="templatemo_CauHoi_section">
            	<div class="templatemo_CauHoi_Title">
            	     <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/taikhoan.aspx" ForeColor="White" Font-Size="13"> TÀI KHỎAN CÁ NHÂN</asp:HyperLink> >> QUẢN LÝ TỪ ĐIỂN          	
           	    </div>    
                <div class="templatemo_section_CauHoi_mid">     
                <asp:UpdatePanel ID="updatepanel1" runat="server" class="templatemo_section_CauHoi_mid">
                <ContentTemplate>
                                
                      <table class="style2" 
                          
                          
                          style="border: medium groove #DFDADA; width: 580px; margin-left: 100px; background-color: #FFFFFF; ">
                       <tr>
                            <td bgcolor="#749C1F" colspan="2">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="12pt" 
                                    ForeColor="White" Text="Từ điển"></asp:Label>
                            </td>
                            <td bgcolor="#749C1F">
                                <asp:Button ID="ThemTuDienButton" runat="server" Font-Size="12pt" Text="Thêm" />
                            </td>
                            <td bgcolor="#DBDBDB" rowspan="3" width="5">&nbsp;</td>
                            <td bgcolor="#749C1F" colspan="2">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="12pt" 
                                    ForeColor="White" Text="Người sử dụng"></asp:Label>
                            </td>
                            <td bgcolor="#749C1F">
                                <asp:Button ID="ThemNguoiDungButton" runat="server" Font-Size="12pt" 
                                    Text="Thêm"  />
                            </td>
                           
                       </tr>
                       <tr>
                            <td colspan="3" style="padding: 0px">
                                <asp:ListBox ID="TuDienList" runat="server" Font-Size="12pt" Height="300px" 
                                    Width="273px" onselectedindexchanged="TuDienList_SelectedIndexChanged" 
                                    AutoPostBack="True"></asp:ListBox>
                            </td>
                            <td colspan="3">
                          <%--  <asp:UpdatePanel ID="NguoiDungUp" runat="server">
                            <ContentTemplate>--%>
                                <asp:ListBox ID="NguoisudungList" runat="server" Font-Size="12pt" 
                                    Height="300px" Width="273px" 
                                    onselectedindexchanged="NguoisudungList_SelectedIndexChanged" 
                                    AutoPostBack="True"></asp:ListBox>
                           <%-- </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="TuDienList" 
                                        EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>--%>
                            </td>
                           
                       </tr>
                       <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="XoaTuDienButton" runat="server" Font-Size="12pt" Text="Xóa" 
                                    onclick="XoaTuDienButton_Click" />
                            </td>
                            <td>
                                <asp:Button ID="SuaTuDienButton" runat="server" Font-Size="12pt" Text="Sửa" 
                                    />
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="XoaNguoiSuDungButton" runat="server" Font-Size="12pt" 
                                    Text="Xóa" onclick="XoaNguoiSuDungButton_Click" />
                            </td>
                            <td>&nbsp;</td>
                       </tr>         
                                   
                      </table>
                      <asp:Panel ID="QuyenPanel" runat="server" Style="display:none">
                                    <asp:CheckBox ID="XemCheckBox" runat="server" Font-Size="12pt" Text="Xem" 
                                        AutoPostBack="True" oncheckedchanged="XemCheckBox_CheckedChanged" />
                                      <br />
                                    <asp:CheckBox ID="ThemCheckBox" runat="server" Font-Size="12pt" Text="Thêm" 
                                        AutoPostBack="True" oncheckedchanged="ThemCheckBox_CheckedChanged" />
                                    <br />
                                    <asp:CheckBox ID="XoaCheckBox" runat="server" Font-Size="12pt" Text="Xóa" 
                                        AutoPostBack="True" oncheckedchanged="XoaCheckBox_CheckedChanged" />
                                    <br />
                                    <asp:CheckBox ID="SuaCheckBox" runat="server" Font-Size="12pt" Text="Sửa" 
                                        AutoPostBack="True" oncheckedchanged="SuaCheckBox_CheckedChanged" />
                                  
                                </asp:Panel>
                       <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                               DropShadow="True"
                               PopupControlID="ThemTuDienPanel" TargetControlID="ThemTuDienButton" 
                               BackgroundCssClass="modalBackground " BehaviorID="bePopup"
                               CancelControlID="ThoatButton1" 
                                RepositionMode="RepositionOnWindowResizeAndScroll" >
                            </asp:ModalPopupExtender>

                            <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                               DropShadow="True"
                               PopupControlID="SuaTuDienPanel" TargetControlID="SuaTuDienButton" 
                               BackgroundCssClass="modalBackground " BehaviorID="bePopup2"
                               CancelControlID="ThoatButton2"
                                RepositionMode="RepositionOnWindowResizeAndScroll">
                      </asp:ModalPopupExtender>

                      <asp:ModalPopupExtender ID="ModalPopupExtender3" runat="server"
                               DropShadow="True"
                               PopupControlID="ThemNguoiDungPanel" TargetControlID="ThemNguoiDungButton" 
                               BackgroundCssClass="modalBackground " BehaviorID="bePopup3"
                               CancelControlID="ThoatButton3" 
                                RepositionMode="RepositionOnWindowResizeAndScroll" >
                            </asp:ModalPopupExtender>
                   
                                      
                </ContentTemplate>
               </asp:UpdatePanel>  
                       <!-------------------------------------------- CÁC MODALPOPUP -------------------------------------->
                       
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
                      <!-- THÊM NGƯỜI DÙNG PANEL -->
                            
                       <asp:Panel ID="ThemNguoiDungPanel" runat="server" BackColor="White" 
                          Width="305px" Style="display: none;">
                         <table width="300">
                             <tr>
                             <td bgcolor="#749C1F" colspan="3">
                                 <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="12pt" 
                                     ForeColor="White" Text="Thêm ngừơi dùng" Width="300px"></asp:Label>
                                 </td>
                             </tr>
                               <tr>
                                   <td colspan="3">&nbsp;
                                       </td>
                             </tr>
                             <tr>
                                 <td colspan="3">
                                     <asp:ListBox ID="NguoiDungListBox" runat="server" Font-Size="12pt" 
                                         Width="295px" Height="200px"></asp:ListBox>
                                 </td>
                             </tr>
                             <tr>
                                 <td colspan="3">
                                 <hr />
                                     <asp:TextBox ID="TenNguoiDungMoiTextBox" runat="server" Width="290px"></asp:TextBox>
                                 </td>
                             </tr>
                             <tr>
                                 <td>&nbsp;
                                     </td>
                                 <td>
                                     <asp:Button ID="ThemNguoiDungButton1" runat="server" Font-Size="12pt" 
                                         Text="Thêm" onclick="ThemNguoiDungButton1_Click" />
                                 </td>
                                 <td>
                                     <asp:Button ID="ThoatButton3" runat="server" Font-Size="12pt" Text="Thóat" />
                                 </td>
                             </tr>
                             <tr>
                                 <td colspan="3">
                                     <asp:Label ID="KhongTheThemLabel1" runat="server" Font-Size="12pt" ForeColor="Red" 
                                         Text="Ngừơi dùng không tồn tại" Visible="False"></asp:Label>
                                 </td>
                             </tr>
                       </table>
            </asp:Panel>
           
 <!-------------------------------------------- CÁC MODALPOPUP -------------------------------------->
       
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
