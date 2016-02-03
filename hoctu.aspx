<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="hoctu.aspx.cs" Inherits="hoctu" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="templatemo_menu">
				<ul>
					<li><a href="index.aspx"><b>Trang chủ</b></a></li>
					<li><a href="gioithieu.aspx"><b>Giới thiệu</b></a></li>
   					<li  class="current"><a href="hoctu.aspx"><b>Học từ vựng</b></a></li>
   					<li><a href="hoidap.aspx"><b>Hỏi/Đáp</b></a></li>	
				</ul>
			</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <!-- End Of Content area top -->        
        <div id="templatemo_content_area_bottom">
          <div class="templatemo_CauHoi_section">
            	<div class="templatemo_CauHoi_Title">HỌC TỪ VỰNG </div>               
                  <div class="templatemo_section_CauHoi_mid">    
                                   
                      <asp:ScriptManager ID="ScriptManager1" runat="server">
                      </asp:ScriptManager>
                      <center>
                      <asp:Label ID="ThongBaoLabel" runat="server" 
                          Text="Bạn cần đăng nhập để thực hiện chức năng này" Font-Size="12pt" 
                          ForeColor="Blue"></asp:Label>
                          </center>
                       <!-------------------------MAIN CONTAiN------------------------->
                       <asp:UpdatePanel ID="HocTuPanel" runat="server" class="templatemo_section_CauHoi_mid">
                           <ContentTemplate>
                               <table style="width: 705px; background-color: #FFFFFF; margin-left: 50px; height: 250px;">
                                   <tr>
                                       <td bgcolor="#7AA027" style="width: 330px">
                                           <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="12pt" 
                                               ForeColor="White" Text="Chọn từ điển"></asp:Label>
                                       </td>
                                       <td rowspan="5" style="width: 5px" bgcolor="#DBDBDB">
                                           &nbsp;</td>
                                       <td bgcolor="#7AA027" colspan="3">
                                           <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="12pt" 
                                               ForeColor="White" Text="Chọn cách học từ vựng"></asp:Label>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td rowspan="3">
                                       <asp:Panel ID="TuDienPanel"  runat="server" ScrollBars="Both" Height="200px">
                                           <asp:CheckBoxList ID="TuDienCheckBoxList" runat="server" Font-Size="12pt" 
                                               Height="200px" onselectedindexchanged="TuDienCheckBoxList_SelectedIndexChanged" 
                                               Width="320px" RepeatLayout="Flow" AutoPostBack="True">
                                           </asp:CheckBoxList>
                                           </asp:Panel>
                                      
                                       </td>
                                       <td>
                                           <asp:Button ID="TracNghiemButton" runat="server" Font-Size="12pt" Height="50px" 
                                               Text="Trắc nghiệm hiểu từ" Width="180px"/>
                                       </td>
                                       <td>
                                           <asp:Label ID="Label5" runat="server" Font-Size="12pt" Text="Số câu làm bài:"></asp:Label>
                                       </td>
                                       <td>
                                           <asp:TextBox ID="SoCauTiengAnhTextBox" runat="server" Font-Size="12pt" 
                                               Width="40px">10</asp:TextBox>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <asp:Button ID="TracNghiemHinhAnhButton" runat="server" Font-Size="12pt" Height="50px" 
                                               Text="Trắc nghiệm hình ảnh" Width="180px" />
                                       </td>
                                       <td>
                                           <asp:Label ID="Label7" runat="server" Font-Size="12pt" Text="Số câu làm bài:"></asp:Label>
                                       </td>
                                       <td>
                                           <asp:TextBox ID="SoCauHinhAnhTextBox" runat="server" Font-Size="12pt" 
                                               Width="40px">10</asp:TextBox>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <asp:Button ID="GiaiOChuButton" runat="server" Font-Size="12pt" Height="50px" 
                                               Text="Giải ô chữ" Width="180px" />
                                       </td>
                                       <td colspan="2">
                                           &nbsp;</td>
                                   </tr>
                                   <tr>
                                       <td>
                                           
                                       </td>
                                       <td>
                                           &nbsp;</td>
                                       <td colspan="2">
                                           &nbsp;</td>
                                   </tr>
                               </table>                        
                      <!-------------------------END MAIN CONTAiN------------------------->
                      <!---------------------------------Trắc nghiệm tiếng anh------------------>
                               <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                PopupControlID="TracNghiemTiengAnhPanel" TargetControlID="TracNghiemButton"
                                DropShadow="true" BackgroundCssClass="modalBackground "                             
                                RepositionMode="RepositionOnWindowResizeAndScroll" >
                                
                               </asp:ModalPopupExtender>
                      <asp:Panel ID="TracNghiemTiengAnhPanel" runat="server" Width="535px" Height="435px" Style="display:none">
                      <table style="width: 540px; background-color: #FFFFFF; height: 350px;">
                      <tr>
                      <td bgcolor="#7AA027" colspan="3" style="height: 20px">
                          <asp:Label ID="Label8" runat="server" Font-Size="16pt" ForeColor="White" 
                              Text="Trắc nghiệm Tiếng Anh" Stlye="margin-top:5; margin-bottom:5" 
                              Height="25px"></asp:Label>
                          </td>
                      </tr>
                           <tr>
                               <td style="width: 5px">
                               </td>
                               <td style="height: 5px">
                                   <asp:Label ID="TracNghiemCauSoLabel" runat="server" Font-Bold="True" 
                                       Font-Size="12pt" Text="Câu số 0:"></asp:Label>
                               </td>
                               <td>
                                   &nbsp;</td>
                               
                          </tr>
                           <tr>
                      <td></td>
                      <td rowspan="7">
                          <asp:TextBox ID="TracNghiemCauHoiTextBox" runat="server" BackColor="#373737" Font-Size="13pt" 
                              ForeColor="White" Height="240px" ReadOnly="True" TextMode="MultiLine" 
                              Width="400px" Font-Bold="True"></asp:TextBox>
                               <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="2500" 
                              ontick="Timer1_Tick">
                          </asp:Timer>
                               </td>
                      <td>
                          <asp:Button ID="TracNghiemBatDauButton" runat="server" Font-Size="12pt" 
                              Height="35px" Text=" Tạo bài" Width="100px" 
                              onclick="TracNghiemBatDauButton_Click" />
                               </td>
                      </tr>
                           <tr>
                      <td></td>
                      <td>
                          &nbsp;</td>
                      </tr>
                           <tr>
                      <td></td>
                      <td>
                          <asp:Button ID="TracNghiemCauTiepButton" runat="server" Font-Size="12pt" 
                              Height="35px" Text="Câu tiếp" Width="100px" 
                              onclick="TracNghiemCauTiepButton_Click" />
                               </td>
                      </tr>
                           <tr>
                      <td></td>
                      <td>
                          &nbsp;</td>
                      </tr>
                           <tr>
                      <td></td>
                      <td>
                          <asp:Label ID="Label9" runat="server" Font-Size="12pt" Text="Đúng: " 
                              ></asp:Label>
                          <asp:Label ID="TracNghiemDungLabel" runat="server" Font-Size="12pt" Text="0"></asp:Label>
                               </td>
                      </tr>
                           <tr>
                      <td></td>
                      <td>
                          <asp:Label ID="Label10" runat="server" Font-Size="12pt" Text="Sai: "></asp:Label>
                          <asp:Label ID="TracNghiemSaiLabel" runat="server" Font-Size="12pt" Text="0"></asp:Label>
                               </td>
                      </tr>
                           <tr>
                      <td></td>
                      <td>
                          &nbsp;</td>
                      </tr>
                           <tr>
                      <td></td>
                      <td rowspan="2" style="height: 110px">
                          <asp:RadioButtonList ID="TracNghiemCauTraLoiListBox" runat="server" Height="50px" 
                              Width="400px" BorderStyle="Groove" BorderWidth="1px" Font-Size="12pt" 
                              style="margin-bottom: 0px" >
                          </asp:RadioButtonList>
                               </td>
                      <td>&nbsp;</td>
                      </tr>
                          <tr>
                              <td>
                                  &nbsp;</td>
                              <td>
                                  <asp:Button ID="TracNghiemThoatButton" runat="server" Font-Size="12pt" 
                                      Height="35px" Text="Thóat" Width="100px" 
                                      onclick="TracNghiemThoatButton_Click" />
                              </td>
                          </tr>
                      </table>
                      </asp:Panel>
                      <!------------------------Trắc nghiệm hình ảnh-------------------------------->
                               <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server"
                                PopupControlID="TracNghiemHinhAnhPanel" TargetControlID="TracNghiemHinhAnhButton"
                                DropShadow="true" BackgroundCssClass="modalBackground "                             
                                RepositionMode="RepositionOnWindowResizeAndScroll">
                               </asp:ModalPopupExtender>
                       <asp:Panel ID="TracNghiemHinhAnhPanel" runat="server" Width="535px" Height="435px" Style="display:none">
                      <table style="width: 540px; background-color: #FFFFFF; height: 350px;">
                      <tr>
                      <td bgcolor="#7AA027" colspan="3" style="height: 20px">
                          <asp:Label ID="Label1" runat="server" Font-Size="16pt" ForeColor="White" 
                              Text="Trắc nghiệm hình ảnh" Stlye="margin-top:5; margin-bottom:5" 
                              Height="25px"></asp:Label>
                          </td>
                      </tr>
                           <tr>
                               <td style="width: 5px">
                               </td>
                               <td style="height: 5px">
                                   <asp:Label ID="HinhAnhCauSoLabel" runat="server" Font-Bold="True" 
                                       Font-Size="12pt" Text="Câu số 0:"></asp:Label>
                               </td>
                               <td>
                                   &nbsp;</td>
                               
                          </tr>
                           <tr>
                      <td></td>
                      <td rowspan="7">
                          <asp:Image ID="HinhAnhCauHoiImage" runat="server" Height="240px" 
                              ImageUrl="~/images/no_image.jpg" Width="400px" />
                          <asp:Timer ID="Timer2" runat="server" Enabled="False" Interval="2500" 
                              ontick="Timer2_Tick">
                          </asp:Timer>
                               </td>
                      <td>
                          <asp:Button ID="HinhAnhBatDauButton" runat="server" Font-Size="12pt" 
                              Height="35px" onclick="HinhAnhBatDauButton_Click" Text=" Tạo bài" 
                              Width="100px" />
                               </td>
                      </tr>
                           <tr>
                      <td></td>
                      <td>
                          &nbsp;</td>
                      </tr>
                           <tr>
                      <td></td>
                      <td>
                          <asp:Button ID="HinhAnhCauTiepButton" runat="server" Font-Size="12pt" 
                              Height="35px" onclick="HinhAnhCauTiepButton_Click" Text="Câu tiếp" 
                              Width="100px" />
                               </td>
                      </tr>
                           <tr>
                      <td></td>
                      <td>
                          &nbsp;</td>
                      </tr>
                           <tr>
                      <td></td>
                      <td>
                          <asp:Label ID="Label13" runat="server" Font-Size="12pt" Text="Đúng: "></asp:Label>
                          <asp:Label ID="HinhAnhDungLabel" runat="server" Font-Size="12pt" Text="0"></asp:Label>
                               </td>
                      </tr>
                           <tr>
                      <td></td>
                      <td>
                          <asp:Label ID="Label11" runat="server" Font-Size="12pt" Text="Sai: "></asp:Label>
                          <asp:Label ID="HinhAnhSaiLabel" runat="server" Font-Size="12pt" Text="0"></asp:Label>
                               </td>
                      </tr>
                           <tr>
                      <td></td>
                      <td>
                          &nbsp;</td>
                      </tr>
                           <tr>
                      <td></td>
                      <td rowspan="2" style="height: 110px">
                          <asp:RadioButtonList ID="HinhAnhCauTraLoiRadioList" runat="server" 
                              Font-Size="12pt" Height="50px" Width="400px" BorderStyle="Groove" 
                              BorderWidth="1px">
                          </asp:RadioButtonList>
                               </td>
                      <td>&nbsp;</td>
                      </tr>
                          <tr>
                              <td>
                                  &nbsp;</td>
                              <td>
                                  <asp:Button ID="HinhAnhThoatButton" runat="server" Font-Size="12pt" 
                                      Height="35px" Text="Thóat" Width="100px" 
                                      onclick="HinhAnhThoatButton_Click" />
                              </td>
                          </tr>
                      </table>
                      </asp:Panel>
            <!---------------------------------Giải ô chữ---------------------------------->
                <asp:ModalPopupExtender ID="ModalPopupExtender3" runat="server"
                PopupControlID="GiaiOChuPanel" TargetControlID="GiaiOChuButton"
                                DropShadow="true" BackgroundCssClass="modalBackground "                             
                                RepositionMode="RepositionOnWindowResizeAndScroll">
                </asp:ModalPopupExtender>
                        <asp:Panel ID="GiaiOChuPanel" runat="server" Width="800px" Height="440px" Style="display:none">
                        <asp:Timer ID="Timer3" runat="server" ontick="Timer3_Tick" Enabled="false" 
                                Interval="2000"></asp:Timer>
                        <table style="width: 700px; background-color: #FFFFFF; height: 400px;">
                          <tr>
                        <td bgcolor="#7AA027" colspan="5">
                            <asp:Label ID="Label14" runat="server" Font-Size="16pt" ForeColor="White" 
                                Height="25px" Stlye="margin-top:5; margin-bottom:5" Text="Giải ô chữ"></asp:Label>
                        </td>
                        </tr>
                          <tr>
                        <td width="width:5px">
                        </td>
                        <td colspan="2">
                        </td>
                        <td>
                        </td>
                              <td>
                                  &nbsp;</td>
                        </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td colspan="3" rowspan="7">
                                    <asp:Panel ID="OChuConTentPanel" runat="server" Height="310px" Width="669px" 
                                        BorderStyle="Groove" BorderWidth="1px" Font-Bold="True">
                                        <asp:TextBox ID="OChu0" runat="server" BorderColor="Black" BorderStyle="Groove" 
                                            Font-Size="12pt" Height="25px" ReadOnly="True" Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu1" runat="server" BorderColor="Black" BorderStyle="Groove" 
                                            Font-Size="12pt" Height="25px" ReadOnly="True" Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu2" runat="server" BorderColor="Black" BorderStyle="Groove" 
                                            Font-Size="12pt" Height="25px" ReadOnly="True" Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu3" runat="server" BorderColor="Black" BorderStyle="Groove" 
                                            Font-Size="12pt" Height="25px" ReadOnly="True" Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu4" runat="server" BorderColor="Black" BorderStyle="Groove" 
                                            Font-Size="12pt" Height="25px" ReadOnly="True" Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu5" runat="server" BorderColor="Black" BorderStyle="Groove" 
                                            Font-Size="12pt" Height="25px" ReadOnly="True" Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu6" runat="server" BorderColor="Black" BorderStyle="Groove" 
                                            Font-Size="12pt" Height="25px" ReadOnly="True" Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu7" runat="server" BorderColor="Black" BorderStyle="Groove" 
                                            Font-Size="12pt" Height="25px" ReadOnly="True" Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu8" runat="server" BorderColor="Black" BorderStyle="Groove" 
                                            Font-Size="12pt" Height="25px" ReadOnly="True" Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu9" runat="server" BorderColor="Black" BorderStyle="Groove" 
                                            Font-Size="12pt" Height="25px" ReadOnly="True" Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu10" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu11" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu12" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu13" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu14" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu15" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu16" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu17" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu18" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu19" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu20" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <br />
                                        <asp:TextBox ID="OChu21" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu22" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu23" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu24" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu25" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu26" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu27" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu28" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu29" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu30" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu31" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu32" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu33" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu34" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu35" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu36" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu37" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu38" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu39" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu40" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu41" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <br />
                                        <asp:TextBox ID="OChu42" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu43" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu44" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu45" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu46" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu47" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu48" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu49" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu50" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu51" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu52" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu53" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu54" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu55" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu56" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu57" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu58" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu59" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu60" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu61" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu62" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <br />
                                        <asp:TextBox ID="OChu63" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu64" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu65" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu66" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu67" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu68" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu69" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu70" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox> 
                                        <asp:TextBox ID="OChu71" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu72" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu73" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu74" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu75" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu76" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu77" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu78" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu79" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu80" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu81" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu82" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu83" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <br />
                                        <asp:TextBox ID="OChu84" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu85" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu86" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu87" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu88" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu89" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu90" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu91" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu92" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu93" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu94" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu95" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu96" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu97" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu98" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu99" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu100" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu101" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu102" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu103" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu104" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <br />
                                        <asp:TextBox ID="OChu105" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu106" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu107" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu108" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu109" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu110" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu111" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu112" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu113" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu114" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu115" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu116" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu117" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu118" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu119" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu120" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu121" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu122" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu123" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu124" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu125" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <br />
                                         <asp:TextBox ID="OChu126" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu127" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu128" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu129" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu130" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu131" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu132" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu133" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu134" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu135" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu136" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu137" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu138" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu139" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu140" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu141" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu142" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu143" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu144" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu145" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu146" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <br />
                                         <asp:TextBox ID="OChu147" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu148" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu149" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu150" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu151" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu152" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu153" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu154" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu155" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu156" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu157" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu158" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu159" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu160" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu161" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu162" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu163" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu164" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu165" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu166" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu167" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <br />
                                         <asp:TextBox ID="OChu168" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu169" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu170" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu171" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu172" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu173" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu174" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu175" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu176" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu177" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu178" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu179" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu180" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu181" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu182" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu183" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu184" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu185" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu186" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu187" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu188" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <br />
                                         <asp:TextBox ID="OChu189" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu190" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu191" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu192" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu193" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu194" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu195" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu196" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu197" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu198" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu199" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu200" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu201" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu202" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu203" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu204" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu205" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu206" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu207" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu208" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                        <asp:TextBox ID="OChu209" runat="server" BorderColor="Black" 
                                            BorderStyle="Groove" Font-Size="12pt" Height="25px" ReadOnly="True" 
                                            Width="25px"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                                <td>
                                    <asp:Button ID="OChuTaoBaiButton" runat="server" Font-Size="12pt" Height="35px" 
                                        Text="Tạo ô chữ" Width="100px" onclick="OChuTaoBaiButton_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                      <asp:Button ID="GiaiToanBoOChuButton" runat="server" Font-Size="12pt" Height="35px" 
                                        Text="Giải ô chữ" Width="100px" onclick="GiaiToanBoOChuButton_Click"/></td>
                            </tr>
                          <tr>
                        <td>
                        </td>
                              <td>
                                  &nbsp;</td>
                        </tr>
                        <tr>
                        <td>
                        </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                            <tr>
                        <td>
                        </td>
                                <td>
                                    &nbsp;</td>
                        </tr>
                            <tr>
                        <td>
                        </td>
                                <td>
                                    &nbsp;</td>
                        </tr>
                            <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="OChuThoatButton" runat="server" Font-Size="12pt" Height="35px" 
                                Text="Thóat" Width="100px" />
                        </td>
                        </tr>
                            <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Label ID="Label15" runat="server" Font-Size="12pt" Text="Gợi ý: "></asp:Label>
                            <asp:DropDownList ID="OChuGoiYDropDown" runat="server" Font-Size="12pt" 
                                Width="35pt" AutoPostBack="true"
                                onselectedindexchanged="OChuGoiYDropDown_SelectedIndexChanged">
                                <asp:ListItem Value="0">1</asp:ListItem>
                                <asp:ListItem Value="1">2</asp:ListItem>
                                <asp:ListItem Value="2">3</asp:ListItem>
                                <asp:ListItem Value="3">4</asp:ListItem>
                                <asp:ListItem Value="4">5</asp:ListItem>
                                <asp:ListItem Value="5">6</asp:ListItem>
                                <asp:ListItem Value="6">7</asp:ListItem>
                                <asp:ListItem Value="7">8</asp:ListItem>
                                <asp:ListItem Value="8">9</asp:ListItem>
                                <asp:ListItem Value="9">10</asp:ListItem>
                            </asp:DropDownList>:
                             <asp:TextBox ID="OChuGoiYTextBox" runat="server" Font-Size="12pt" 
                                ReadOnly="true" BackColor="White"></asp:TextBox>   
                        </td>
                         <td>                                                       
                           </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Font-Size="12pt" Text="Trả lời: "></asp:Label>
                            <asp:TextBox ID="OChuTraLoiTextBox" runat="server" Font-Size="12pt" 
                                BackColor="White"></asp:TextBox>
                            <asp:Button ID="OChuDienVaoButton" runat="server" Text="Điền vào" 
                                Font-Size="12pt" Height="35" Width="80" onclick="OChuDienVaoButton_Click" />
                                </td>
                                <td>
                                    &nbsp;</td>
                        </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td colspan="2">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        </asp:Panel>
                      </ContentTemplate>
                   </asp:UpdatePanel>
                  <!--------------------------------------------------->
                  </div>  
          </div>
		  
        	<!-- End of Left Section -->
        	<!-- End of Right Section -->
			<div class="space"></div>
        	<div class="cleaner"></div>
      </div>
	  <!-- End Of Content area bottom -->
</asp:Content>

