using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BO;
namespace DAO
{
    public class CauHoiDAO
    {
        public void InSertCauHoi(string taikhoan, string tieude, string noidung)
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            CauHoi_DienDan chdd = new CauHoi_DienDan();
            chdd.CauHoiID=Guid.NewGuid();
            chdd.taikhoan = taikhoan;
            chdd.TieuDe = tieude;
            chdd.NoiDung = noidung;
            chdd.NgayGoi = DateTime.Now;
            db.CauHoi_DienDans.InsertOnSubmit(chdd);
            db.SubmitChanges();
        }
        public void InsertCauTraLoi(string taikhoan, string CauHoiID, string noidung)
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            TraLoi_DienDan tldd = new TraLoi_DienDan();
            tldd.TraLoiID = Guid.NewGuid();
            Guid myguid = new Guid(CauHoiID);
            tldd.CauHoiID = myguid;
            tldd.taikhoan = taikhoan;
            tldd.Noidung = noidung;
            tldd.NgayGoi = DateTime.Now;
            db.TraLoi_DienDans.InsertOnSubmit(tldd);
            db.SubmitChanges();
        }
    }
}
