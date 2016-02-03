using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BO
{
    public class TuDienBO
    {
        public Guid tudienid; 
      /*  public TuDienBO()     
        {
            tudienid = Guid.NewGuid();
        }
        public string TuDienID
        {
            get { return tudienid.ToString(); }
            set {tudienid=Guid.NewGuid();}
        }*/
        public string TuDienID { get; set; }
        public string TenTuDien { get; set; }
        public string TaiKhoan { get; set; }
        public bool CongDong { get; set; }

        public bool Xem { get; set; }
        public bool Them { get; set; }
        public bool Xoa { get; set; }
        public bool Sua { get; set; }

    }
    public class TuDienCollection : System.Collections.CollectionBase
    {
        public void Add(TuDienBO tudienBO)
        {
            List.Add(tudienBO);
        }
        public void Remove(int index)
        {
            List.RemoveAt(index);
        }
        public TuDienBO Index(int index)
        {
            return (TuDienBO)List[index];
        }
        public void AddRange(IEnumerable<TuDienBO> TudienList)
        {
            foreach (TuDienBO tv in TudienList)
            {
                List.Add(tv);
            }
        }
    }
}
