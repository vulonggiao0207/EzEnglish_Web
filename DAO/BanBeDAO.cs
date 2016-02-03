using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BO;
namespace DAO
{
    public class BanBeDAO
    {
        public BanBeCollection SelectBanBe(string taikhoan)
        {
            hoctuvungLINQDataContext db= new hoctuvungLINQDataContext();
            BanBeCollection banbeColl = new BanBeCollection();
            IEnumerable<Banbe> banbeList = from p in db.Banbes
                                           where p.taikhoan == taikhoan
                                           select p;
            //Add range 
            foreach (Banbe bb in banbeList)
            {
                BanBeBO banbeBO = new BanBeBO();
                banbeBO.TaiKhoan = bb.taikhoan;
                banbeBO.TaiKhoanBan = bb.taikhoanban;
                banbeColl.Add(banbeBO);
            }
            return banbeColl;
        }
        public void DeleteBanBe(string taikhoan, string taikhoanban)
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            Banbe ban = (from p in db.Banbes
                        where p.taikhoan == taikhoan && p.taikhoanban == taikhoanban
                        select p).SingleOrDefault();
            db.Banbes.DeleteOnSubmit(ban);
            db.SubmitChanges();
        }
        public void InsertBanBe(string taikhoan, string taikhoanban)        
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            Banbe ban = new Banbe();
            ban.taikhoan = taikhoan;
            ban.taikhoanban = taikhoanban;
            db.Banbes.InsertOnSubmit(ban);
            db.SubmitChanges();
        }
    }
}
