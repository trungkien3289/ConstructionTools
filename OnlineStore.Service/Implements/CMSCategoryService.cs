﻿using OnlineStore.Model.Context;
using OnlineStore.Model.Repository;
using OnlineStore.Model.ViewModel;
using OnlineStore.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineStore.Model.Mapper;

namespace OnlineStore.Service.Implements
{
    public class CMSCategoryService : ICMSCategoryService
    {
        public IList<CMSCategoryView> GetCMSCategories(int pageNumber, int pageSize, out int totalItems)
        {
            using (var db = new OnlineStoreMVCEntities())
            {
                totalItems = db.cms_Categories.Count(x => x.Status != (int)OnlineStore.Infractructure.Utility.Define.Status.Delete);

                return db.cms_Categories.Where(x => x.Status != (int)OnlineStore.Infractructure.Utility.Define.Status.Delete)
                    .OrderBy(x => x.ParentId).ThenBy(x => x.SortOrder)
                    .Skip(pageSize * (pageNumber - 1)).Take(pageSize)
                    .Select(x => new CMSCategoryView
                    {
                        Id = x.Id,
                        ParentId = x.ParentId,
                        Title = x.Title,
                        Url = x.Url,
                        Description = x.Description,
                        Status = x.Status
                    }).ToList();
            }
        }

        public bool AddCMSCategory(CMSCategoryView categoryView)
        {
            try
            {
                using (var db = new OnlineStoreMVCEntities())
                {
                    var category = new cms_Categories
                    {
                        ParentId = categoryView.ParentId,
                        Title = categoryView.Title,
                        Description = categoryView.Description,
                        Url = categoryView.Url,
                        SortOrder = categoryView.SortOrder,
                        Status = (int)OnlineStore.Infractructure.Utility.Define.Status.Active,
                        CreatedDate = DateTime.Now,
                        ModifiedDate = DateTime.Now
                    };
                    db.cms_Categories.Add(category);
                    db.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool EditCMSCategory(CMSCategoryView categoryView)
        {
            try
            {
                using (var db = new OnlineStoreMVCEntities())
                {
                    var category = db.cms_Categories.Find(categoryView.Id);
                    category.ParentId = categoryView.ParentId;
                    category.Title = categoryView.Title;
                    category.Description = categoryView.Description;
                    category.Url = categoryView.Url;
                    category.SortOrder = categoryView.SortOrder;
                    category.Status = categoryView.Status;
                    category.ModifiedDate = DateTime.Now;
                    db.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public CMSCategoryView GetCategoryById(int? categoryId)
        {
            if (categoryId == null)
                return null;

            using (var db = new OnlineStoreMVCEntities())
            {
                var category = db.cms_Categories.Find(categoryId.Value);
                return new CMSCategoryView
                {
                    Id = category.Id,
                    ParentId = category.ParentId,
                    Title = category.Title,
                    Url = category.Url,
                    Description = category.Description,
                    Status = category.Status,
                    SortOrder = category.SortOrder
                };
            }
        }

        public IList<CMSCategoryView> GetChildCategoriesByParentId(int? parentId)
        {
            if (parentId == null)
                return null;

            using (var db = new OnlineStoreMVCEntities())
            {
                var categories = db.cms_Categories.Where(x => x.ParentId == parentId.Value)
                    .Select(x => new CMSCategoryView
                    {
                        Id = x.Id,
                        ParentId = x.ParentId,
                        Title = x.Title,
                        Url = x.Url,
                        Description = x.Description,
                        Status = x.Status,
                        SortOrder = x.SortOrder
                    });

                if (categories.Count() == 0)
                {
                    var category = db.cms_Categories.Find(parentId);
                    return db.cms_Categories.Where(x => x.ParentId == category.ParentId)
                    .Select(x => new CMSCategoryView
                    {
                        Id = x.Id,
                        ParentId = x.ParentId,
                        Title = x.Title,
                        Url = x.Url,
                        Description = x.Description,
                        Status = x.Status,
                        SortOrder = x.SortOrder
                    }).ToList();
                }
                else {
                    return categories.ToList();
                }
            }
        }

        public bool DeleteCMSCategory(int id)
        {
            try
            {
                using (var db = new OnlineStoreMVCEntities())
                {
                    var category = db.cms_Categories.Find(id);
                    category.Status = (int)OnlineStore.Infractructure.Utility.Define.Status.Delete;
                    db.SaveChanges();

                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// Find item by identifier
        /// </summary>
        /// <param name="itemId">item identifier</param>
        /// <returns>item object</returns>
        private cms_Categories FindCategoryById(int itemId)
        {
            using (var db = new OnlineStoreMVCEntities())
            {
                var item = db.cms_Categories.Find(itemId);
                if (item == null)
                {
                    throw new ApplicationException("Item not found.");
                }else{
                    return item;
                }
            }
        }

        public cms_Categories GetParentItem(int itemId)
        {
            using (var db = new OnlineStoreMVCEntities())
            {
                var item = FindCategoryById(itemId);
                if (item == null)
                {
                    throw new ApplicationException("Cannot find category");
                }
                else
                {
                    if (item.ParentId == null)
                    {
                        return null;
                    }
                    else
                    {
                        return FindCategoryById(item.ParentId.Value);
                    }
                }
            }
        }

        /// <summary>
        /// Get path of item in hierarchical structure
        /// </summary>
        /// <param name="itemId">identifier</param>
        /// <returns>List items in path</returns>
        public IList<cms_Categories> GetPath(int itemId)
        {
            List<cms_Categories> path = new List<cms_Categories>();
            path.Add(FindCategoryById(itemId));
            cms_Categories parentItem;
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

        /// <summary>
        /// Get list children items
        /// </summary>
        /// <param name="itemId"></param>
        /// <returns></returns>
        public IList<cms_Categories> GetChildren(int itemId)
        {
            List<cms_Categories> children;
            using (var db = new OnlineStoreMVCEntities())
            {
                children = db.cms_Categories.Where(c => c.ParentId == itemId).ToList();
            }


            return children;
        }
    }
}
