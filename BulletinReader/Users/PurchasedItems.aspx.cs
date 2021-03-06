﻿namespace BulletinReader.Users
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;

    public partial class PurchasedItems : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.RefillPurchasedItems();
            }

            if (this.GridView.Rows.Count > 0)
            {
                this.GridView.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void RefillPurchasedItems()
        {
            var purchasedItems = from purchasedItem in Global.Instance.DbContextMain.PurchasedItems
                                 where purchasedItem.UserId == this.LoggedUser.Id
                                 orderby purchasedItem.TransactionDate descending
                                 select purchasedItem;

            this.GridView.DataSource = purchasedItems.ToList();
            this.GridView.DataBind();

            this.NoRecords.Visible = (purchasedItems.Count() < 1);
        }
    }
}