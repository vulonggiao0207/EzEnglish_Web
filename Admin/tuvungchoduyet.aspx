<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tuvungchoduyet.aspx.cs" Inherits="tratu" %>

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
                              
                              
                              style="padding: 0px; width: 650px; margin-left: 50px; background-color: #FFFFFF; height: 500px; ">
                              <tr>
                                  <td>
                                      <table class="style2">
                                          <tr>
                                              <td bgcolor="#8FAF4A" class="style7" colspan="4">
                                                  <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                      ForeColor="White" Text="TỪ VỰNG CHỜ DUYỆT"></asp:Label>
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
                                                  &nbsp;</td>
                                              <td colspan="2">
                                                  <asp:Label ID="Label32" runat="server" Font-Bold="True" Font-Size="12pt" 
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
                                                  <asp:Label ID="Label33" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                      Text="Từ điển:"></asp:Label>
                                              </td>
                                              <td>
                                                  <asp:DropDownList ID="TuDienDropDown1" runat="server" 
                                                      DataSourceID="TuDienSource" DataTextField="TenTuDien" DataValueField="TuDienID" 
                                                      Enabled="False" Font-Size="12pt" Width="255px">
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
                                                  <asp:Label ID="Label34" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                      Text="Nghĩa từ"></asp:Label>
                                              </td>
                                              <td>
                                                  <asp:TextBox ID="NghiaTuTextBox" runat="server" Enabled="False" 
                                                      Font-Size="12pt" MaxLength="30" Width="250px"></asp:TextBox>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td colspan="2">
                                                  <asp:Label ID="Label35" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                      Text="Hình ảnh:"></asp:Label>
                                              </td>
                                              <td rowspan="7">
                                                  <asp:Image ID="HinhAnhImage" runat="server" Height="150px" 
                                                      ImageUrl="~/images/no_image.jpg" Width="250px" />
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
                                                  <asp:Label ID="Label36" runat="server" Font-Bold="True" Font-Size="12pt" 
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
                                                  <asp:Label ID="Label37" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                      Text="Người đăng:" Width="100px"></asp:Label>
                                              </td>
                                              <td>
                                                  <asp:Label ID="NguoiDangLabel" runat="server" Font-Size="12pt"></asp:Label>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td class="style7">
                                                  &nbsp;</td>
                                              <td>
                                              </td>
                                              <td class="style8">
                                              </td>
                                              <td>
                                                  <asp:Button ID="DongYButton" runat="server" Font-Size="12pt" Text="Đồng ý" 
                                                      Style="margin-left:20px" onclick="DongYButton_Click"/>
                                                  <asp:Button ID="TuChoiButton" runat="server" Font-Size="12pt" 
                                                      onclick="TuChoiButton_Click" Style="margin-left:20px" Text="Từ chối" />
                                              </td>
                                          </tr>
                                          <tr>
                                              <td class="style7">
                                                  <asp:HyperLink ID="HyperLink5" runat="server" Font-Size="12pt" ForeColor="Blue" 
                                                      NavigateUrl="~/Admin/quanlytuvung.aspx">Quản lý từ vựng</asp:HyperLink>
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

                      <br />
                          <br />

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
    	Copyright © 2048    href="#">Your Company Name</a> | <a href="http://www.iwebsitetemplate.com" target="_parent">Website Templates</a> by <a href="http://www.templatemo.com" target="_parent">Free CSS Templates</a>
      </div>
    </div><!-- End Of Container -->
<!--  Free CSS Templates by TemplateMo.com  -->
     </form>
</body>
</html>