<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="hoidap.aspx.cs" Inherits="hoidap" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="templatemo_menu">
				<ul>
					<li><a href="index.aspx"><b>Trang chủ</b></a></li>
					<li><a href="gioithieu.aspx"><b>Giới thiệu</b></a></li>
   					<li><a href="hoctu.aspx"><b>Học từ vựng</b></a></li>
   					<li class="current"><a href="#"><b>Hỏi/Đáp</b></a></li>	
				</ul>
			</div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <div id="templatemo_content_area_bottom">
    <div class="templatemo_CauHoi_section">
            	<div class="templatemo_CauHoi_Title">CÂU TRẢ LỜI MỚI NHẤT             	 
           	    </div>               
                  <div class="templatemo_section_CauHoi_mid">   
                      <asp:DataList ID="DataList2" runat="server" Width="800px" 
                          DataSourceID="CauHoiMoiSource">
                          <ItemTemplate>
                              
                              <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="12pt" 
                                  NavigateUrl='<%#"hoidapchitiet.aspx?id="+ Eval("CauHoiID").ToString() %>' 
                                  Text='<%# Eval("TieuDe") %>' Width="800px">                                 
                                </asp:HyperLink>   <asp:Label ID="Label2" runat="server" Text="ngừơi đăng:"></asp:Label>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("taikhoan") %>'></asp:Label>
                          </ItemTemplate>
                      </asp:DataList>
                      <asp:SqlDataSource ID="CauHoiMoiSource" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:hoctuvungConnectionString %>" SelectCommand="SELECT  Top 15  a.CauHoiID,TieuDe,a.taikhoan,b.NgayGoi
FROM  CauHoi_DienDan a INNER  JOIN TraLoi_DienDan b ON a.CauHoiID=b.CauHoiID
ORDER BY b.NgayGoi DESC"></asp:SqlDataSource>
                  </div>  
          </div>
          	<div class="space"></div>
        	<div class="cleaner"></div>
          <div class="templatemo_CauHoi_section">
            	<div class="templatemo_CauHoi_Title">CÂU HỎI MỚI       
                    <asp:Button ID="DangCauHoiMoiButton" runat="server" Text="Đăng câu hỏi mới" 
                        Font-Size="12pt" onclick="DangCauHoiMoiButton_Click" Width="150px" />       	 
           	    </div>
               
                  <div class="templatemo_section_CauHoi_mid">   
                      <asp:DataList ID="DataList1" runat="server" Width="800px" 
                          DataSourceID="CauHoiSource">
                          <ItemTemplate>
                              
                              <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="12pt" 
                                  NavigateUrl='<%#"hoidapchitiet.aspx?id="+ Eval("CauHoiID").ToString() %>' 
                                  Text='<%# Eval("TieuDe") %>' Width="800px">
                                 
                               </asp:HyperLink> <asp:Label ID="Label2" runat="server" Text="ngừơi đăng:"></asp:Label>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("taikhoan") %>'></asp:Label>
                          </ItemTemplate>
                      </asp:DataList>
                   
                      <asp:SqlDataSource ID="CauHoiSource" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:hoctuvungConnectionString %>" 
                          SelectCommand="SELECT * FROM [CauHoi_DienDan] ORDER BY [NgayGoi] DESC">
                      </asp:SqlDataSource>
                   
                  </div>  
          </div>
		  
        	<!-- End of Left Section -->
        	<!-- End of Right Section -->
			<div class="space"></div>
        	<div class="cleaner"></div>
      </div>
	  <!-- End Of Content area bottom -->
</asp:Content>

