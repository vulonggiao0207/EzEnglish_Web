using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using BO;
namespace BUS
{
    public class TracNghiemBUS
    {
        TuVungDAO tuvungDAO= new TuVungDAO();

        Random rd = new Random();
        private int RandomTuVung(int max)
        {
            return rd.Next(0, max);
        }
        private bool KiemTraTrungCauHoi(TracNghiemCollection cauhoiColl, TuVungBO tv)
        {
            foreach (TracNghiemBO tn in cauhoiColl)
            {
                if (tv.TuVungID == tn.Choices[0].TuVungID)
                    return true;
            }
            return false;
        }
        private bool KiemTraTrungCauTraLoi(TuVungBO[] tuvung, TuVungBO temp, int n)
        {
            for (int i = 0; i < n; i++)
            {
                if (temp == tuvung[i])
                    return true;
            }
            return false;
        }
        //Tạo ra danh sách các [CâuHỏi]
        private TracNghiemCollection TaoDanhSachCauHoi_TracNghiem(TuVungCollection tuvunglambantest, int socauhoilambai)
        {
            TracNghiemCollection CauHoiColl = new TracNghiemCollection();
            int i = 0;
            while (i < socauhoilambai)
            {
                //Chọn ngẫu nhiên 1 câu hỏi trong tuvunglambaitest
                int stt = RandomTuVung(tuvunglambantest.Count);
                TuVungBO temp = tuvunglambantest.Index(stt);
                //Kiểm tra câu hỏi đã có trong danh sách chưa
                //Nếu có rồi: Tạo lại -->Kiểm tra
                //Nếu chưa: Add vào --> i++
                while (KiemTraTrungCauHoi(CauHoiColl, temp) == true || temp.ViDu.Trim() == "")
                {
                    stt = RandomTuVung(tuvunglambantest.Count);
                    temp = tuvunglambantest.Index(stt);
                }
                TracNghiemBO tnBO = new TracNghiemBO();
                tnBO.Choices[0] = temp;
                CauHoiColl.Add(tnBO);
                i++;
            }
            return CauHoiColl;
        }
        private TracNghiemCollection TaoDanhSachCauHoi_HinhAnh(TuVungCollection tuvunglambantest, int socauhoilambai)
        {
            TracNghiemCollection CauHoiColl = new TracNghiemCollection();
            int i = 0;
            while (i < socauhoilambai)
            {
                //Chọn ngẫu nhiên 1 câu hỏi trong tuvunglambaitest
                int stt = RandomTuVung(tuvunglambantest.Count);
                TuVungBO temp = tuvunglambantest.Index(stt);
                //Kiểm tra câu hỏi đã có trong danh sách chưa
                //Nếu có rồi: Tạo lại -->Kiểm tra
                //Nếu chưa: Add vào --> i++
                while (KiemTraTrungCauHoi(CauHoiColl, temp) == true || temp.HinhAnh.Trim() == "")
                {
                    stt = RandomTuVung(tuvunglambantest.Count);
                    temp = tuvunglambantest.Index(stt);
                }
                TracNghiemBO tnBO = new TracNghiemBO();
                tnBO.Choices[0] = temp;
                CauHoiColl.Add(tnBO);
                i++;
            }
            return CauHoiColl;
        }
       
        private TracNghiemCollection TaoDanhSachCauTraLoi(TuVungCollection tuvunglambantest, TracNghiemCollection CauHoicoll)
        {
            int i = 0;
            while (i < CauHoicoll.Count)
            {
                int ques_pos = 1;
                while (ques_pos < 4)
                {
                    //Chọn ngẫu nhiên 1 trả lời trong tuvunglambaitest
                    int stt = RandomTuVung(tuvunglambantest.Count);
                    TuVungBO temp = tuvunglambantest.Index(stt);
                    //Kiểm tra câu trả lời đã có trong danh sách trả lời chưa
                    //Nếu có rồi: Tạo lại -->Kiểm tra
                    //Nếu chưa: Add vào --> i++
                    while (KiemTraTrungCauTraLoi(CauHoicoll.Index(i).Choices, temp, ques_pos) == true)
                    {
                        stt = RandomTuVung(tuvunglambantest.Count);
                         temp = tuvunglambantest.Index(stt);
                    }
                    CauHoicoll.Index(i).Choices[ques_pos] = temp;
                    ques_pos++;
                }
                i++;
            }
            return CauHoicoll;
        }
        private TracNghiemCollection SapXepNgauNhien(TracNghiemCollection CauTraLoiColl)
        {
            TracNghiemCollection BaiTest = new TracNghiemCollection();

            for (int i = 0; i < CauTraLoiColl.Count; i++)
            {
                int new_pos = -1;
                new_pos = RandomTuVung(4);
                if (i > 1)
                {
                    while (new_pos == CauTraLoiColl.Index(i - 2).CauTraLoiDung)
                    {
                        new_pos = RandomTuVung(4);
                    }
                }
                CauTraLoiColl.Index(i).CauTraLoiDung = new_pos;
                //Hóan vị câu trả lới đúng với câu trả lời bất kỳ
                TuVungBO oldtv = CauTraLoiColl.Index(i).Choices[0];
                TuVungBO newtv = CauTraLoiColl.Index(i).Choices[new_pos];
                CauTraLoiColl.Index(i).Choices[0] = newtv;
                CauTraLoiColl.Index(i).Choices[new_pos] = oldtv;
            }
            BaiTest = CauTraLoiColl;
            return BaiTest;
        }          
       
        //HÀM TẠO RA BÀI TRẮC NGHIỆM
        public TracNghiemCollection TaoBai_TracNghiem(TuVungCollection tuvungColl,int socauhoi)
        {
            try
            {
                TracNghiemCollection DanhsachCauHoi = new TracNghiemCollection();
                TracNghiemCollection DanhsachCauTraLoi = new TracNghiemCollection();
                TracNghiemCollection baitracnghiem = new TracNghiemCollection();
                DanhsachCauHoi = TaoDanhSachCauHoi_TracNghiem(tuvungColl,socauhoi);
                DanhsachCauTraLoi = TaoDanhSachCauTraLoi(tuvungColl, DanhsachCauHoi);           
                baitracnghiem = SapXepNgauNhien(DanhsachCauTraLoi);
                return baitracnghiem;
            }
            catch
            {
                return null;
            }

        }

        //HÀM TẠO RA BÀI HÌNH ẢNH     
        public TracNghiemCollection TaoBai_Hinhanh(TuVungCollection tuvungColl, int socauhoi)
        {
            try
            {
                TracNghiemCollection DanhsachCauHoi = new TracNghiemCollection();
                TracNghiemCollection DanhsachCauTraLoi = new TracNghiemCollection();
                TracNghiemCollection baitracnghiem = new TracNghiemCollection();
                DanhsachCauHoi = TaoDanhSachCauHoi_HinhAnh(tuvungColl, socauhoi);
                DanhsachCauTraLoi = TaoDanhSachCauTraLoi(tuvungColl, DanhsachCauHoi);
                baitracnghiem = SapXepNgauNhien(DanhsachCauTraLoi);
                return baitracnghiem;
            }
            catch
            {
                return null;
            }

        }
    }
}
