using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BO
{
    public class TinNhanBO
    {
        public string TinNhanID { get; set; }
        public string NguoiGoi { get; set; }
        public string NguoiNhan { get; set; }
        public string NoiDung { get; set; }
        public DateTime NgayGoi { get; set; }
        public string XacNhan { get; set; }
    }
    public class TinNhanCollection : System.Collections.CollectionBase
    {
        public void Add(TinNhanBO tinhanBO)
        {
            List.Add(tinhanBO);
        }
        public void Remove(int index)
        {
            List.RemoveAt(index);
        }
        public TinNhanBO Index(int index)
        {
            return (TinNhanBO)List[index];
        }
        public void AddRange(IEnumerable<TinNhanBO> TinNhanList)
        {
            foreach (TinNhanBO tn in TinNhanList)
            {
                List.Add(tn);
            }
        }
    }

}
