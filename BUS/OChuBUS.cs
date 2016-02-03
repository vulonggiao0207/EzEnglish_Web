using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using BO;
namespace BUS
{
    public class OChuBUS
    {       
        Random rd = new Random();
        //B1: Lấy ra một từ ngẫunhiên làm từ hàng dọc
        private string LayChuHangDoc(TuVungCollection tuvunglambaitest)
        {
            List<char> Tu = new List<char>();
            int len = tuvunglambaitest.Count;
            int rand = rd.Next(len);
            string temp = "";
            while (true)
            {
                rand = rd.Next(len);
                temp = tuvunglambaitest.Index(rand).TuVung;
                if (temp.Length < 10)
                {
                    rand = rd.Next(len);
                    break;
                }
            }
            /*char[] TuTemp = temp.ToCharArray();
            for (int i = 0; i < TuTemp.Length; i++)
                Tu.Add(TuTemp[i]);*/
            return temp;
        }
        //B2: Lấy ra các từ hàng ngang
        private TuVungBO LayChuHangNgang(TuVungCollection tuvunglambaitest, char tu)
        {
            //Lấy ra các [TuVungBO].[TuVung] có chứ [tu]
            TuVungCollection tempColl = new TuVungCollection();
            foreach (TuVungBO tv in tuvunglambaitest)
            {
                if (tv.TuVung.Contains(tu))
                {
                    tempColl.Add(tv);
                }
            }
            //chọn ngẫu nhiên một từ
            if (tempColl.Count == 0)
                return null;
            int rand = rd.Next(tempColl.Count);
            return tempColl.Index(rand);
        }
        private bool KiemTraHopLe(string tu, char vitri)
        {
            int vitrikytu = tu.IndexOf(vitri);
            if (tu.Substring(0, vitrikytu).Length > 10)
                return false;
            if (tu.Substring(vitrikytu + 1, tu.Length - tu.Substring(0, vitrikytu).Length - 1).Length > 10)
                return false;
            return true;
        }//Kiểm tra xem chiều dài hàng ngang có quá ô chữ không
        private bool KiemTraTrungTuDoc(string tudoc, string tuKT) // Kiểm tra có trùng từ hàng dọc không
        {
            if (tudoc == tuKT)
                return true;
            return false;
        }
        private bool KiemTraTrungTuNgang(List<string> HangNgangList, string tuKT)
        {
            foreach (string tu in HangNgangList)
            {
                if (tuKT == tu)
                    return true;
            }
            return false;
        } //Kiểm Tra có trùng từ hàng ngang nào không    
        private string [,]SapxepOChu(List<char> tuhangdoc,TuVungCollection HangNgangList)
        {
            string[,] OChu = new string[12, 21];
            for (int a = 0; a < 12; a++)
                for (int b = 0; b < 21; b++)
                    OChu[a, b] = "";
            for (int i = 0; i < tuhangdoc.Count; i++)
            {
                char tu=tuhangdoc[i];
                string tuhangngang=HangNgangList.Index(i).TuVung;
                int vitrikytu = tuhangngang.IndexOf(tu);
                int truoc = tuhangngang.Substring(0, vitrikytu).Length;//chiều dài tính từ đầu đến [vitrikytu]
                int sau = tuhangngang.Substring(vitrikytu + 1, tuhangngang.Length - truoc - 1).Length; //chiều dài tính từ [vitrikytu] đến cuối

                int k = 0;
                for (int j = 10-truoc; j < 10+sau+1; j++)
                {
                    List<char> temp = new List<char>();
                    temp = tuhangngang.ToList();
                    OChu[i, j] = temp[k].ToString();
                    k++;
                }
            }
            return OChu;
        }
        public string [,]TaoOChu(TuVungCollection tuvunglambaitest,ref int len,ref TuVungCollection GoiYOChu)
        {
            try
            {
                //B1:Lấy ra một từ ngẫunhiên làm từ hàng dọc
                string tuhangdoc = LayChuHangDoc(tuvunglambaitest);
                List<char> TuHangDoc = new List<char>();//chuyển string thành List<string> để xử lý           
                TuHangDoc = tuhangdoc.ToList();

                //B2: Lấy ra các từ hàng ngang
                TuVungCollection HangNgangList = new TuVungCollection();//Lưu các đối tượng tuvungBO hàng ngang
                List<string> HangNgang = new List<string>(); //Lưu các từ hàng ngang
                int i = 0;
                int solanloop = 0;
                while (i < TuHangDoc.Count)
                {
                    TuVungBO tuhangnganBO = new TuVungBO();
                    tuhangnganBO = LayChuHangNgang(tuvunglambaitest, TuHangDoc[i]);
                    if (tuhangnganBO == null) return null;
                    string tuhangngang = tuhangnganBO.TuVung;
                    if (KiemTraHopLe(tuhangngang, TuHangDoc[i]) == true 
                        && KiemTraTrungTuDoc(tuhangdoc, tuhangngang) == false 
                        && KiemTraTrungTuNgang(HangNgang, tuhangngang) == false)
                    {
                        HangNgang.Add(tuhangnganBO.TuVung);
                        HangNgangList.Add(tuhangnganBO);
                        i++;
                        solanloop = 0;
                    }
                    solanloop++;
                    if (solanloop > 30)
                        return null;
                }
                //B3: Bố trí ô chữ lên mảng 2 chiều [12,21]
                len = TuHangDoc.Count;
                GoiYOChu = HangNgangList;
                return SapxepOChu(TuHangDoc,HangNgangList) ;
            }
            catch
            {
                return null;
            }

        }

    }
}
