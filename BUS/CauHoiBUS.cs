using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
namespace BUS
{
    public class CauHoiBUS
    {
        CauHoiDAO cauhoiDAO = new CauHoiDAO();
        public bool ThemCauHoi(string taikhoan, string tieude, string noidung)
        {
            try
            {
                cauhoiDAO.InSertCauHoi(taikhoan, tieude, noidung);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool ThemCauTraLoi(string taikhoan, string CauHoiID, string noidung)
        {
            try
            {
                cauhoiDAO.InsertCauTraLoi(taikhoan, CauHoiID, noidung);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
