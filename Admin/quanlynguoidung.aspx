<%@ Page Language="C#" AutoEventWireup="true" CodeFile="quanlynguoidung.aspx.cs" Inherits="tratu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>hoctuvung.com</title>
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
            	<div class="templatemo_CauHoi_Title">  <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#00000C" 
                        Font-Size="12pt" NavigateUrl="~/Admin/quantri.aspx">quản trị</asp:HyperLink>    
                    <asp:Label ID="Label2" runat="server" ForeColor="#00000C" 
                        Font-Size="12pt" Text=">> quản lý người dùng"></asp:Label>         	
           	        <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="12pt" 
                        onclick="LinkButton1_Click">Đăng xuất</asp:LinkButton>       	
           	    </div>
                  <div class="templatemo_section_CauHoi_mid">   
                      <asp:ScriptManager ID="ScriptManager1" runat="server">
                      </asp:ScriptManager>
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server"  class="templatemo_section_CauHoi_mid" >
                      <ContentTemplate>                      
                      <table class="style2" 
                              style="padding: 0px; width: 400px; margin-left: 200px; background-color: #FFFFFF; ">
                      <tr>
                      <td bgcolor="#8CAD45" colspan="2">
                          <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="12pt" 
                              ForeColor="White" Text="QUẢN LÝ NGƯỜI DÙNG"></asp:Label>
                          </td>
                      </tr>
                      <tr>
                      <td>
                          <asp:TextBox ID="TimTenTextBox" runat="server" Font-Size="12pt" Width="300px"></asp:TextBox>
                          </td>
                      <td>
                          <asp:Button ID="TimTenButton" runat="server" Font-Size="12pt" Text="Tìm" 
                              onclick="TimTenButton_Click" Width="80px" />
                          </td>
                      </tr>
                      <tr>
                      <td colspan="2">
                      <asp:Panel ID="nguoidungPanel" runat="server" Height="250px" 
                              ScrollBars="Horizontal">
                          <asp:GridView ID="NguoiDungGridView" runat="server" Font-Size="12pt" 
                              Width="375px" AutoGenerateColumns="False" DataKeyNames="TaiKhoan" 
                              onrowcreated="NguoiDungGridView_RowCreated" BorderStyle="Groove" 
                              BorderWidth="1px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                              ShowHeader="False">
                              <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                              <Columns>
                                  <asp:BoundField DataField="TaiKhoan" HeaderText="Tài khỏan" />
                                  <asp:TemplateField HeaderText="Banned">
                                      <ItemTemplate>
                                          <asp:Button ID="BannedButton" runat="server" Font-Size="12pt" 
                                              oncommand="BannedButton_Command" Width="90px" />
                                      </ItemTemplate>
                                      <ItemStyle Width="90px" />
                                  </asp:TemplateField>
                              </Columns>
                              <EditRowStyle BackColor="#999999" />
                              <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                              <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                              <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                              <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                              <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                              <SortedAscendingCellStyle BackColor="#E9E7E2" />
                              <SortedAscendingHeaderStyle BackColor="#506C8C" />
                              <SortedDescendingCellStyle BackColor="#FFFDF8" />
                              <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                          </asp:GridView>
                          </asp:Panel>
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