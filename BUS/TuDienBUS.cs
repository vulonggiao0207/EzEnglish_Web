using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using BO;
namespace BUS
{
    public class TuDienBUS
    {
        NguoiDungBUS nguoidungBUS = new NguoiDungBUS();
        TuDienDAO tudienDAO = new TuDienDAO();
        #region Lấy danh sách từ điển của một [taikhoan]
        public TuDienCollection LayDSTuDien(string taikhoan)
        {
            try 
            {
                return tudienDAO.SelectTuDien(taikhoan);
            }
            catch
            {
                return null;
            }
        }
        #endregion

        #region Thêm một từ điển mới
        public bool ThemTuDien(string taikhoan, string tentudien, bool congdong)
        {
            try 
            {
                TuDienBO tdBO= new TuDienBO();
                tdBO.CongDong=congdong;
                tdBO.TenTuDien=tentudien;
                tdBO.TaiKhoan=taikhoan;
                tudienDAO.InsertTuDien(tdBO);
                return true;
            }
            catch 
            { 
                return false; 
            }
        }
        #endregion

        #region Sửa một từ điển
        public bool SuaTuDien(string tudienID, string taikhoan, string tentudien, bool congdong)
        {
            try
            {
                TuDienBO tdBO = new TuDienBO();
                tdBO.TuDienID = tudienID;
                tdBO.CongDong = congdong;
                tdBO.TenTuDien = tentudien;
                tdBO.TaiKhoan = taikhoan;
                tudienDAO.UpdateTuDien(tdBO);
                return true;
            }
            catch { return false; }
        }
        #endregion

        #region Xóa một từ điển
        public bool XoaTuDien(string tudienID)
        {

            try 
            {
                tudienDAO.DeleteTuDien(tudienID);
                return true;
            }
            catch 
            {
                return false;
            }
        }
        #endregion

        #region Thêm người dùng vào từ điển
        public bool ThemNguoidung_TuDien(string tudienid, string taikhoan)
        {
            try
            {
                if (nguoidungBUS.KTTrung(taikhoan) == true)
                {
                    tudienDAO.InsertNguoidung_TuDien(tudienid, taikhoan);
                    return true;
                }
                return false;
            }
            catch {
                return false;
            }
        }
        #endregion

        #region Lấy quyền của nguời dùng
        public TuDienBO Lay_NguoiDung_Quyen(string tudienID, string taikhoan)
        {
            try
            {
                return tudienDAO.Select_NguoiDung_Quyen(tudienID, taikhoan);
            }
            catch
            {
                return null;
            }
        }
        #endregion

        #region Cập nhật lại quyền của [ngừơi dùng] trên [từ điển]
        public bool Sua_NguoiDung_Quyen(string tudienID, string taikhoan, bool xem, bool them, bool xoa, bool sua)
        {
            try
            {
                TuDienBO tudienBO = new TuDienBO();
                tudienBO.TuDienID = tudienID;
                tudienBO.TaiKhoan = taikhoan;
                tudienBO.Xem = xem;
                tudienBO.Them = them;
                tudienBO.Xoa = xoa;
                tudienBO.Sua = sua;
                tudienDAO.Update_NguoiDung_Quyen(tudienBO);
                return true;
            }
            catch
            {
                return false;
            }
        }
        #endregion

          /////////Chọn lọai từ điển///////////
        public TuDienCollection LayDSTuDien_LienKet(string taikhoan)
        {
            try
            {
                return tudienDAO.SelectTuDien_LienKet (taikhoan);
            }
            catch
            {
                return null;
            }
        }
        public TuDienCollection LayDSTuDien_CongDong(string tentudien)
        {

            try
            {
                return tudienDAO.SelectTuDien_CongDong(tentudien);
            }
            catch
            {
                return null;
            }
        }
    
    }
}
