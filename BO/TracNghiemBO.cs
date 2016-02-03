using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace BO
{  
        public class TracNghiemBO
        {
            private int cautraloidung;
            private int cautraloi;
            private TuVungBO[] choices;
            public TracNghiemBO()
            {
                
                cautraloidung = -1;
                cautraloi = -1;
                choices = new TuVungBO[4];
            }
            public int CauTraLoiDung
            {
                get { return cautraloidung; }
                set { cautraloidung = value; }
            }
            public int CauTraLoi
            {
                get { return cautraloi; }
                set { cautraloi = value; }
            }
            public TuVungBO[] Choices
            {
                get { return choices; }
                set { choices = value; }
            }
        }
        public class TracNghiemCollection : System.Collections.CollectionBase
        {
            public void Add(TracNghiemBO tracnghiemBO)
            {
                List.Add(tracnghiemBO);
            }
            public void Remove(int index)
            {
                List.RemoveAt(index);
            }
            public TracNghiemBO Index(int index)
            {
                return (TracNghiemBO)List[index];
            }


        }
   
}
