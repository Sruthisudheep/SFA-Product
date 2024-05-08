using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Telerik.Web.UI;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class AddEditCustomerFOC : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["ID"], out ResponseID);
                return ResponseID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                rdFromData.SelectedDate = DateTime.Now;
                DateTime dt = DateTime.Now;
                TimeSpan oneday = new TimeSpan(1, 0, 0, 0);
                dt = dt.Add(oneday);
                rdEndDate.SelectedDate = dt;
                Route();
                FillForm();
               
            }
        }

        public void FillForm()
        {
            string Id = ResponseID.ToString();
            if (Id.Equals("") || Id == "0")                                //To check whether there is a value for ResponseID or not. For adding there won't be a value.
            {
                rdFromData.MinDate = DateTime.Now;
                DateTime dt = DateTime.Now;
                TimeSpan oneday = new TimeSpan(1, 0, 0, 0);
                dt = dt.Add(oneday);

                rdEndDate.MinDate = dt;
            }
            else                                                                        //If we are editing there will be a value and the following code will be executed.
            {


                DataTable lstDatas = ObjclsFrms.loadList("SelectFOCByID", "sp_Masters_UOM", ResponseID.ToString());
                if (lstDatas.Rows.Count > 0)
                {

                    string name, rotid, cusid, pname, eligible, fromdate, todate, huom, hqty, luom, lqty;                                          //Declare the variables
                    name = lstDatas.Rows[0]["rcs_ID"].ToString();
                    rotid = lstDatas.Rows[0]["rcs_rot_ID"].ToString();

                    Customer(rotid);
                    cusid = lstDatas.Rows[0]["rcs_cus_ID"].ToString();
                    Product(rotid);
                    pname = lstDatas.Rows[0]["crf_prd_ID"].ToString();
                    eligible = lstDatas.Rows[0]["crf_EligibleQty"].ToString();
                    fromdate = lstDatas.Rows[0]["crf_FromDate"].ToString();
                    todate = lstDatas.Rows[0]["crf_ToDate"].ToString();


                    ddlids.SelectedValue = rotid.ToString();
                   

                    rdFromData.SelectedDate = DateTime.Parse(fromdate.ToString());
                    rdEndDate.SelectedDate = DateTime.Parse(todate.ToString());
                    rdFromData.Enabled = false;
                    rdEndDate.Enabled = false;

                  


                }
                else                                                           
                {

                }
            }
        }
        public string GetItemFromGrid2()
        {
            using (var sw = new StringWriter())
            {
                int c = 0;
                using (var writer = XmlWriter.Create(sw))
                {

                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("q");

                    DataTable dsc = new DataTable();
                    foreach (GridDataItem dr in grvcustomer.SelectedItems)
                    {

                        string cus_ID = dr.GetDataKeyValue("cus_ID").ToString();

                        createNode2(cus_ID, writer);
                        c++;
                    }
                    writer.WriteEndElement();
                    writer.WriteEndDocument();
                    writer.Close();

                }
                if (c == 0)
                {

                    return null;
                }
                else
                {
                    string ss = sw.ToString();
                    return sw.ToString();
                }
            }
        }
        private void createNode2(string cus_ID, XmlWriter writer)
        {
            writer.WriteStartElement("Values");
            writer.WriteStartElement("cus_ID");
            writer.WriteString(cus_ID);
            writer.WriteEndElement();

            writer.WriteEndElement();
        }

        public string GetItemFromGrid()
        {
            using (var sw = new StringWriter())
            {
                using (var writer = XmlWriter.Create(sw))
                {
                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("r");
                    int c = 0;

                    var ColelctionMarkets = grvproduct.SelectedItems;

                    if (ColelctionMarkets.Count > 0)
                    {
                        foreach (GridDataItem dr in ColelctionMarkets)
                        {
                            Telerik.Web.UI.RadNumericTextBox txttotqty = (Telerik.Web.UI.RadNumericTextBox)dr.FindControl("txttotalQty");
                            

                            string prd_ID = dr.GetDataKeyValue("prd_ID").ToString();
                            string totalqty = txttotqty.Text.ToString();  // Assuming Rot() returns a string, split it into individual IDs
                            

                                        createNode(prd_ID, totalqty, writer);
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
                        return sw.ToString();
                    }
                }
            }
        }

        private void createNode(string prd_ID, string totalqty, XmlWriter writer)
        {
            writer.WriteStartElement("Values");

            writer.WriteStartElement("prd_ID");
            writer.WriteString(prd_ID);
            writer.WriteEndElement();

            writer.WriteStartElement("totalqty");
            writer.WriteString(totalqty);
            writer.WriteEndElement();

           

            writer.WriteEndElement();
        }

        public void SaveData()
        {

            string rotid, id,user;

            rotid = ddlids.SelectedValue.ToString();
            string dates = DateTime.Parse(rdFromData.SelectedDate.ToString()).ToString("yyyy-MM-dd");
            string date = DateTime.Parse(rdEndDate.SelectedDate.ToString()).ToString("yyyy-MM-dd");
            user = UICommon.GetCurrentUserID().ToString();
            string customers = GetItemFromGrid2();
            string products = GetItemFromGrid();

            //string[] arrr = {  };
            //DataTable lstUserr = default(DataTable);
            //lstUserr = ObjclsFrms.loadList("selectCustomerAndRotID", "sp_Masters_UOM", rotid, arrr);
            //id = lstUserr.Rows[0]["rcs_ID"].ToString();

           

            if (ResponseID.Equals("0") || ResponseID == 0)
            {
                string[] arr = { customers, products, dates, date, user,  };
                string Value = ObjclsFrms.SaveData("sp_Masters_UOM", "InsertFOC", rotid, arr);

                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer FOC saved successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure('Something went wrong');</script>", false);
                }
            }
            else
            {
                string ID = ResponseID.ToString();
                string[] arr = {  dates, date, user, ResponseID.ToString() };
                string value = ObjclsFrms.SaveData("sp_Masters_UOM", "UpdateFOC", dates,  arr);
                int res = Int32.Parse(value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer FOC updated successFully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }


            }

        }
        public void Route()
        {
            DataTable dt = ObjclsFrms.loadList("SelectFromDropRouteID", "sp_Masters_UOM");
            ddlids.DataSource = dt;
            ddlids.DataTextField = "rot_Name";
            ddlids.DataValueField = "rot_ID";
            ddlids.DataBind();
        }
        public void Customer(string route)
        {
            DataTable dts = ObjclsFrms.loadList("DropDownCustomerForRoute", "sp_Masters_UOM", route.ToString());
            if (dts.Rows.Count >= 0)
            {
                grvcustomer.DataSource = dts;
            }
           
            
        }

        public void Product(string rot)
        {
            string[] arr = { };
            DataTable dtt = ObjclsFrms.loadList("SelFromDropProductID", "sp_Masters_UOM", rot.ToString());
            if(dtt.Rows.Count>=0)
            {
                grvproduct.DataSource = dtt;

            }
        }



        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            

            
            if (grvcustomer.SelectedItems.Count>0 && grvproduct.SelectedItems.Count>0)
            {

                bool saveDataConditionsMet = false;

                foreach (GridDataItem row in grvproduct.SelectedItems)
                {
                    Telerik.Web.UI.RadNumericTextBox txttotalQty = (Telerik.Web.UI.RadNumericTextBox)row.FindControl("txttotalQty");


                    string totalqty = txttotalQty.Text.Trim();



                    if (string.IsNullOrEmpty(totalqty))
                    {

                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure('Total quantity Missing for some products');</script>", false);
                        continue;
                    }




                    saveDataConditionsMet = true;
                    continue;
                }
                if (saveDataConditionsMet)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);

                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure('Please make selection');</script>", false);

            }

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/BO_Digits/en/ListCustomerFOC.aspx");

        }

        protected void ddlids_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string rot = ddlids.SelectedValue.ToString();
            Customer(rot);
            Product(rot);
            grvcustomer.Rebind();
            grvproduct.Rebind();
        }

        protected void ddlCus_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            string rot = ddlids.SelectedValue.ToString();
           
          
        }

        protected void ddlp_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {

        }

       

        protected void save_Click(object sender, EventArgs e)
        {
            SaveData();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("/BO_Digits/en/ListCustomerFOC.aspx");

        }

        protected void lnkAddCus_Click(object sender, EventArgs e)
        {

        }

        protected void lnkaddProduct_Click(object sender, EventArgs e)
        {

        }



        protected void grvproduct_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string rot = ddlids.SelectedValue.ToString();

            Product(rot);
        }
        protected void grvcustomer_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string rot = ddlids.SelectedValue.ToString();
            Customer(rot);
        }
    }
}