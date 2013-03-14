using System;
using System.Collections.Generic;

namespace $rootnamespace$.CodeGuard.Internals
{
    public class AccumulateErrorsArg<T> : ArgBase<T>
    {
        public AccumulateErrorsArg(Func<T> argument) : base(argument)
        {
            this.Message = new SaveMessageHandler<T>(this);
        }

        public AccumulateErrorsArg(T argument) : base(argument)
        {
            this.Message = new SaveMessageHandler<T>(this);
            this.Value = argument;
        }

        public override IEnumerable<ErrorInfo> Errors
        {
            get { return ((SaveMessageHandler<T>) this.Message).GetResult(); }
        }
    }
}