<%@ Page Language="C#" AutoEventWireup="true" CodeFile="quanlytuvung.aspx.cs" Inherits="tratu" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
     .style6
     {
         width: 256px;
     }
     .style7
     {
     }
     .style8
     {
         width: 31px;
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
                        Font-Size="12pt" Text=">> quản lý từ vựng"></asp:Label>         	
           	        <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="12pt" 
                        onclick="LinkButton1_Click">Đăng xuất</asp:LinkButton>         	
           	    </div>
                  <div class="templatemo_section_CauHoi_mid">   
                      <asp:ScriptManager ID="ScriptManager1" runat="server">
                      </asp:ScriptManager>
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server"  class="templatemo_section_CauHoi_mid" >
                      <ContentTemplate>
                      
                          <table class="style2" 
                              
                              style="padding: 0px; width: 650px; height: 500px; margin-left: 50px; background-color: #FFFFFF; ">
                              <tr>
                                  <td>
                                      <table class="style2">
                                          <tr>
                                              <td class="style7" bgcolor="#8FAF4A" colspan="4">
                                                  <asp:Label ID="Label30" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                      ForeColor="White" Text="QUẢN LÝ TỪ VỰNG"></asp:Label>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td class="style7">
                                                  &nbsp;</td>
                                              <td colspan="2">
                                                  <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                      Text="Từ"></asp:Label>
                                              </td>
                                              <td>
                                                  <asp:TextBox ID="TuTextBox" runat="server" Enabled="False" Font-Size="12pt" 
                                                      MaxLength="30" Width="250px"></asp:TextBox>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td class="style7">
                                                  <asp:DropDownList ID="TuDienDropDown" runat="server" 
                                                      Font-Size="12pt" 
                                                      Width="250px" 
                                                      onselectedindexchanged="TuDienDropDown_SelectedIndexChanged" 
                                                      AutoPostBack="True">
                                                  </asp:DropDownList>
                                              </td>
                                              <td colspan="2">
                                                  <asp:Label ID="Label29" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                      Text="Lọai từ"></asp:Label>
                                              </td>
                                              <td>
                                                  <asp:DropDownList ID="LoaiTuDropDown" runat="server" 
                                                      DataSourceID="LoaiTuLinqSource" DataTextField="Ten_Viet" 
                                                      DataValueField="LoaiTuID" Enabled="False" Font-Size="12pt" Width="255px">
                                                  </asp:DropDownList>
                                                  <asp:LinqDataSource ID="LoaiTuLinqSource" runat="server" 
                                                      ContextTypeName="DAO.hoctuvungLINQDataContext" EntityTypeName="" 
                                                      Select="new (LoaiTuID, Ten_Viet)" TableName="LoaiTus">
                                                  </asp:LinqDataSource>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td class="style7">
                                                  <asp:TextBox ID="TimTuTextBox" runat="server" Font-Size="12pt" MaxLength="30" 
                                                      Width="180px"></asp:TextBox>
                                                  <asp:Button ID="TimButton" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                    Text="Tìm" Width="50px" onclick="TimButton_Click" />
                                              </td>
                                              <td colspan="2">
                                                  <asp:Label ID="Label28" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                      Text="Từ điển:"></asp:Label>
                                              </td>
                                              <td>
                                                  <asp:DropDownList ID="TuDienDropDown1" runat="server" Enabled="False" 
                                                      Font-Size="12pt" Width="255px" DataSourceID="TuDienSource" 
                                                      DataTextField="TenTuDien" DataValueField="TuDienID">
                                                  </asp:DropDownList>
                                                  <asp:SqlDataSource ID="TuDienSource" runat="server" 
                                                      ConnectionString="<%$ ConnectionStrings:hoctuvungConnectionString %>" 
                                                      SelectCommand="SELECT * FROM [TuDien] WHERE ([CongDong] = @CongDong)">
                                                      <SelectParameters>
                                                          <asp:Parameter DefaultValue="True" Name="CongDong" Type="Boolean" />
                                                      </SelectParameters>
                                                  </asp:SqlDataSource>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td class="style7" rowspan="16">
                                                  <asp:ListBox ID="TuVungListBox" runat="server" AutoPostBack="True" 
                                                      Font-Size="12pt" Height="350px" 
                                                      onselectedindexchanged="TuVungListBox_SelectedIndexChanged" Width="255px">
                                                  </asp:ListBox>
                                              </td>
                                              <td colspan="2">
                                                  <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                      Text="Nghĩa từ"></asp:Label>
                                              </td>
                                              <td>
                                                  <asp:TextBox ID="NghiaTuTextBox" runat="server" Enabled="False" 
                                                      Font-Size="12pt" MaxLength="30" Width="250px"></asp:TextBox>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                      Text="Hình ảnh:"></asp:Label>
                                              </td>
                                              <td rowspan="7">
                                                  <asp:Image ID="HinhAnhImage" runat="server" Height="150px" 
                                                      ImageUrl="~/images/no_image.jpg" Width="250px" />
                                                  <asp:AsyncFileUpload ID="HinhanhFileUpLoad" runat="server" 
                                                      onuploadedcomplete="HinhanhFileUpLoad_UploadedComplete" Width="200px" />
                                              </td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  <asp:Label ID="Label26" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                      Text="Ví dụ:"></asp:Label>
                                              </td>
                                              <td rowspan="7">
                                                  <asp:TextBox ID="ViDuTextBox" runat="server" Enabled="False" Font-Size="12pt" 
                                                      Height="150px" TextMode="MultiLine" Width="250px"></asp:TextBox>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  <asp:Label ID="Label27" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                      Text="Người đăng:" Width="100px"></asp:Label>
                                              </td>
                                              <td>
                                                  <asp:Label ID="NguoiDangLabel" runat="server" Font-Size="12pt"></asp:Label>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td class="style7">
                                                  <table class="style6">
                                                      <tr>
                                                          <td>
                                                              &nbsp;</td>
                                                          <td>
                                                              <asp:Button ID="XoaButton" runat="server" Font-Size="12pt" 
                                                                  onclick="XoaButton_Click" Text="Xóa" Width="70px" />
                                                          </td>
                                                          <td>
                                                              <asp:Button ID="ThemButton" runat="server" Font-Size="12pt" Text="Thêm" 
                                                                  Width="70px" />
                                                          </td>
                                                      </tr>
                                                  </table>
                                              </td>
                                              <td>
                                              </td>
                                              <td class="style8">
                                              </td>
                                              <td>
                                                  <asp:Button ID="LuuButton" runat="server" Enabled="False" Font-Size="12pt" 
                                                      onclick="LuuButton_Click" Text="Lưu" Width="70px" />
                                                  <asp:CheckBox ID="ChinhSuaCheckBox" runat="server" AutoPostBack="True" 
                                                      Font-Size="12pt" oncheckedchanged="ChinhSuaCheckBox_CheckedChanged" 
                                                      Style="margin-left:70px" Text="Chỉnh sửa" />
                                              </td>
                                          </tr>
                                          <tr>
                                              <td class="style7">
                                                  <asp:HyperLink ID="HyperLink3" runat="server" Font-Size="12pt" ForeColor="Blue" 
                                                      NavigateUrl="~/Admin/tuvungchoduyet.aspx">Từ vựng chờ duyệt</asp:HyperLink>
                                              </td>
                                              <td>
                                                  &nbsp;</td>
                                              <td class="style8">
                                                  &nbsp;</td>
                                              <td>
                                                  &nbsp;</td>
                                          </tr>
                                      </table>
                                  </td>
                              </tr>
                          </table>

                     <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"  
                                DropShadow="True"
                               PopupControlID="ThemTuVungPanel" TargetControlID="ThemButton" 
                               BackgroundCssClass="modalBackground " BehaviorID="bePopup"                              
                                RepositionMode="RepositionOnWindowResizeAndScroll" >
                      </asp:ModalPopupExtender>
                          <asp:Panel ID="ThemTuVungPanel" runat="server" Width="350px" BackColor="White" Style="display:none">
                              <table class="style2" style="width:350px">
                                  <tr>
                                      <td bgcolor="#8EAC48" colspan="2">
                                          <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="12pt" 
                                              ForeColor="White" Text="Thêm từ vựng"></asp:Label>
                                      </td>
                                  </tr>
                                    <tr>
                                      <td>
                                          <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="12pt" 
                                              Text="Từ điển:"></asp:Label>
                                      </td>
                                      <td>
                                          <asp:TextBox ID="ThemTuDienTextBox" runat="server" Font-Size="12pt" 
                                              Width="250px" BackColor="White" ReadOnly="true"></asp:TextBox>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="12pt" 
                                              Text="Từ vựng:"></asp:Label>
                                      </td>
                                      <td>
                                          <asp:TextBox ID="ThemTuVungTextBox" runat="server" Font-Size="12pt" 
                                              Width="250px"></asp:TextBox>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="12pt" 
                                              Text="Lọai từ:"></asp:Label>
                                      </td>
                                      <td>
                                         <asp:DropDownList ID="ThemLoaiTuDropDown" runat="server" Font-Size="12pt" 
                                                      Width="255px" DataSourceID="LoaiTuLinqSource" DataTextField="Ten_Viet" 
                                                      DataValueField="LoaiTuID">
                                         </asp:DropDownList>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="12pt" 
                                              Text="Nghĩa từ"></asp:Label>
                                      </td>
                                      <td>
                                          <asp:TextBox ID="ThemNghiaTuTextBox" runat="server" Font-Size="12pt" 
                                              Width="250px"></asp:TextBox>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="12pt" 
                                              Text="Hình ảnh:"></asp:Label>
                                      </td>
                                      <td>
                                          <asp:AsyncFileUpload ID="ThemHinhanhFileUpLoad" runat="server" Width="250px" 
                                              onuploadedcomplete="ThemHinhanhFileUpLoad_UploadedComplete" />
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="12pt" 
                                              Text="Ví dụ:"></asp:Label>
                                      </td>
                                      <td rowspan="6">
                                          <asp:TextBox ID="ThemViDuTextBox" runat="server" Font-Size="12pt" 
                                              Height="150px" TextMode="MultiLine" Width="250px"></asp:TextBox>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>
                                          &nbsp;</td>
                                  </tr>
                                  <tr>
                                      <td>
                                          &nbsp;</td>
                                      <td>
                                          <table class="style2">
                                              <tr>
                                                  <td>
                                                      &nbsp;</td>
                                                  <td>
                                                      <asp:Button ID="ThemTuButton" runat="server" Font-Size="12pt" Text="Thêm" 
                                                          onclick="ThemTuButton_Click" />
                                                  </td>
                                                  <td>
                                                      <asp:Button ID="ThoatButton" runat="server" Font-Size="12pt" Text="Thóat" />
                                                  </td>
                                              </tr>
                                          </table>
                                      </td>
                                  </tr>
                              </table>
                          </asp:Panel>
                      <!-------------END InsertTuVungPanel------->

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
    	Copyright © 2048 y <a href="http://www.templatemo.com" target="_parent">Free CSS Templates</a>
      </div>
    </div><!-- End Of Container -->
<!--  Free CSS Templates by TemplateMo.com  -->
     </form>
</body>
</html>