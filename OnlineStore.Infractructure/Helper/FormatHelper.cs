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

        /// <summary>
        /// Format money
        /// </summary>
        /// <param name="money"></param>
        /// <returns></returns>
        public static string FormatMoney(Decimal money){
            NumberFormatInfo nfi;
            Thread.CurrentThread.CurrentCulture = CultureInfo.GetCultureInfo("vi-VN");
            nfi = CultureInfo.CurrentCulture.NumberFormat.Clone() as NumberFormatInfo;
            nfi.CurrencySymbol = "VND";
            String result = money.ToString("c0", nfi);

            return result;
        }

        /// <summary>
        /// Format money with a specific symbol
        /// </summary>
        /// <param name="money">money</param>
        /// <param name="symbol">symbol</param>
        /// <returns></returns>
        public static string FormatMoney(Decimal money, string symbol)
        {
            NumberFormatInfo nfi;
            Thread.CurrentThread.CurrentCulture = CultureInfo.GetCultureInfo("vi-VN");
            nfi = CultureInfo.CurrentCulture.NumberFormat.Clone() as NumberFormatInfo;
            nfi.CurrencySymbol = symbol;
            String result = money.ToString("c0", nfi);

            return result;
        }

        /// <summary>
        /// Calculate percentage of 2 number
        /// </summary>
        /// <param name="number"></param>
        /// <param name="divider"></param>
        /// <returns></returns>
        public static int CalculatePercetage(decimal number, decimal divider)
        {
            if (divider == 0)
            {
                throw new ApplicationException("Cannot divide for 0");
            }
            else
            {
                return  100 - (int)((number / divider)*100);
            }
        }
    }
}
