using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BO;
using DAO;
namespace BUS
{
    public class TinNhanBUS
    {
        TinNhanDAO tinnhanDAO = new TinNhanDAO();
        public TinNhanCollection LayTinNhan(string nguoigoi, string nguoinhan)
        {
            try
            {
                return tinnhanDAO.SelectTinNhan(nguoigoi, nguoinhan);
            }
            catch
            {
                return null;
            }
        }
        public TinNhanCollection LayDSTinNhan_ChuaDoc(string nguoinhan)
        {
            try
            {
                return tinnhanDAO.SelectTinNhan_ChuaDoc(nguoinhan);
            }
            catch
            {
                return null;
            }
        }
        public bool ThemTinNhan(string nguoigoi,string nguoinhan,string noidung)
        {
            try
            {
                TinNhanBO tnBO = new TinNhanBO();
                tnBO.NguoiNhan = nguoinhan;
                tnBO.NguoiGoi = nguoigoi;
                tnBO.NoiDung = noidung;
                tnBO.NgayGoi = DateTime.Now;
                tinnhanDAO.InsertTinNhan(tnBO);
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool CapNhatTinNhan(string tinnhanID, bool xacnhan)
        {
            try
            {
                tinnhanDAO.UpdateTinNhan(tinnhanID, true);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
