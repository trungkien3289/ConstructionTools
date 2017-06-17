using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using LinqKit;

namespace OnlineStore.Model.Repository
{
    public class ProductRepository : Repository<ecom_Products>
    {
        #region Constructures

        public ProductRepository(OnlineStoreMVCEntities context)
            : base(context)
        {

        }

        #endregion

        #region Public functions

        /// <summary>
        /// Get all product
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ecom_Products> GetAllProducts()
        {
            return dbSet.ToList();
        }

        /// <summary>
        /// Get products except which one have status is Delete(Just Active and Deactive)
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ecom_Products> GetAllProductsWithoutDelete()
        {
            return dbSet.Include("share_Images").Include("CoverImage").Where(c => c.Status != (int)Define.Status.Delete).ToList();
        }

        /// <summary>
        /// Find product by id with status not equal to Delete
        /// </summary>
        /// <returns></returns>
        public ecom_Products GetProductById(int id)
        {
            return dbSet.Include("share_Images").Include("CoverImage").Include("ecom_ProductGroups").Include("ecom_Categories").Where(c => c.Id == id && c.Status != (int)Define.Status.Delete).FirstOrDefault();
        }

        /// <summary>
        /// Get products belong to a specific group
        /// </summary>
        /// <param name="groupId"></param>
        /// <returns></returns>
        public IEnumerable<ecom_Products> GetProductsInGroup(int groupId)
        {
            return dbSet.Where(p => p.ecom_ProductGroups.Select(g => g.Id).Contains(groupId) && p.Status == (int)Define.Status.Active).ToList();
        }

        public int Count(Expression<Func<ecom_Products, bool>> filter = null)
        {
            IQueryable<ecom_Products> query = dbSet;

            if (filter != null)
            {
                query = query.AsExpandable().Where(filter).Distinct();
            }

            return query.Count();
        }

        #endregion
    }
}
