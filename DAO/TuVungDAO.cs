using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BO;
namespace DAO
{
    public class TuVungDAO
    {
        /// <summary>
        /// ////Các hàm trong tratu.aspx
        /// </summary>      
        public TuVungCollection SelectTuVung(string tudienID)
        {
            //Lấy từ vựng trong từ điển cộng đồng
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            TuVungCollection tuvungColl = new TuVungCollection();
            IEnumerable<TuVung> TuVungList;
            Guid myguid = new Guid(tudienID);
            TuVungList = from p in db.TuVungs
                             where p.TuDienID == myguid
                             &&p.TuDien.CongDong==false
                             select p;
            
            //Addrange
            foreach (TuVung tv in TuVungList)
            {
                TuVungBO tvBO = new TuVungBO();
                tvBO.TuVungID = tv.TuVungID.ToString();
                tvBO.TuVung = tv.TuVung1;
                tvBO.LoaiTuID = (int)tv.LoaiTuID;
                tvBO.NghiaTu = tv.NghiaTu;
                tvBO.ViDu = tv.Vidu;
                tvBO.TaiKhoan = tv.taikhoan;
                tvBO.HinhAnh = tv.Hinhanh;
                tvBO.SoLanSai = (int)tv.SoLanSai;
                tvBO.SoLanSuDung = (int)tv.SoLanSuDung;
                tuvungColl.Add(tvBO);
            }
            return tuvungColl;
        }
        public TuVungCollection SelectAllTuVung_CongDong()
        {
            //Lấy từ vựng trong từ điển cộng đồng
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            TuVungCollection tuvungColl = new TuVungCollection();
            IEnumerable<TuVung> TuVungList;
            TuVungList = from p in db.TuVungs
                             where p.TuDien.CongDong == true
                             && p.kiemduyet == true                           
                             select p;
           
            //Addrange
            foreach (TuVung tv in TuVungList)
            {
                TuVungBO tvBO = new TuVungBO();
                tvBO.TuVungID = tv.TuVungID.ToString();
                tvBO.TuVung = tv.TuVung1;
                tvBO.LoaiTuID = (int)tv.LoaiTuID;
                tvBO.NghiaTu = tv.NghiaTu;
                tvBO.ViDu = tv.Vidu;
                tvBO.TaiKhoan = tv.taikhoan;
                tvBO.HinhAnh = tv.Hinhanh;
                tvBO.SoLanSai = (int)tv.SoLanSai;
                tvBO.SoLanSuDung = (int)tv.SoLanSuDung;
                tuvungColl.Add(tvBO);
            }
            return tuvungColl;

        }
        public TuVungCollection SelectTuVung_CongDong(string tuvung,string tudienID)
        {
            //Lấy từ vựng trong từ điển cộng đồng
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            TuVungCollection tuvungColl = new TuVungCollection();
            IEnumerable<TuVung> TuVungList;
            Guid myguid = new Guid(tudienID);
            if (tuvung == "")
            {
                TuVungList = from p in db.TuVungs
                             where p.TuDien.CongDong == true
                             &&p.kiemduyet==true
                             && p.TuDienID == myguid
                             select p;
            }
            else
            {
                TuVungList = from p in db.TuVungs
                             where p.TuDien.CongDong == true
                             && p.kiemduyet == true
                              && p.TuVung1.Contains(tuvung)
                              && p.TuDienID==myguid
                             select p;
            }
            //Addrange
            foreach (TuVung tv in TuVungList)
            {
                TuVungBO tvBO = new TuVungBO();
                tvBO.TuVungID = tv.TuVungID.ToString();
                tvBO.TuVung = tv.TuVung1;
                tvBO.LoaiTuID = (int)tv.LoaiTuID;
                tvBO.NghiaTu = tv.NghiaTu;
                tvBO.ViDu = tv.Vidu;
                tvBO.TaiKhoan = tv.taikhoan;
                tvBO.HinhAnh = tv.Hinhanh;
                tvBO.SoLanSai = (int)tv.SoLanSai;
                tvBO.SoLanSuDung = (int)tv.SoLanSuDung;
                tuvungColl.Add(tvBO);
            }
            return tuvungColl;
          
        }
        public TuVungCollection SelectTuVung_CaNhan(string tuvung, string taikhoan, string tudienID)
        {
            //Lấy từ vựng trong từ điển cá nhân
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            TuVungCollection tuvungColl = new TuVungCollection();
            IEnumerable<TuVung> TuVungList;
            Guid myguid = new Guid(tudienID);
            if (tuvung == "")
            {
                TuVungList = from p in db.TuVungs
                             where p.TuDien.taikhoan == taikhoan
                             && p.TuDienID == myguid
                             select p;
            }
            else
            {
                TuVungList = from p in db.TuVungs
                             where p.TuDien.taikhoan == taikhoan
                             && p.TuVung1.Contains(tuvung)
                             && p.TuDienID == myguid
                             select p;
            }

            //Addrange
            foreach (TuVung tv in TuVungList)
            {
                TuVungBO tvBO = new TuVungBO();
                tvBO.TuVungID = tv.TuVungID.ToString();
                tvBO.TuVung = tv.TuVung1;
                tvBO.LoaiTuID = (int)tv.LoaiTuID;
                tvBO.NghiaTu = tv.NghiaTu;
                tvBO.ViDu = tv.Vidu;
                tvBO.TaiKhoan = tv.taikhoan;
                tvBO.HinhAnh = tv.Hinhanh;
                tvBO.SoLanSai = (int)tv.SoLanSai;
                tvBO.SoLanSuDung = (int)tv.SoLanSuDung;
                tuvungColl.Add(tvBO);
            }
            return tuvungColl;
        }
        public TuVungCollection SelectTuVung_LienKet(string tuvung, string taikhoan, string tudienID)
        {
            //Lấy từ vựng trong từ điển liên kết

            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            TuVungCollection tuvungColl = new TuVungCollection();
            Guid myguid= new Guid(tudienID);
            IEnumerable<Nhom_TuDien> nhomtudienList=from p in db.Nhom_TuDiens
                                                    where p.taikhoan==taikhoan
                                                    select p;
            IEnumerable<TuVung> TuVungList;
            if (tuvung == "")
            {              
                TuVungList = from p in db.TuVungs
                             where p.TuDienID==myguid
                             select p;
            }
            else
            {
                TuVungList = from p in db.TuVungs
                             //  where p.TuDien.Nhom_TuDiens == nhomtudien && 
                             where p.TuVung1.Contains(tuvung)
                             && p.TuDienID == myguid
                             select p;
            }
            //Addrange
            foreach (TuVung tv in TuVungList)
            {
                foreach (Nhom_TuDien nhomtd in nhomtudienList)
                {
                    if(tv.TuDienID==nhomtd.TuDienID)
                    { 
                        TuVungBO tvBO = new TuVungBO();
                        tvBO.TuVungID = tv.TuVungID.ToString();
                        tvBO.TuVung = tv.TuVung1;
                        tvBO.LoaiTuID = (int)tv.LoaiTuID;
                        tvBO.NghiaTu = tv.NghiaTu;
                        tvBO.ViDu = tv.Vidu;
                        tvBO.TaiKhoan = tv.taikhoan;
                        tvBO.HinhAnh = tv.Hinhanh;
                        tvBO.SoLanSai = (int)tv.SoLanSai;
                        tvBO.SoLanSuDung = (int)tv.SoLanSuDung;
                        tuvungColl.Add(tvBO);
                    }
                }
            }
            return tuvungColl;
        }
        public TuVungCollection SelectTuVung_Eng(string tuvung,string taikhoan)
        {
            TuDienDAO tudienDAO = new TuDienDAO();
            TuVungCollection tuvungColl = new TuVungCollection();   
            //Lấy tất cả từ vựng [Công Đồng]
            tuvungColl = SelectAllTuVung_CongDong();
            if (taikhoan != "")
            {
                //Lấ tát cả từ vựng[Cá nhân]
                TuDienCollection tudiencanhan = new TuDienCollection();
                tudiencanhan = tudienDAO.SelectTuDien(taikhoan);
                foreach (TuDienBO td in tudiencanhan)
                {
                    tuvungColl.Addrange(SelectTuVung_CaNhan("", taikhoan, td.TuDienID));
                }
                TuDienCollection tudienlienket = new TuDienCollection();
                tudienlienket = tudienDAO.SelectTuDien_LienKet(taikhoan);
                foreach (TuDienBO td in tudienlienket)
                {
                    tuvungColl.Addrange(SelectTuVung_LienKet("", taikhoan, td.TuDienID));
                }
            }
            //Lấy danh sách từ vựng tìm đựơc
            TuVungCollection foundColl = new TuVungCollection();
            foreach (TuVungBO tv in tuvungColl)
            {
                if(tv.TuVung.Contains(tuvung))
                {
                    //kiểm tra từ đó có tồn tại chưa
                    bool exist = false;
                    if (foundColl.Count > 0)//chỉ kiểm tra khi foundColl>0
                    {
                        foreach (TuVungBO tv1 in foundColl)
                        {
                            if (tv.TuVungID == tv1.TuVungID)
                            {
                                exist = true;
                                break;
                            }

                        }                     
                    }
                    if (exist ==false)//nếu chưa thì thêm vào
                        foundColl.Add(tv);
                }
            }
            return foundColl;         
        }
        public TuVungCollection SelectTuVung_Viet(string tuvung,string taikhoan)
        {
            TuDienDAO tudienDAO = new TuDienDAO();
            TuVungCollection tuvungColl = new TuVungCollection();
            //Lấy tất cả từ vựng [Công Đồng]
            tuvungColl = SelectAllTuVung_CongDong();
            if (taikhoan != "")
            {
                //Lấ tát cả từ vựng[Cá nhân]
                TuDienCollection tudiencanhan = new TuDienCollection();
                tudiencanhan = tudienDAO.SelectTuDien(taikhoan);
                foreach (TuDienBO td in tudiencanhan)
                {
                    tuvungColl.Addrange(SelectTuVung_CaNhan("", taikhoan, td.TuDienID));
                }
                TuDienCollection tudienlienket = new TuDienCollection();
                tudienlienket = tudienDAO.SelectTuDien_LienKet(taikhoan);
                foreach (TuDienBO td in tudienlienket)
                {
                    tuvungColl.Addrange(SelectTuVung_LienKet("", taikhoan, td.TuDienID));
                }
            }
            //Lấy danh sách từ vựng tìm đựơc
            TuVungCollection foundColl = new TuVungCollection();
            foreach (TuVungBO tv in tuvungColl)
            {
                if (tv.NghiaTu.Contains(tuvung))
                {
                    //kiểm tra từ đó có tồn tại chưa
                    bool exist = false;
                    if (foundColl.Count > 0)//chỉ kiểm tra khi foundColl>0
                    {
                        foreach (TuVungBO tv1 in foundColl)
                        {
                            if (tv.TuVungID == tv1.TuVungID)
                            {
                                exist = true;
                                break;
                            }

                        }
                    }
                    if (exist == false)//nếu chưa thì thêm vào
                        foundColl.Add(tv);
                }
            }
            return foundColl;             
        }
        public TuVungCollection SelectTuVungChoDuyet(string tuvung)
        {
            //Lấy từ vựng trong từ điển cộng đồng
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            TuVungCollection tuvungColl = new TuVungCollection();
            IEnumerable<TuVung> TuVungList;
            if (tuvung != "")
            {
                TuVungList = from p in db.TuVungs
                             where p.TuDien.CongDong == true
                             && p.kiemduyet == false
                             && p.TuVung1.Contains(tuvung)
                             select p;
            }
            else
            {
                TuVungList = from p in db.TuVungs
                             where p.TuDien.CongDong == true
                             && p.kiemduyet == false
                             select p;
            }
            //Addrange
            foreach (TuVung tv in TuVungList)
            {
                TuVungBO tvBO = new TuVungBO();
                tvBO.TuVungID = tv.TuVungID.ToString();
                tvBO.TuVung = tv.TuVung1;
                tvBO.LoaiTuID = (int)tv.LoaiTuID;
                tvBO.NghiaTu = tv.NghiaTu;
                tvBO.ViDu = tv.Vidu;
                tvBO.TaiKhoan = tv.taikhoan;
                tvBO.HinhAnh = tv.Hinhanh;
                tvBO.SoLanSai = (int)tv.SoLanSai;
                tvBO.SoLanSuDung = (int)tv.SoLanSuDung;
                tuvungColl.Add(tvBO);
            }
            return tuvungColl;
        }

       
        /// <summary>
        /// ////Các hàm trong quanlytuvung.aspx
        /// </summary>   
        public TuVungBO SelectOneTuVung(string tuvungID)
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            TuVungBO tvBO = new TuVungBO();
            Guid myguid = new Guid(tuvungID);
            TuVung tv = db.TuVungs.SingleOrDefault(p => p.TuVungID == myguid);
            tvBO.TuVungID = tv.TuVungID.ToString();
            tvBO.TuDienID = tv.TuDienID.ToString();
            tvBO.TuVung = tv.TuVung1;
            tvBO.LoaiTuID = (int)tv.LoaiTuID;
            tvBO.NghiaTu = tv.NghiaTu;
            tvBO.ViDu = tv.Vidu;
            tvBO.TaiKhoan = tv.taikhoan;
            tvBO.HinhAnh = tv.Hinhanh;
            tvBO.SoLanSai = (int)tv.SoLanSai;
            tvBO.SoLanSuDung = (int)tv.SoLanSuDung;
            return tvBO;
        }
        public void InsertTuVung(TuVungBO tuvungBO, int to)
        {          
            hoctuvungLINQDataContext db= new hoctuvungLINQDataContext();
            TuVung tv = new TuVung();
            tv.TuVungID = Guid.NewGuid();
            tv.TuVung1 = tuvungBO.TuVung;
            tv.Hinhanh = tuvungBO.HinhAnh;
            tv.LoaiTuID = tuvungBO.LoaiTuID;
            tv.NghiaTu = tuvungBO.NghiaTu;
            tv.SoLanSai = tuvungBO.SoLanSai;
            tv.SoLanSuDung = tuvungBO.SoLanSuDung;            
            tv.Vidu = tuvungBO.ViDu;
            Guid myguid = new Guid(tuvungBO.TuDienID);
            tv.TuDienID = myguid;
            tv.taikhoan = tuvungBO.TaiKhoan;
            //Insert vào từ điển cá nhân   //Insert vào từ điển đựơc sử dụng chung
            if (to == 1 || to == 2)
            {
                db.TuVungs.InsertOnSubmit(tv);
            }         
       
            //Insert vào từ điển cộng đồng
            else if (to == 3)
            {
                tv.kiemduyet = false;
            }
            db.TuVungs.InsertOnSubmit(tv);
            db.SubmitChanges(); 
        }
        public void InsertTuVung(TuVungBO tuvungBO)
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            TuVung tv = new TuVung();
            tv.TuVungID = Guid.NewGuid();
            tv.TuVung1 = tuvungBO.TuVung;
            tv.Hinhanh = tuvungBO.HinhAnh;
            tv.LoaiTuID = tuvungBO.LoaiTuID;
            tv.NghiaTu = tuvungBO.NghiaTu;
            tv.SoLanSai = tuvungBO.SoLanSai;
            tv.SoLanSuDung = tuvungBO.SoLanSuDung;
            tv.Vidu = tuvungBO.ViDu;
            Guid myguid = new Guid(tuvungBO.TuDienID);
            tv.TuDienID = myguid;
            tv.taikhoan = tuvungBO.TaiKhoan;
            tv.kiemduyet = true;
            db.TuVungs.InsertOnSubmit(tv);
            db.SubmitChanges();
        }
        public void DeleteTuVung(string tuvungID)
        { 
            hoctuvungLINQDataContext db= new hoctuvungLINQDataContext();
            Guid mygui = new Guid(tuvungID);
            TuVung tv = db.TuVungs.Single(p => p.TuVungID == mygui);
            db.TuVungs.DeleteOnSubmit(tv);
            db.SubmitChanges();
        }
        public void UpDateTuVung(TuVungBO tuvungBO,int to,bool hasimage)
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            Guid myguid = new Guid(tuvungBO.TuVungID);
            TuVung tv = db.TuVungs.SingleOrDefault(p=>p.TuVungID==myguid);    
            tv.TuVung1 = tuvungBO.TuVung;
            if(hasimage==true)
                tv.Hinhanh = tuvungBO.HinhAnh;
            tv.LoaiTuID = tuvungBO.LoaiTuID;
            tv.NghiaTu = tuvungBO.NghiaTu;
            tv.SoLanSai = tuvungBO.SoLanSai;
            tv.SoLanSuDung = tuvungBO.SoLanSuDung;
            tv.Vidu = tuvungBO.ViDu;
            Guid myguid1 = new Guid(tuvungBO.TuDienID);
            tv.TuDienID = myguid1;
            tv.taikhoan = tuvungBO.TaiKhoan;    
            //Insert vào từ điển cộng đồng
            if (to == 3)
            {
                tv.kiemduyet = tuvungBO.KiemDuyet;
            }
            db.SubmitChanges(); 
        }
        public void UpDateTuVung(string tuvungID)
        {
            hoctuvungLINQDataContext db = new hoctuvungLINQDataContext();
            Guid myguid = new Guid(tuvungID);
            TuVung tv = db.TuVungs.SingleOrDefault(p => p.TuVungID == myguid);
            tv.kiemduyet = true;
            db.SubmitChanges();
        }
    }
}
