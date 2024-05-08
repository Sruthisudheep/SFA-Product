using GoogleApi.Entities.Common.Enums;
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Xml;
using Telerik.Web.UI;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class CustomerVisitDetailFromDashboard : System.Web.UI.Page
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
                    if (Session["Route"] != null)
                    {

                        string rotID = Session["Route"].ToString();
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

                if (Mode == "Planned" ) 
                {
                    LoadPlannedVisited();
                    LoadPlannedPending();

                    LoadPlannedData();
                    grvRpt.Rebind();
                    RadGrid1.Rebind();
                    RadGrid2.Rebind();
                    lblHeading.Text = "Planned Visits";
                    pnlUnplanned.Visible = false;
                    pnlPending.Visible = true;
                }
                else if (Mode == "Actual")
                {
                    LoadActualPlanned();
                    LoadActualUnPlanned();

                    LoadActualData();
                    grvRpt.Rebind();
                    RadGrid1.Rebind();
                    RadGrid2.Rebind();
                    lblHeading.Text = "Actual Visits";
                    pnlUnplanned.Visible = true;
                    pnlPending.Visible = false;
                }
                else if(Mode == "Prod")
                {
                    LoadProdPlanned();
                    LoadProdUnPlanned();

                    LoadProdData();
                    grvRpt.Rebind();
                    RadGrid1.Rebind();
                    RadGrid2.Rebind();
                    lblHeading.Text = "Productive Visits";
                    pnlUnplanned.Visible = true;
                    pnlPending.Visible = false;
                }
                else if (Mode == "NonProd")
                {                  
                    LoadNonProdPlanned();
                    LoadNonProdUnPlanned();

                    LoadNonProdData();
                    grvRpt.Rebind();
                    RadGrid1.Rebind();
                    RadGrid2.Rebind();
                    lblHeading.Text = "Non Productive Visits";
                    pnlUnplanned.Visible = true;
                    pnlPending.Visible = false;
                }
                else 
                {
                   
                   
                }
            }
        }

        public void Route()
        {          
            ddlRoute.DataSource = obj.loadList("SelRouteForVisitDropDown", "sp_Dashboard", UICommon.GetCurrentUserID().ToString());
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
      
        public void LoadPlannedData()
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
            string[] arr = { fromDate, endDate , StatCondition };
            lstUser = obj.loadList("CustomerPlannedData", "sp_Dashboard", rot , arr);
            grvRpt.DataSource = lstUser;
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
            string[] arr = { fromDate,endDate, StatCondition };
            lstUser = obj.loadList("CustomerVisitsActualData", "sp_Dashboard", rot,arr);
            grvRpt.DataSource = lstUser;
        }
        public void LoadProdData()
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
            string[] arr = { fromDate,endDate, StatCondition };
            lstUser = obj.loadList("CustomerVisitsProdData", "sp_Dashboard", rot, arr);
            grvRpt.DataSource = lstUser;
        }
        public void LoadNonProdData()
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
            string[] arr = { fromDate,endDate , StatCondition };
            lstUser = obj.loadList("CustomerVisitsNonProdData", "sp_Dashboard", rot, arr);
            grvRpt.DataSource = lstUser;
        }

        public void LoadPlannedVisited()
        {
            string fromDate = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string endDate = DateTime.Parse(rdendDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string rot = Routes();
            DataTable lstUser = default(DataTable);
            string[] arr = { fromDate, endDate };
            lstUser = obj.loadList("CustomerPlannedVisited", "sp_Dashboard", rot, arr);
            RadGrid1.DataSource = lstUser;
        }
        public void LoadPlannedPending()
        {
            string fromDate = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string endDate = DateTime.Parse(rdendDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string rot = Routes();
            DataTable lstUser = default(DataTable);
            string[] arr = { fromDate,endDate };
            lstUser = obj.loadList("CustomerPlannedPending", "sp_Dashboard", rot, arr);
            RadGrid2.DataSource = lstUser;
        }
        public void LoadActualPlanned()
        {
            string fromDate = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string endDate = DateTime.Parse(rdendDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string rot = Routes();
            DataTable lstUser = default(DataTable);
            string[] arr = { fromDate,endDate };
            lstUser = obj.loadList("CustomerActualPlanned", "sp_Dashboard", rot, arr);
            RadGrid1.DataSource = lstUser;
        }
        public void LoadActualUnPlanned()
        {
            string fromDate = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string endDate = DateTime.Parse(rdendDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string rot = Routes();
            DataTable lstUser = default(DataTable);
            string[] arr = { fromDate,endDate };
            lstUser = obj.loadList("CustomerActualUnPlanned", "sp_Dashboard", rot, arr);
            RadGrid2.DataSource = lstUser;
        }
        public void LoadProdPlanned()
        {
            string fromDate = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string endDate = DateTime.Parse(rdendDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string rot = Routes();
            DataTable lstUser = default(DataTable);
            string[] arr = { fromDate,endDate };
            lstUser = obj.loadList("CustomerProductivePlanned", "sp_Dashboard", rot, arr);
            RadGrid1.DataSource = lstUser;
        }
        public void LoadProdUnPlanned()
        {
            string fromDate = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string endDate = DateTime.Parse(rdendDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string rot = Routes();
            DataTable lstUser = default(DataTable);
            string[] arr = { fromDate,endDate };
            lstUser = obj.loadList("CustomerProductiveUnPlanned", "sp_Dashboard", rot, arr);
            RadGrid2.DataSource = lstUser;
        }
        public void LoadNonProdPlanned()
        {
            string fromDate = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string endDate = DateTime.Parse(rdendDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string rot = Routes();
            DataTable lstUser = default(DataTable);
            string[] arr = { fromDate,endDate };
            lstUser = obj.loadList("CustomerNonProductivePlanned", "sp_Dashboard", rot, arr);
            RadGrid1.DataSource = lstUser;
        }
        public void LoadNonProdUnPlanned()
        {
            string fromDate = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string endDate = DateTime.Parse(rdendDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string rot = Routes();
            DataTable lstUser = default(DataTable);
            string[] arr = { fromDate,endDate };
            lstUser = obj.loadList("CustomerNonProductiveUnPlanned", "sp_Dashboard",rot , arr);
            RadGrid2.DataSource = lstUser;
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (Mode == "Planned")
            {
                LoadPlannedData();
            }
            else if (Mode == "Actual")
            {
                LoadActualData();
               
            }
            else if (Mode == "Prod")
            {
                LoadProdData();
               
            }
            else if (Mode == "NonProd")
            {
                LoadNonProdData();
               
            }
            else
            {
            }
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }

        protected void Filter_Click(object sender, EventArgs e)
        {
            if (Mode == "Planned")
            {
                LoadPlannedVisited();
                LoadPlannedPending();

                LoadPlannedData();
                grvRpt.Rebind();
                RadGrid1.Rebind();
                RadGrid2.Rebind();
                lblHeading.Text = "Planned Visits";
                pnlUnplanned.Visible = false;
                pnlPending.Visible = true;
            }
            else if (Mode == "Actual")
            {
                LoadActualPlanned();
                LoadActualUnPlanned();

                LoadActualData();
                grvRpt.Rebind();
                RadGrid1.Rebind();
                RadGrid2.Rebind();
                lblHeading.Text = "Actual Visits";
                pnlUnplanned.Visible = true;
                pnlPending.Visible = false;
            }
            else if (Mode == "Prod")
            {
                LoadProdPlanned();
                LoadProdUnPlanned();

                LoadProdData();
                grvRpt.Rebind();
                RadGrid1.Rebind();
                RadGrid2.Rebind();
                lblHeading.Text = "Productive Visits";
                pnlUnplanned.Visible = true;
                pnlPending.Visible = false;
            }
            else if (Mode == "NonProd")
            {
                LoadNonProdPlanned();
                LoadNonProdUnPlanned();

                LoadNonProdData();
                grvRpt.Rebind();
                RadGrid1.Rebind();
                RadGrid2.Rebind();
                lblHeading.Text = "Non Productive Visits";
                pnlUnplanned.Visible = true;
                pnlPending.Visible = false;
            }
            else
            {
            }
        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (Mode == "Planned")
            {
                LoadPlannedVisited();
                LoadPlannedPending();

            }
            else if (Mode == "Actual")
            {
                LoadActualPlanned();
                LoadActualUnPlanned();

            }
            else if (Mode == "Prod")
            {
                LoadProdPlanned();
                LoadProdUnPlanned();

            }
            else if (Mode == "NonProd")
            {
                LoadNonProdPlanned();
                LoadNonProdUnPlanned();

            }
            else
            {
            }
        }

        protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }

        protected void RadGrid2_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }

        protected void RadGrid2_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (Mode == "Planned")
            {
                LoadPlannedVisited();
                LoadPlannedPending();

            }
            else if (Mode == "Actual")
            {
                LoadActualPlanned();
                LoadActualUnPlanned();

            }
            else if (Mode == "Prod")
            {
                LoadProdPlanned();
                LoadProdUnPlanned();

            }
            else if (Mode == "NonProd")
            {
                LoadNonProdPlanned();
                LoadNonProdUnPlanned();

            }
            else
            {


            }
        }
        protected void Adj_CheckedChanged(object sender, EventArgs e)
        {
            if (Adj.Checked == true)
            {
                
                string StatusCondition = " and isnull(cse_ExistStatus, 'N') <> 'CE' ";
                ViewState["StatusCondition"] = StatusCondition;

                if (Mode == "Planned")
                {
                    LoadPlannedData();
                    grvRpt.Rebind();
                }
                else if (Mode == "Actual")
                {
                    LoadActualData();
                    grvRpt.Rebind();
                }
                else if (Mode == "Prod")
                {
                    LoadProdData();
                    grvRpt.Rebind();
                }
                else if (Mode == "NonProd")
                {
                    LoadNonProdData();
                    grvRpt.Rebind();
                }

            }
            else
            {
                ViewState["StatusCondition"] = "";
                if (Mode == "Planned")
                {                  
                    LoadPlannedData();
                    grvRpt.Rebind();                 
                }
                else if (Mode == "Actual")
                {
                    LoadActualData();
                    grvRpt.Rebind();                 
                }
                else if (Mode == "Prod")
                {
                    LoadProdData();
                    grvRpt.Rebind();                   
                }
                else if (Mode == "NonProd")
                {
                    LoadNonProdData();
                    grvRpt.Rebind();                  
                }
               
            }
        }
    }
};