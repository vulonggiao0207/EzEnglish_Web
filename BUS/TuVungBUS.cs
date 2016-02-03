using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using BO;
namespace BUS
{
    public class TuVungBUS
    {
        TuVungDAO tuvungDAO = new TuVungDAO();
        public TuVungCollection LayDSTuVung(string tudienID)
        {
            try
            {
                return tuvungDAO.SelectTuVung(tudienID);
            }
            catch
            {
                return null;
            }
        }
        public TuVungCollection LayDSTuVung_CongDong()
        {
            try
            {
                return tuvungDAO.SelectAllTuVung_CongDong();
            }
            catch
            {
                return null;
            }
        }
        public TuVungCollection LayDSTuVung_CongDong(string tuvung,string tudienID)
        {
            try
            {
                return tuvungDAO.SelectTuVung_CongDong(tuvung,tudienID);
            }
            catch
            {
                return null;
            }
        }
        public TuVungCollection LayDSTuVung_CaNhan(string tuvung, string taikhoan, string tudienID)
        {
            try
            {
                return tuvungDAO.SelectTuVung_CaNhan(tuvung, taikhoan,tudienID);
            }
            catch
            {
                return null;
            }
        }
        public TuVungCollection LayDSTuVung_LienKet(string tuvung, string taikhoan, string tudienID)
        {
            try
            {
                return tuvungDAO.SelectTuVung_LienKet(tuvung, taikhoan,tudienID);
            }
            catch
            {
                return null;
            }
        }
        public TuVungCollection LayDSTuVung_Eng(string tu, string taikhoan)
        {
            try {
                return tuvungDAO.SelectTuVung_Eng(tu, taikhoan);
            }
            catch {
                return null;
            }
        }
        public TuVungCollection LayDSTuVung_Viet(string tu, string taikhoan)
        {
            try {
                return tuvungDAO.SelectTuVung_Viet(tu, taikhoan);
            }
            catch {
                return null;
            }
        }
        public TuVungCollection LayDSTuVungChoDuyet(string tuvung)
        {
            try
            {
                return tuvungDAO.SelectTuVungChoDuyet(tuvung);
            }
            catch
            {
                return null;
            }
        }

        public TuVungBO Lay_ChiTiet_TuVung(string tuvungID)
        {
            try
            {
                return tuvungDAO.SelectOneTuVung(tuvungID);
            }
            catch
            {
                return null;
            }
        }
        public bool ThemTuVung(int LoaiTuID, string TuVung, string NghiaTu, string Hinhanh, string ViDu, string TaiKhoan, 
            int SoLanSuDung, int SoLanSai, string TuDienID,bool KiemDuyet,int to)
        {
            try
            {
                TuVungBO tuvungBO = new TuVungBO();
                tuvungBO.LoaiTuID = LoaiTuID;
                tuvungBO.TuVung = TuVung;
                tuvungBO.NghiaTu = NghiaTu;
                tuvungBO.HinhAnh = Hinhanh;
                tuvungBO.ViDu = ViDu;
                tuvungBO.TaiKhoan = TaiKhoan;
                tuvungBO.SoLanSai = SoLanSai;
                tuvungBO.SoLanSuDung = SoLanSuDung;
                tuvungBO.TuDienID = TuDienID;
                tuvungBO.KiemDuyet = KiemDuyet;
                tuvungDAO.InsertTuVung(tuvungBO, to);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool ThemTuVung(int LoaiTuID, string TuVung, string NghiaTu, string Hinhanh, string ViDu, string TaiKhoan,
          int SoLanSuDung, int SoLanSai, string TuDienID, bool KiemDuyet)
        {
            try
            {
                TuVungBO tuvungBO = new TuVungBO();
                tuvungBO.LoaiTuID = LoaiTuID;
                tuvungBO.TuVung = TuVung;
                tuvungBO.NghiaTu = NghiaTu;
                tuvungBO.HinhAnh = Hinhanh;
                tuvungBO.ViDu = ViDu;
                tuvungBO.TaiKhoan = TaiKhoan;
                tuvungBO.SoLanSai = SoLanSai;
                tuvungBO.SoLanSuDung = SoLanSuDung;
                tuvungBO.TuDienID = TuDienID;
                tuvungBO.KiemDuyet = KiemDuyet;
                tuvungDAO.InsertTuVung(tuvungBO);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool XoaTuVung(string TuVungID)
        {
            try
            {
                tuvungDAO.DeleteTuVung(TuVungID);
                return true; }
            catch
            { return false; }
        }
        public bool CapNhatTuVung(string tuvungID,int LoaiTuID, string TuVung, string NghiaTu, string Hinhanh, string ViDu, string TaiKhoan,
            int SoLanSuDung, int SoLanSai, string TuDienID,bool KiemDuyet, int to, bool hasimage)
        {
            try
            {

                TuVungBO tuvungBO = new TuVungBO();
                tuvungBO.TuVungID = tuvungID;
                tuvungBO.LoaiTuID = LoaiTuID;
                tuvungBO.TuVung = TuVung;
                tuvungBO.NghiaTu = NghiaTu;
                tuvungBO.HinhAnh = Hinhanh;
                tuvungBO.ViDu = ViDu;
                tuvungBO.TaiKhoan = TaiKhoan;
                tuvungBO.SoLanSai = SoLanSai;
                tuvungBO.SoLanSuDung = SoLanSuDung;
                tuvungBO.TuDienID = TuDienID;
                tuvungBO.KiemDuyet = KiemDuyet;
                tuvungDAO.UpDateTuVung(tuvungBO, to,hasimage);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool DuyetTuVung(string tuvungID)
        {
            try
            {
                tuvungDAO.UpDateTuVung(tuvungID);
                return true;
            }
            catch
            {
                return false;
            }
 
        }
    }
}
