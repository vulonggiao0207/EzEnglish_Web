using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BO
{
    public class TuVungBO
    {
        public string TuVungID { get; set; }
        public string TuDienID { get; set; }
        public int LoaiTuID { get; set; }
        public string TuVung { get; set; }
        public string NghiaTu { get; set; }
        public string HinhAnh { get; set; }
        public string ViDu { get; set; }
        public string TaiKhoan { get; set; }
        public int SoLanSuDung { get; set; }
        public int SoLanSai { get; set; }
        public bool KiemDuyet { get; set; }
        public bool Compare(TuVungBO tuvungBO)
        {
            if (this.LoaiTuID == tuvungBO.LoaiTuID
                && this.TuVung == tuvungBO.TuVung
                && this.NghiaTu == tuvungBO.NghiaTu
                && this.ViDu == tuvungBO.ViDu
                && this.TaiKhoan == tuvungBO.TaiKhoan)
                return true;
            return false;
        }
    }
    public class TuVungCollection : System.Collections.CollectionBase
    {
        public void Add(TuVungBO tuvungBO)
        {
            List.Add(tuvungBO);
        }
        public void Remove(int index)
        {
            List.RemoveAt(index);
        }
        public TuVungBO Index(int index)
        {
            return (TuVungBO)List[index];
        }
        public void Addrange(TuVungCollection tuvungColl)
        {
            foreach (TuVungBO tv in tuvungColl)
            {
                List.Add(tv);
            }
        }
    }
}
