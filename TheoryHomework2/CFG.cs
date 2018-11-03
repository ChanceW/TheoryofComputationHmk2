using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TheoryHomework2
{
    static class  CFG
    {
        private static string[] language = new string[] { "0S0", "1S1", "0", "1", ""};

        public static List<string> ProcessString(string input) {
            var result = new List<string>() { input };
            var newSegment = input;
            var halfIndex = newSegment.Length / 2;
            if (newSegment.Length > 1 && newSegment.Length % 2 != 0)
            {
                newSegment = newSegment.Remove(halfIndex, 1);
            }

            if (newSegment.Length <= 1)
            {
                result.Add((language.Contains(newSegment)) ? "S" : "FAIL");
            }
            else
            {
                newSegment = newSegment.Insert(halfIndex, "S");
                result.Add(newSegment);
            }

            while (newSegment.Length >= 3)
            {
                var S = newSegment.Substring(newSegment.IndexOf("S") - 1, 3);
                if (language.Contains(S))
                {
                    newSegment = newSegment.Replace(S, "S");
                    result.Add(newSegment);
                }
                else
                {
                    result.Add("FAIL");
                    break;
                }
            }
            return result;
        }
    }
}
