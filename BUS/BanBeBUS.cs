using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BO;
using DAO;
namespace BUS
{
    public class BanBeBUS
    {
        BanBeDAO banbeDAO = new BanBeDAO();
        public BanBeCollection LayDSBanBe(string taikhoan)
        {
            try 
            {
                return banbeDAO.SelectBanBe(taikhoan);
            }
            catch
            {
                return null;
            }
          
        }
        public bool XoaBanBe(string taikhoan, string taikhoanban)
        {
            try
            {
                banbeDAO.DeleteBanBe(taikhoan, taikhoanban);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool ThemBanBe(string taikhoan, string taikhoanban)
        {
            try
            {
                banbeDAO.InsertBanBe(taikhoan, taikhoanban);
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}
