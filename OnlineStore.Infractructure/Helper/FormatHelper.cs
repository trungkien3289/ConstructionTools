using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace OnlineStore.Infractructure.Helper
{
    public static class FormatHelper
    {
        public const string currencySymbol = "VND";

        public static string FormatMoney(Decimal money){
            NumberFormatInfo nfi;
            Thread.CurrentThread.CurrentCulture = CultureInfo.GetCultureInfo("vi-VN");
            nfi = CultureInfo.CurrentCulture.NumberFormat.Clone() as NumberFormatInfo;
            nfi.CurrencySymbol = "VND";
            String result = money.ToString("c0", nfi);

            return result;
        }
        public static string FormatMoney(Decimal money, string symbol)
        {
            NumberFormatInfo nfi;
            Thread.CurrentThread.CurrentCulture = CultureInfo.GetCultureInfo("vi-VN");
            nfi = CultureInfo.CurrentCulture.NumberFormat.Clone() as NumberFormatInfo;
            nfi.CurrencySymbol = symbol;
            String result = money.ToString("c0", nfi);

            return result;
        }
    }
}
