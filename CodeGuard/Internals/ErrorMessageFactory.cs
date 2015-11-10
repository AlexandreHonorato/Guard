﻿using System;

namespace Seterlund.CodeGuard.Internals
{
    public static class ErrorMessageFactory
    {

        public static string OutOfRange<T>(IArg<T> arg, T min, T max)
        {            
            if (string.IsNullOrEmpty(arg.Name))
            {
                return string.Format("The value '{0}' is not in its allowed range of '{1}' to '{2}'", arg.Value, min, max);                
            }
            return string.Format("The value '{0}' of '{1}' is not in its allowed range of '{2}' to '{3}'", arg.Value, arg.Name.Value, min, max);
        }

        public static string LargerThan<T>(IArg<T> arg, T max)
        {            
            if (string.IsNullOrEmpty(arg.Name))
            {
                return string.Format("The value '{0}' is larger than '{1}'", arg.Value, max);                
            }
            return string.Format("The value '{0}' of '{1}' is larger than '{2}'", arg.Value, arg.Name.Value, max);
        }

        public static string LessThan<T>(IArg<T> arg, T min)
        {            
            if (string.IsNullOrEmpty(arg.Name))
            {
                return string.Format("The value '{0}' is less than '{1}'", arg.Value, min);                
            }
            return string.Format("The value '{0}' of '{1}' is less than '{2}'", arg.Value, arg.Name.Value, min);
        }

        public static string NotEqual<T>(IArg<T> arg, T expected)
        {
            return string.Format("The value '{0}' is not equal to '{1}'", arg.Value, expected);
        }
    }
}
