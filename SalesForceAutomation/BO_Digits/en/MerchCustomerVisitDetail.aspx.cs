using GoogleApi.Entities.Common.Enums;
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Xml;
using Telerik.Web.UI;
using Telerik.Web.UI.Skins;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class MerchCustomerVisitDetail : System.Web.UI.Page
    {
        GeneralFunctions obj = new GeneralFunctions();
        public string Mode
        {
            get
            {
                string Mode = Request.Params["Mode"].ToString();

                return Mode;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    Route();

                    ViewState["StatusCondition"] = "";

                    if (Session["FromDate"] != null)
                    {
                        rdfromDate.SelectedDate = DateTime.Parse(Session["FromDate"].ToString());
                    }
                    if (Session["ToDate"] != null)
                    {
                        rdendDate.SelectedDate = DateTime.Parse(Session["ToDate"].ToString());
                    }
                    if (Session["RouteForMerVisits"] != null)
                    {

                        string rotID = Session["RouteForMerVisits"].ToString();
                        string[] ar = rotID.Split(',');
                        int k = 0;
                        foreach (RadComboBoxItem items in ddlRoute.Items)
                        {
                            string rot = items.Value;
                            string arrot = ar[k];
                            if (items.Value == ar[k])
                            {
                                items.Checked = true;
                                k++;
                            }
                        }

                        int c = k;
                        string rotcount = Rot();
                    }
                    else
                    {
                        RouteFromTransaction();
                    }
                }
                catch (Exception ex)
                {
                    Response.Redirect("~/SignIn.aspx");
                }

                    LoadActualData();
                    grvRpt.Rebind();
                
            }
        }

        public void Route()
        {
            string[] arr = { "1=1" };
            ddlRoute.DataSource = obj.loadList("SelectRouteForDropDowns", "sp_Merch_Dashboard", UICommon.GetCurrentUserID().ToString(), arr);
            ddlRoute.DataTextField = "rot_Name";
            ddlRoute.DataValueField = "rot_ID";
            ddlRoute.DataBind();
        }
        public void RouteFromTransaction()
        {
            int j = 1;
            foreach (RadComboBoxItem itmss in ddlRoute.Items)
            {
                itmss.Checked = true;
                j++;
            }
        }
        public string Rot()
        {
            var CollectionMarket = ddlRoute.CheckedItems;
            string rotID = "";
            int j = 0;
            int MarCount = CollectionMarket.Count;
            if (CollectionMarket.Count > 0)
            {
                foreach (var item in CollectionMarket)
                {
                    if (j == 0)
                    {
                        rotID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        rotID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        rotID += item.Value;
                    }
                    j++;
                }
                return rotID;
            }
            else
            {
                return "rot_ID";
            }
        }

        public string Routes()
        {
            using (var sw = new StringWriter())
            {
                using (var writer = XmlWriter.Create(sw))
                {
                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("r");
                    int c = 0;

                    var CollectionMarket = ddlRoute.CheckedItems;
                    int MarCount = CollectionMarket.Count;
                    if (CollectionMarket.Count > 0)
                    {
                        foreach (var item in CollectionMarket)
                        {
                            string rotId = item.Value;
                            createNode(rotId, writer);
                            c++;
                        }
                    }
                    writer.WriteEndElement();
                    writer.WriteEndDocument();
                    writer.Close();
                    if (c == 0)
                    {
                        return "";
                    }
                    else
                    {
                        string ss = sw.ToString();
                        return sw.ToString();
                    }
                }
            }
        }

        private void createNode(string rotId, XmlWriter writer)
        {
            writer.WriteStartElement("Values");

            writer.WriteStartElement("rotID");
            writer.WriteString(rotId);
            writer.WriteEndElement();

            writer.WriteEndElement();
        }

        
        public void LoadActualData()
        {
            string fromDate = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string endDate = DateTime.Parse(rdendDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string rot = Routes();
            string Status = ViewState["StatusCondition"].ToString();
            string StatCondition = "";

            if (!string.IsNullOrEmpty(Status))
            {
                StatCondition = ViewState["StatusCondition"].ToString();
            }
            else
            {
                StatCondition = "";
            }

            DataTable lstUser = default(DataTable);
            string[] arr = { fromDate, endDate, StatCondition };
            lstUser = obj.loadList("CustomerVisitsActualData", "sp_Dashboard", rot, arr);
            grvRpt.DataSource = lstUser;
        }



        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
              LoadActualData();


        }
        protected void Filter_Click(object sender, EventArgs e)
        {
            
                LoadActualData();
                grvRpt.Rebind();

            
        }

       

        
      
    }
}