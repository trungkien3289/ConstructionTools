using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.Interface
{
    public interface IHierarchicalStructure<T, IdType>
        where T : class
        where IdType : struct
    {
        T GetParentItem(IdType itemId);
        IList<T> GetPath(IdType itemId);
        IList<T> GetChildren(IdType itemId);
    }
}
