using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestProj1
{
    public class Bindings : Ninject.Modules.NinjectModule
    {
        public override void Load()
        {
            Bind<iLog>().To<EventLog>();
        }
    }

    public interface iLog
    {
        void LogEvent(string message);
    }

    public class EventLog:iLog
    {
        public void LogEvent(string mesage)
        {

        }
    }

    public class Employee
    {
        public Employee(iLog log)
        {
            log.LogEvent("test");
        }
    }
}