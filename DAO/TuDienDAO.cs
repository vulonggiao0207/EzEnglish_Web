using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BO;
namespace DAO
{
    public class TuDienDAO
    {
        #region Chọn từ điển
        public TuDienCollection SelectTuDien(string taikhoan)
        {
            hoctuvungLINQDataContext db= new hoctuvungLINQDataContext();
            TuDienCollection tdColl = new TuDienCollection();
            IEnumerable<TuDien> tudien = from p in db.TuDiens
                                         where p.taikhoan == taikhoan
                                         select p;
            //Addrange
            foreach (TuDien tv in tudien)
            {
                TuDienBO tdBO = new TuDienBO();
                tdBO.TuDienID = tv.TudienID.ToString();
                tdBO.TaiKhoan = tv.taikhoan;
                tdBO.TenTuDien = tv.TenTuDien;
                tdBO.CongDong = (bool)tv.CongDong;
                tdColl.Add(tdBO);
            }
            return tdColl;
        }
        #endregion

        #region Thêm một từ điển
        public void InsertTuDien(TuDienBO tudienBO)
        {
            hoctuvungLINQDataContext db= new hoctuvungLINQDataContext();
            TuDien td = new TuDien();
            td.TudienID = Guid.NewGuid();
            td.taikhoan = tudienBO.TaiKhoan;
            td.TenTuDien = tudienBO.TenTuDien;
            td.CongDong = false;
            db.TuDiens.InsertOnSubmit(td);
            db.SubmitChanges();
        }
        #endregion

        #region Cập nhật thông tin từ điển
        public void UpdateTuDien(TuDienBO tudienBO)
        { 
            hoctuvungLINQDataContext db= new hoctuvungLINQDataContext();
            TuDien tudien = db.TuDiens.SingleOrDefault(p => p.TudienID.ToString() == tudienBO.TuDienID);
            tudien.TenTuDien = tudienBO.TenTuDien;
            tudien.taikhoan = tudienBO.TaiKhoan;
            tudien.CongDong = tudienBO.CongDong;
            db.SubmitChanges();
        }
        #endregion

        #region Xóa từ điển
        public void DeleteTuDien(string tudienID)
        {
             hoctuvungLINQDataContext db= new hoctuvungLINQDataContext();
             var tudien = from p in db.TuDiens
                          where p.TudienID.ToString() == tudienID
                          select p;
             db.TuDiens.DeleteAllOnSubmit(tudien);
             db.SubmitChanges();
        }

        #endregion

        #region Thêm người dùng vào từ điển
        public void InsertNguoidung_TuDien(string tudienid, string taikhoan)
        {
            hoctuvungLINQDataContext db= new hoctuvungLINQDataContext();
            Nhom_TuDien ntd = new Nhom_TuDien();
            Guid myguid= new Guid(tudienid);
            ntd.TuDienID = myguid;
            ntd.taikhoan = taikhoan;
            ntd.Xem=false;
            ntd.Them=false;
            ntd.Xoa=false;
            ntd.Sua=false;
            db.Nhom_TuDiens.InsertOnSubmit(ntd);
            db.SubmitChanges();
        }
        #endregion

        #region Lấy quyền của nguời dùng của [từ điển]
        public TuDienBO Select_NguoiDung_Quyen(string tudienID, string taikhoan)
        {
            //Đọc dữ liệu --> lấy ra các quyền của [taikhan] trên [tudienID]
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            Nhom_TuDien ntd = new Nhom_TuDien();
            Guid myguid = new Guid(tudienID);
            Nhom_TuDien temp = (from p in db.Nhom_TuDiens
                        where p.taikhoan==taikhoan && p.TuDienID==myguid
                        select p).SingleOrDefault();
            
            //Gán dữ liệu để truyền đi
            TuDienBO tudienBO = new TuDienBO();
            tudienBO.TuDienID = tudienID;
            tudienBO.TaiKhoan = taikhoan;
            tudienBO.Xem =(bool) temp.Xem;
            tudienBO.Them =(bool) temp.Them;
            tudienBO.Xoa = (bool)temp.Xoa;
            tudienBO.Sua = (bool)temp.Sua;
            return tudienBO;            
        }
        #endregion

        #region Cập nhật lại quyền của [ngừơi dùng] trên [từ điển]
        public void Update_NguoiDung_Quyen(TuDienBO tudienBO)
        {
            //Đọc dữ liệu --> lấy ra các quyền của [taikhan] trên [tudienID]
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            Nhom_TuDien ntd = new Nhom_TuDien();
            Guid myguid = new Guid(tudienBO.TuDienID );
            Nhom_TuDien temp = (from p in db.Nhom_TuDiens
                                where p.taikhoan ==tudienBO.TaiKhoan && p.TuDienID == myguid
                                select p).SingleOrDefault();
            //Cập nhật lại quyền
            temp.Xem = tudienBO.Xem;
            temp.Them = tudienBO.Them;
            temp.Xoa = tudienBO.Xoa;
            temp.Sua = tudienBO.Sua;
            db.SubmitChanges();
        }
        #endregion

        /////////Chọn lọai từ điển///////////
        public TuDienCollection SelectTuDien_LienKet(string taikhoan)
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            TuDienCollection tdColl = new TuDienCollection();
            IEnumerable<TuDien> tudien = from p in db.TuDiens   
                                         select p;

            IEnumerable<Nhom_TuDien> nhomtudien = from p in db.Nhom_TuDiens 
                                                   where p.taikhoan==taikhoan
                                                  select p;
            //Addrange
            foreach (TuDien tv in tudien)
            {
                foreach(Nhom_TuDien nhomtd in nhomtudien)
                {
                    if (tv.TudienID == nhomtd.TuDienID)
                    {
                        TuDienBO tdBO = new TuDienBO();
                        tdBO.TuDienID = tv.TudienID.ToString();
                        tdBO.TaiKhoan = tv.taikhoan;
                        tdBO.TenTuDien = tv.TenTuDien;
                        tdBO.CongDong = (bool)tv.CongDong;
                        tdColl.Add(tdBO);
                    }
                }
            }
            return tdColl;
        }
        public TuDienCollection SelectTuDien_CongDong(string tentudien)
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            TuDienCollection tdColl = new TuDienCollection();
            IEnumerable<TuDien> tudien;
            if (tentudien != "")
            {
                tudien = from p in db.TuDiens
                         where p.CongDong == true
                         && p.TenTuDien.Contains(tentudien)
                         select p;
            }
            else
            {
                tudien = from p in db.TuDiens
                         where p.CongDong == true                   
                         select p;
            }
            //Addrange
            foreach (TuDien tv in tudien)
            {
                TuDienBO tdBO = new TuDienBO();
                tdBO.TuDienID = tv.TudienID.ToString();
                tdBO.TaiKhoan = tv.taikhoan;
                tdBO.TenTuDien = tv.TenTuDien;
                tdBO.CongDong = (bool)tv.CongDong;
                tdColl.Add(tdBO);
            }
            return tdColl;
        }
    }
}
