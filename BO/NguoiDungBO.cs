using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BO
{
    public class NguoiDungBO
    {
        public string TaiKhoan { get; set; }
        public string MatKhau { get; set; }
        public string Email { get; set; }
        public string DT { get; set; }
        public bool Banned { get; set; }
        public string Quyen { get; set; }
    }
    public class NguoiDungCollection : System.Collections.CollectionBase
    {
        public void Add(NguoiDungBO nguoidungBO)
        {
            List.Add(nguoidungBO);
        }
        public void Remove(int index)
        {
            List.RemoveAt(index);
        }
        public NguoiDungBO Index(int index)
        {
            return (NguoiDungBO)List[index];
        }
        public void AddRange(IEnumerable<NguoiDungBO> NguoidungList)
        {
            foreach (NguoiDungBO nd in NguoidungList)
            {
                List.Add(nd);
            }
        }
    }
}
