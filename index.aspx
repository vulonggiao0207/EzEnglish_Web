<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div id="templatemo_menu">
				<ul>
					<li class="current"><a href="#"><b>Trang chủ</b></a></li>
					<li><a href="gioithieu.aspx"><b>Giới thiệu</b></a></li>
   					<li><a href="hoctu.aspx"><b>Học từ vựng</b></a></li>
   					<li><a href="hoidap.aspx"><b>Hỏi/Đáp</b></a></li>	
				</ul>
			</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="templatemo_content_area_bottom">
          <div class="templatemo_left_section">
            	<div class="templatemo_title">LIÊN KẾT </div>
                <div class="templatemo_section">
                	<div class="templatemo_section_top">
                    </div>
                    <div class="templatemo_section_mid">
                     
                     <p><a href="http://m.tratu.soha.vn/" target="_parent">Từ điển soha</a>
                       </p>  
                       <br />

                      <p><a href="http://vdict.com" target="_parent">Từ điển vdict.com </a>
                       </p>  
                        <br />
                       
                     <p><a href="http://anhvan123.net/" target="_parent">Anh Văn 123 </a>
                        </p>  
                         <br />
                       
                     <p><a href="http://tienganhonline.com" target="_parent">Học tiếng Anh Online</a>
                        </p>  
                         <br />
                       
                     <p><a href="http://hoctienganh.vn" target="_parent">Major English Center </a>
                       </p>  
                        <br />

                      <p><a href="http://apollo.edu.vn" target="_parent">Trung Tâm Anh Ngữ Apollo </a>
                       </p>  
                        <br />
                       
                      <p><a href="http://www.dhspttnn1.edu.vn" target="_parent">Trung Tâm Ngọai Ngữ Đại Học Sư Phạm </a>
                       </p>  
                        <br />

                      <p><a href="http://www.ilavietnam.com" target="_parent">Trung Tâm Ngọai Ngữ Ila </a>
                       </p>  
                        <br />

                        
                    <p><a href="   http://www.utflc.edu.vn/" target="_parent">Trung tâm Ngọai Ngữ ĐH Bách Khoa </a>
                       </p>  
                        <br />

                      <p><a href="http://www.petalia.org/Englishpage.htm" target="_parent">Website học tiếng Anh petalia </a>
                       </p>  
                        <br />

                      <p><a href="http://tienganhabc.com" target="_parent">Website học tiếng Anh tienganhabc  </a>
                       </p>  
                        <br />

                    <p><a href="http://aroma.vn/" target="_parent">Website học tiếng Anh cho người đi làm </a>
                       </p>  
                        <br />
                     
                

                         
                      

                     </div>
				  
                    <div class="templatemo_section_bottom">
                    </div>
                </div>
                
          </div>
        	<!-- End of Left Section -->
            
            <div class="templatemo_right_section">
           	  <div class="tempatemo_section_box_1">
                	<h1>CÂU HỎI MỚI </h1>
                     <asp:BulletedList ID="CauHoiMoiList" runat="server" 
                        Font-Size="12pt" onclick="CauHoiMoiList_Click" 
                        DataSourceID="CauHoiMoiNhatSource" DataTextField="TieuDe" 
                        DataValueField="CauHoiID" DisplayMode="LinkButton">
                     </asp:BulletedList>
   	                <asp:SqlDataSource ID="CauHoiMoiNhatSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:hoctuvungConnectionString %>" 
                        SelectCommand="SELECT TOP (10) CauHoiID, TieuDe, NoiDung, taikhoan, NgayGoi FROM CauHoi_DienDan ORDER BY NgayGoi DESC">
                    </asp:SqlDataSource>
   	          </div>
              <div class="tempatemo_section_box_2">
                	<h1>CÂU TRẢ LỜI MỚI </h1>
                       <asp:BulletedList ID="CauTLMoiList" runat="server" DisplayMode="LinkButton" 
                        Font-Size="12pt" onclick="CauTLMoiList_Click" 
                        DataSourceID="CauTraLoiMoiSource" DataTextField="TieuDe" 
                        DataValueField="CauHoiID">
                     </asp:BulletedList>
                    <asp:SqlDataSource ID="CauTraLoiMoiSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:hoctuvungConnectionString %>" SelectCommand="SELECT TOP (10) a.CauHoiID, TieuDe, a.NoiDung, a.taikhoan, a.NgayGoi 
FROM CauHoi_DienDan a INNER JOIN TraLoi_DienDan b ON a.CauHoiID=b.CauHoiID
ORDER BY b.NgayGoi DESC"></asp:SqlDataSource>
              </div>
                <div class="tempatemo_right_bottom">
                </div>
            </div><!-- End of Right Section -->
            
            <div class="cleaner"></div>

      </div><!-- End Of Content area bottom -->
</asp:Content>

