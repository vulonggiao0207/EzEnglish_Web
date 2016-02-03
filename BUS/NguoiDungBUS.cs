using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using BO;
namespace BUS
{
    public class NguoiDungBUS
    {
        NguoiDungDAO nguoidungDAO = new NguoiDungDAO();
        #region hàm đang nhập cho USER
        public bool DangNhap(string taikhoan,string matkhau,ref string quyen)
        {
            try
            {
                quyen = "";
                bool res = nguoidungDAO.DangNhap(taikhoan, matkhau,ref quyen);
                if (res == true)
                    return true;
                else
                    return false;
            }
            catch
            {
                return false;
            }
        }
        #endregion

        #region hàm kiểm tra USER đã tồn tại hay chưa để đăng ký
        public bool KTTrung(string taikhoan)
        {
            try
            {
                bool res = nguoidungDAO.KTTrung(taikhoan);
                if (res == true) return true;
                else return false;
            }
            catch
            {
                return true;
            }
        }
        public bool KTTrung2(string taikhoan)
        {
            try
            {
                bool res = nguoidungDAO.KTTrung(taikhoan);
                if (res == true) return true;
                else return false;
            }
            catch
            {
                return false;
            }
        }
        #endregion

        #region hàm đăng ký cho USER
        public bool DangKy(string taikhoan,string matkhau,string email,string dt)
        {
            try
            {
                NguoiDungBO ndBO= new NguoiDungBO();
                ndBO.TaiKhoan=taikhoan;
                ndBO.MatKhau=matkhau;
                ndBO.Email=email;
                ndBO.DT=dt;
                if (KTTrung(taikhoan) == true)
                    nguoidungDAO.DangKy(ndBO);
                return true;
            }
            catch
            {
                return false;
            }
        }
        #endregion

        #region hàm đổi mật khẩu cho USER và ADMIN
        public bool DoiMatKhau(string taikhoan,string matkhau,string matkhaumoi)
        {
            try
            {
                string quyen = "";
                if (DangNhap(taikhoan, matkhau, ref quyen) == true)
                {
                    nguoidungDAO.DoiMatKhau(taikhoan, matkhau, matkhaumoi);
                    return true;
                }
                return false;                
            }
            catch 
            {
                return false;
            }
        }
        #endregion

        #region hàm lấy thông tin người dùng
        public NguoiDungBO TTNguoiDung(string taikhoan)
        {
            try
            {
                return nguoidungDAO.SelectNguoiDung(taikhoan);
            }
            catch {
                return null;
            }
        }
        #endregion

        #region hàm thay đổi thông tin bất kỳ của ngừơi dùng
        public bool Doi_TT_NguoiDung(string taikhoan,string matkhau,string email,string dt,string quyen)
        {
            try {
                NguoiDungBO nguoidungBO= new NguoiDungBO();
                nguoidungBO.TaiKhoan=taikhoan;
                nguoidungBO.MatKhau=matkhau;
                nguoidungBO.Email=email;
                nguoidungBO.DT=dt;
                nguoidungBO.Quyen=quyen;
                //thực hiện cập nhật
                nguoidungDAO.Change_NguoiDung_Info(nguoidungBO);
                return true;
            }
            catch {
                return false;
            }

        }
        #endregion

        #region hàm lấy danh sách [người dùng][từ điển] đựơc phép sài từ điển có [tudienID]
        public NguoiDungCollection LayDSNguoiDung_TuDien(string tudienID)
        {
            try
            {
                return nguoidungDAO.SelectNguoiDung_TuDien(tudienID);
            }
            catch
            {
                return null;
            }
        }
        #endregion

        #region hàm xóa [người dùng] khỏi [từ điển]
        public bool XoaNguoiDung_TuDien(string tudienID, string taikhoan)
        {
            try 
            {
                nguoidungDAO.DeleteNguoiDung_TuDien(tudienID, taikhoan);
                return true;
            }
            catch
            {
                return false;
            }
        }
        #endregion

        #region hàm lấy tòan bộ ngừơi dùng
        public NguoiDungCollection LayToanBoNguoiDung(string tennguoidung)
        {
            try 
            {
                return nguoidungDAO.SelectAllNguoiDung(tennguoidung);
            }
            catch
            {
                return null;
            }
        }
        #endregion

        #region banned nick
        public bool Bannednick(string taikhoan, bool banned)
        {
            try
            {
                nguoidungDAO.Bannednick(taikhoan, banned);
                return true;
            }
            catch
            {
                return false;
            }

        }
        #endregion


    }
}
