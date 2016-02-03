using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BO;
namespace DAO
{
    public class NguoiDungDAO
    {
        #region hàm đang nhập cho USER
        public bool DangNhap(string taikhoan,string matkhau,ref string quyen)
        {

            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            bool thanhcong = false;        
            NguoiDung check = (from p in db.NguoiDungs
                               where p.matkhau==matkhau &&p.taikhoan==taikhoan
                               &&p.banned==false
                               select p).Single();
            if (check != null)
            {
                thanhcong = true;
                quyen = check.quyen;
            }
            return thanhcong;
        }
        #endregion

        #region hàm kiểm tra USER đã tồn tại hay chưa để đăng ký
        public bool KTTrung(string taikhoan)
        {
            bool trung = false;
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            NguoiDung check= db.NguoiDungs.SingleOrDefault(p=>p.taikhoan==taikhoan);   
            if(taikhoan==check.taikhoan)
                trung=true;
            return trung;
        }
        #endregion

        #region hàm đăng ký cho USER
        public void DangKy(NguoiDungBO nguoidungBO)
        {
            //Tạo mới một NguoiDung

            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            NguoiDung InsNguoiDung = new NguoiDung();
            //Thêm thụôc tính cần Insert
            InsNguoiDung.taikhoan = nguoidungBO.TaiKhoan;
            InsNguoiDung.matkhau = nguoidungBO.MatKhau;
            InsNguoiDung.email = nguoidungBO.Email;
            InsNguoiDung.dt = nguoidungBO.DT;
            InsNguoiDung.banned = false;
            InsNguoiDung.quyen = "User";   
            //thực hiện Insert
            db.NguoiDungs.InsertOnSubmit(InsNguoiDung);
            db.SubmitChanges();           
        }
        #endregion

        #region hàm đổi mật khẩu cho USER và ADMIN
        public void DoiMatKhau(string taikhoan, string matkhau, string matkhaumoi)
        {
            //Lấy ra ngừơi dùng cần Update

            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            NguoiDung UpNguoiDung = db.NguoiDungs.Single(p => p.taikhoan == taikhoan);
            //Cập nhật lại các thuộc tính
            UpNguoiDung.matkhau = matkhaumoi;
            db.SubmitChanges();
        } 
        #endregion

        #region hàm lấy thông tin một ngừơi dùng
        public NguoiDungBO SelectNguoiDung(string taikhoan)
        {
            //Lấy thông tin người dùng từ DB
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            NguoiDungBO nguoidungBO= new NguoiDungBO();
            NguoiDung ndtemp = db.NguoiDungs.Single(p => p.taikhoan == taikhoan);
            //Gán thông tin vào đối tượng ngừơi dùng
            nguoidungBO.TaiKhoan = ndtemp.taikhoan;
            nguoidungBO.MatKhau = ndtemp.matkhau;
            nguoidungBO.Email = ndtemp.email;
            nguoidungBO.DT = ndtemp.dt;
            return nguoidungBO;
        }
        #endregion

        #region hàm thay đổi thông tin bất kỳ của ngừơi dùng
        public void Change_NguoiDung_Info(NguoiDungBO nguoidungBO)
        {
            string taikhoan = nguoidungBO.TaiKhoan;
            string matkhau = nguoidungBO.MatKhau;
            string email = nguoidungBO.Email;
            string dt = nguoidungBO.DT;
            string quyen = nguoidungBO.Quyen;
            //Lấy thông tin ngừoi dùng
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            NguoiDung ndtemp = db.NguoiDungs.Single(p => p.taikhoan == taikhoan);
            //Cập nhật lại thông tin ngừơi dùng
            if (matkhau != "") ndtemp.matkhau = matkhau;
            if (email != "") ndtemp.email = email;
            if (dt != "") ndtemp.dt = dt;
            if (quyen != "") ndtemp.quyen = quyen;
            db.SubmitChanges();
        }
        #endregion

        #region hàm lấy danh sách [người dùng][từ điển] đựơc phép sài từ điển có [tudienID]
        public NguoiDungCollection SelectNguoiDung_TuDien(string tudienID)
        {
            NguoiDungCollection ndColl = new NguoiDungCollection();
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            IEnumerable<Nhom_TuDien> nguoidunglist = from p in db.Nhom_TuDiens
                                                   where p.TuDienID.ToString() == tudienID
                                                   select p;
            //Addrange
            foreach (Nhom_TuDien nd in nguoidunglist)
            {
                NguoiDungBO ndBO= new NguoiDungBO();
                ndBO.TaiKhoan=nd.taikhoan;
                ndColl.Add(ndBO);
            }
            return ndColl;
        }
        #endregion

        #region hàm xóa [ngừơi dùng] khỏi [từ điển]
        public void DeleteNguoiDung_TuDien(string tudienid,string taikhoan)
        {
            Guid myguid = new Guid(tudienid);
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            var nguoidung_tudien = from p in db.Nhom_TuDiens
                                   where p.TuDienID == myguid && p.taikhoan == taikhoan
                                   select p;
            db.Nhom_TuDiens.DeleteAllOnSubmit(nguoidung_tudien);
            db.SubmitChanges();
        }
        #endregion

        #region hàm lấy danh sách tòan bộ người dùng
        public NguoiDungCollection SelectAllNguoiDung(string tennguoiudung)
        {
            NguoiDungCollection nguoidungcoll = new NguoiDungCollection();
            hoctuvungLINQDataContext db= new hoctuvungLINQDataContext();
             IEnumerable<NguoiDung> nguoidungList;
            if (tennguoiudung != "")
            {
                nguoidungList = from p in db.NguoiDungs
                                where p.quyen.Trim() != "Admin"
                                && p.taikhoan.Contains(tennguoiudung)
                                select p;
            }
            else
            {
                nguoidungList = from p in db.NguoiDungs
                                where p.quyen.Trim() != "Admin"

                                select p;
            }
            foreach(NguoiDung nd in nguoidungList)
            {
                NguoiDungBO ndBO = new NguoiDungBO();
                ndBO.TaiKhoan = nd.taikhoan;
                ndBO.Banned = (bool)nd.banned;
                nguoidungcoll.Add(ndBO);
            }
            return nguoidungcoll;
        }
        #endregion

        #region hàm banned nick
        public void Bannednick(string taikhoan, bool banned)
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            NguoiDung nguoidung = db.NguoiDungs.SingleOrDefault(p=>p.taikhoan.Trim()==taikhoan);
            nguoidung.banned = banned;
            db.SubmitChanges();
        }
        #endregion

    }
}
