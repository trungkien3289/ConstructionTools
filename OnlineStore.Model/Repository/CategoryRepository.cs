using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.Context;
using OnlineStore.Model.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.Repository
{
    public class CategoryRepository : Repository<ecom_Categories>, IHierarchicalStructure<ecom_Categories,int>
    {
        #region Contructures

        public CategoryRepository(OnlineStoreMVCEntities context)
            : base(context)
        {

        }

        #endregion

        #region Public functions

        /// <summary>
        /// Get all category
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ecom_Categories> GetAllCategories()
        {
            return dbSet.ToList();
        }

        /// <summary>
        /// Get categories except which one have status is Delete(Just Active and Deactive)
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ecom_Categories> GetAllCategoriesWithoutDelete()
        {
            return dbSet.Where(c => c.Status != (int)Define.Status.Delete).ToList();
        }

        /// <summary>
        /// Get categories except which one have status is Delete(Just Active and Deactive)
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ecom_Categories> GetAllActiveCategories()
        {
            return dbSet.Where(c => c.Status == (int)Define.Status.Active).ToList();
        }
        
        /// <summary>
        /// Find category by id with status not equal to Delete
        /// </summary>
        /// <returns></returns>
        public ecom_Categories GetCategoryById(int id)
        {
            return dbSet.Where(c =>c.Id == id && c.Status != (int)Define.Status.Delete).FirstOrDefault();
        }

        public IEnumerable<ecom_Categories> GetChildrenByParentCategoryId(int? parentId)
        {
            return dbSet.Include("ecom_Products").Where(c => c.ParentId == parentId && c.Status == (int)Define.Status.Active).ToList();
        }

        /// <summary>
        /// Get all category with status is active
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ecom_Categories> GetAllActiveCategory()
        {
            return dbSet.Where(c => c.Status == (int)Define.Status.Active).ToList();
        }

        /// <summary>
        /// Get list top category(root category without children)
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ecom_Categories> GetTopCategories()
        {
            return dbSet.Where(c => c.Status == (int)Define.Status.Active && c.ParentId == null).Take(8).ToList();
        }

        #endregion

        public ecom_Categories GetParentItem(int itemId)
        {
            var item = GetCategoryById(itemId);
            if (item == null)
            {
                throw new ApplicationException("Category not found.");
            }

            if (item.ParentId == null)
            {
                return null;
            }
            else
            {
                return GetCategoryById(item.ParentId.Value);
            }
        }

        public IList<ecom_Categories> GetPath(int itemId)
        {
            List<ecom_Categories> path = new List<ecom_Categories>();
            path.Add(GetCategoryById(itemId));
            ecom_Categories parentItem;
            int? currentItemId = itemId;
            do
            {
                if (currentItemId == null)
                {
                    parentItem = null;
                }
                else
                {
                    parentItem = GetParentItem(currentItemId.Value);
                }
                if (parentItem != null)
                {
                    path.Add(parentItem);
                    currentItemId = parentItem.ParentId;
                }
            } while (parentItem != null);

            return path;
        }

        public IList<ecom_Categories> GetChildren(int itemId)
        {
            return dbSet.Where(c => c.ParentId == itemId).ToList();
        }
    }
}
