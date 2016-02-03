using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BO;
namespace DAO
{
    public class TinNhanDAO
    {
        public TinNhanCollection SelectTinNhan(string nguoigoi, string nguoinhan)
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            IEnumerable<TinNhan> tinnhanList = from p in db.TinNhans
                                               where (p.Nguoigoi == nguoigoi
                                               && p.Nguoinhan == nguoinhan) ||
                                               (p.Nguoigoi == nguoinhan
                                               && p.Nguoinhan == nguoigoi)
                                               orderby p.NgayGoi ascending
                                               select p;
            //Addrange
            TinNhanCollection tinhanColl = new TinNhanCollection();
            foreach (TinNhan tin in tinnhanList)
            {
                TinNhanBO tn = new TinNhanBO();
                tn.TinNhanID=tin.TinNhanID.ToString();
                tn.NguoiNhan = tin.Nguoinhan;
                tn.NguoiGoi = tin.Nguoigoi;
                tn.NoiDung = tin.NoiDung;
                tn.NgayGoi = Convert.ToDateTime(tin.NgayGoi);
                tinhanColl.Add(tn);
            }
            return tinhanColl;
        }
        public TinNhanCollection SelectTinNhan_ChuaDoc(string nguoinhan)
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            IEnumerable<TinNhan> tinnhanList = from p in db.TinNhans
                                               where p.Nguoinhan == nguoinhan
                                               && p.XacNhan==false
                                               orderby p.NgayGoi ascending
                                               select p;
            //Addrange
            TinNhanCollection tinhanColl = new TinNhanCollection();
            foreach (TinNhan tin in tinnhanList)
            {
                TinNhanBO tn = new TinNhanBO();
                tn.TinNhanID = tin.TinNhanID.ToString();
                tn.NguoiNhan = tin.Nguoinhan;
                tn.NguoiGoi = tin.Nguoigoi;
                tn.NoiDung = tin.NoiDung;
                tn.NgayGoi = Convert.ToDateTime(tin.NgayGoi);
                tinhanColl.Add(tn);
            }
            return tinhanColl;
        }
        public void InsertTinNhan(TinNhanBO tinnhanBO)
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            TinNhan tinnhan = new TinNhan();
            tinnhan.TinNhanID = Guid.NewGuid();
            tinnhan.Nguoigoi = tinnhanBO.NguoiGoi;
            tinnhan.Nguoinhan = tinnhanBO.NguoiNhan;
            tinnhan.NoiDung = tinnhanBO.NoiDung;
            tinnhan.NgayGoi = tinnhanBO.NgayGoi;
            tinnhan.XacNhan = false;
            db.TinNhans.InsertOnSubmit(tinnhan);
            db.SubmitChanges();
        }
        public void UpdateTinNhan(string tinnhanID, bool xacnhan)
        {
            Guid myguid = new Guid(tinnhanID);
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            TinNhan tinnhan = db.TinNhans.SingleOrDefault(p =>p.TinNhanID == myguid);
            tinnhan.XacNhan = true;
            db.SubmitChanges();
        }

    }
}
