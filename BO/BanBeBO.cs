using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace BO
{
    public partial class BanBeBO
    {
        public string TaiKhoan{get;set;}
        public string TaiKhoanBan { get; set; }
    }
    public class BanBeCollection : System.Collections.CollectionBase
    {
        public void Add(BanBeBO banbeBO)
        {
            List.Add(banbeBO);
        }
        public void Remove(int index)
        {
            List.RemoveAt(index);
        }
        public BanBeBO Index(int index)
        {
            return (BanBeBO)List[index];
        }
        public void AddRange(IEnumerable<BanBeBO> BanBeList)
        {
            foreach (BanBeBO bb in BanBeList)
            {
                List.Add(bb);
            }
        }
    }
}
