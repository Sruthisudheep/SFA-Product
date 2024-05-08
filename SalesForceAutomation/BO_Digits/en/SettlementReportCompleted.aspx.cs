using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Web.UI.Skins;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class SettlementReportCompleted : System.Web.UI.Page
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
                TotalVariance();
                try
				{
					Session["SRCFdate"] = DateTime.Parse(Session["fDate"].ToString());
					Session["SRCTdate"] = DateTime.Parse(Session["TDate"].ToString());

					Label1.Text = Session["DefaultCurrency"].ToString();
					Label2.Text = Session["DefaultCurrency"].ToString();
					Label3.Text = Session["DefaultCurrency"].ToString();
					Label4.Text = Session["DefaultCurrency"].ToString();
					Label5.Text = Session["DefaultCurrency"].ToString();
					Label6.Text = Session["DefaultCurrency"].ToString();
					Label7.Text = Session["DefaultCurrency"].ToString();
				}
				catch (Exception ex)
				{
					Response.Redirect("~/SignIn.aspx");
				}
				
                RadWizard1.NavigationBarPosition = (RadWizardNavigationBarPosition)Enum.Parse(typeof(RadWizardNavigationBarPosition), "Left");
                RadWizard1.ProgressBarPosition = (RadWizardProgressBarPosition)Enum.Parse(typeof(RadWizardProgressBarPosition), "Left");
                RadWizard1.ActiveStepIndex = 6;
                Route();
                HeaderData();
                //LoadOutStatus();
                AppComplitionStatus();
                TotalCountAndAmount();
                RoutePettycash();
                rdfromDate.SelectedDate = DateTime.Parse(Session["fDate"].ToString());
                rdendDate.SelectedDate = DateTime.Parse(Session["TDate"].ToString());
            }
        }
        public void HeaderData()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelUsrDlyPrcsHeaderByID", "sp_Merchandising", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblUser = (Label)rp.FindControl("lblUser");
                //Label lblRoute = (Label)rp.FindControl("lblRoute");
                // Label lblCreatedDate = (Label)rp.FindControl("lblCreatedDate");
                Label lblStartTime = (Label)rp.FindControl("lblStartTime");
                Label lblEndTime = (Label)rp.FindControl("lblEndTime");
                Label lblVersion = (Label)rp.FindControl("lblVersion");
                Label lblProcess = (Label)rp.FindControl("lblProcess");

                //rp.Text = "Order ID: " + lstDatas.Rows[0]["OrderID"].ToString();
                lblUser.Text = lstDatas.Rows[0]["userName"].ToString();
                lblDuration.Text = lstDatas.Rows[0]["Duration"].ToString();
                //lblCreatedDate.Text = lstDatas.Rows[0]["CreatedDate"].ToString();
                lblStartTime.Text = lstDatas.Rows[0]["StartTime"].ToString();
                lblEndTime.Text = lstDatas.Rows[0]["EndTime"].ToString();
                lblVersion.Text = lstDatas.Rows[0]["udp_VersionNumber"].ToString();
                //lblrotname.Text = lstDatas.Rows[0]["routeName"].ToString();               
                lblProcess.Text = lstDatas.Rows[0]["Process"].ToString();

            }
        }
        public void Route()
        {
            DataTable dtRoute = ObjclsFrms.loadList("SelectRoute", "sp_Settlement", ResponseID.ToString());
            string route = dtRoute.Rows[0]["rot_Name"].ToString();
            lblRoute.Text = route.ToString();
        }
        //public void LoadOutStatus()
        //{
        //    DataTable lstVarianceAllowed = ObjclsFrms.loadList("SelectLoadOutStatusToDisplay", "sp_Settlement", ResponseID.ToString());
        //    string Lostatus = lstVarianceAllowed.Rows[0]["udp_LoadOutStatus"].ToString();
        //    lblLoadOutStatus.Text = Lostatus.ToString();
        //}

        protected void RadWizard1_FinishButtonClick(object sender, Telerik.Web.UI.WizardEventArgs e)
        {
            Response.Redirect("UserDailyProcess.aspx");
        }

        protected void grvOrders_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadOrdersReport();
        }

        protected void grvCredit_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadCreditInvoice();
        }

        protected void grvCash_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadCashInvoice();
        }

        protected void grvAR_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadARCollection();
        }

        protected void grvAdvance_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadAdvanceCollection();
        }

        protected void grvPayment_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadPayment();
        }
        public void TotalCountAndAmount()
        {
            //string[] arr = { ddlRoute.SelectedValue.ToString() };
            lblOrderCount.Text = "";
            lblOrderAmount.Text = "";
            lblCreditCount.Text = "";
            lblCreditAmount.Text = "";
            lblCashCount.Text = "";
            lblCashAmount.Text = "";
            lblARCount.Text = "";
            lblARAmount.Text = "";
            lblAdvanceCount.Text = "";
            lblAdvanceAmount.Text = "";
            lblPCash.Text = "";
            lblPArCollectionCash.Text = "";
            lblPAdvanceCash.Text = "";
            lblPCashInvoices.Text = "";
            lblHardCash.Text = "";
            lblHardCashVariance.Text = "";
            lblPOS.Text = "";
            lblPOSVariance.Text = "";
            lblOnlinePayment.Text = "";
            lblOnlinePaymentVariance.Text = "";
            lblARCollCheque.Text = "";
            lblAdvCollCheque.Text = "";
            //lblTotalDebitNoteCount.Text = "";
            //lblTotalDebitNoteAmount.Text = "";
            DataTable lstOrderCount = ObjclsFrms.loadList("SelectOrdersCount", "sp_Settlement", ResponseID.ToString());
            DataTable lstCreditCount = ObjclsFrms.loadList("SelectCreditCount", "sp_Settlement", ResponseID.ToString());
            DataTable lstCashCount = ObjclsFrms.loadList("SelectCashCount", "sp_Settlement", ResponseID.ToString());
            DataTable lstARCount = ObjclsFrms.loadList("SelectARCount", "sp_Settlement", ResponseID.ToString());
            DataTable lstAdvanceCount = ObjclsFrms.loadList("SelectAdvanceCount", "sp_Settlement", ResponseID.ToString());
            DataTable lstPaymentCount = ObjclsFrms.loadList("SelTotalCash", "sp_Settlement", ResponseID.ToString());
            DataTable lstCashReceived = ObjclsFrms.loadList("SelectUserSettlementPayModes", "sp_Settlement", ResponseID.ToString());
            DataTable lstChequeAmount = ObjclsFrms.loadList("SelectArAdvCheqAmount", "sp_Settlement", ResponseID.ToString());
            //DataTable lstDebitNote = ObjclsFrms.loadList("SelectSalesManDebitNoteCount", "sp_Settlement", ResponseID.ToString());
            DataTable lstPendingBalance = ObjclsFrms.loadList("SelectDiscrepencyAmount", "sp_Settlement", ResponseID.ToString());

            DataTable pettycash = ObjclsFrms.loadList("Selecttotalpettycash", "sp_Settlement", ResponseID.ToString());


            if (pettycash != null && pettycash.Rows.Count > 0)
            {
                // Assuming the column name is "TotalAmount"
                string totalAmount = pettycash.Rows[0]["TotalAmount"].ToString();

               // lblpettycash.Text = totalAmount;
                lblpettycash1.Text = totalAmount;

                // Find the control for the Label element
                Label lblPettyCashValue = (Label)FindControl("yourLabelID");

                // Check if the Label control is found
                if (lblPettyCashValue != null)
                {
                    // Assign the total amount value to the Text property of the Label
                    lblPettyCashValue.Text = totalAmount;
                }
                else
                {
                    // Handle the case where the Label control is not found
                    // For example, log an error or display a message
                }
            }
            else
            {
                // Handle the case where no data is retrieved from the database
                // For example, set a default value for the Label or display a message
            }
            if (lstOrderCount.Rows.Count > 0)
            {
                string orderCount, orderAmount;
                orderCount = lstOrderCount.Rows[0]["totalCount"].ToString();
                orderAmount = lstOrderCount.Rows[0]["totalAmount"].ToString();
                lblOrderCount.Text = orderCount;
                lblOrderAmount.Text = orderAmount;
            }
            if (lstCreditCount.Rows.Count > 0)
            {
                string creditCount, creditAmount;
                creditCount = lstCreditCount.Rows[0]["totalCount"].ToString();
                creditAmount = lstCreditCount.Rows[0]["totalAmount"].ToString();
                lblCreditCount.Text = creditCount;
                lblCreditAmount.Text = creditAmount;
            }
            if (lstCashCount.Rows.Count > 0)
            {
                string cashCount, cashAmount;
                cashCount = lstCashCount.Rows[0]["totalCount"].ToString();
                cashAmount = lstCashCount.Rows[0]["totalAmount"].ToString();
                lblCashCount.Text = cashCount;
                lblCashAmount.Text = cashAmount;
            }
            if (lstARCount.Rows.Count > 0)
            {
                string arCount, arAmount;
                arCount = lstARCount.Rows[0]["totalCount"].ToString();
                arAmount = lstARCount.Rows[0]["totalAmount"].ToString();
                lblARCount.Text = arCount;
                lblARAmount.Text = arAmount;
            }
            if (lstAdvanceCount.Rows.Count > 0)
            {
                string advanceCount, advanceAmount;
                advanceCount = lstAdvanceCount.Rows[0]["totalCount"].ToString();
                advanceAmount = lstAdvanceCount.Rows[0]["totalAmount"].ToString();
                lblAdvanceCount.Text = advanceCount;
                lblAdvanceAmount.Text = advanceAmount;
            }
            if (lstPaymentCount.Rows.Count > 0)
            {
                string pCash, pARColl, pAdv, pCashInv, debitNote;

                pCash = lstPaymentCount.Rows[0]["csTotal"].ToString();
                pARColl = lstPaymentCount.Rows[0]["csAr"].ToString();
                pAdv = lstPaymentCount.Rows[0]["csAdp"].ToString();
                pCashInv = lstPaymentCount.Rows[0]["csInv"].ToString();
                debitNote = lstPaymentCount.Rows[0]["debitNote"].ToString();
                //Int32.Parse

                

                lblPCash.Text = pCash;
                lblPArCollectionCash.Text = pARColl;
                lblPAdvanceCash.Text = pAdv;
                lblPCashInvoices.Text = pCashInv;
                lblDebitNote.Text = debitNote;
            }
            if (lstPendingBalance.Rows.Count > 0)
            {
                string pendingBal;
                pendingBal = lstPendingBalance.Rows[0]["PendingBalance"].ToString();
                lblPendingBalance.Text = pendingBal;
            }
            if (lstCashReceived.Rows.Count > 0)
            {
                string mode, hcExpected, hcCollected, hcVariance, posExpected, posCollected, posVariance, opExpected, opVariance, opCollected;
                for (int i = 0; i < lstCashReceived.Rows.Count; i++)
                {
                    mode = lstCashReceived.Rows[i]["Mode"].ToString();
                    if (mode.Equals("HC"))
                    {
                        hcExpected = lstCashReceived.Rows[i]["usp_ExpectedAmount"].ToString();
                        hcCollected = lstCashReceived.Rows[i]["usp_CollectedAmount"].ToString();
                        hcVariance = lstCashReceived.Rows[i]["usp_Variance"].ToString();
                        lblHardCash.Text = hcExpected.ToString();
                        lblHardCashVariance.Text = hcVariance.ToString();
                        txtHardCash.Text = hcCollected.ToString();
                    }
                    else if (mode.Equals("POS"))
                    {
                        posExpected = lstCashReceived.Rows[i]["usp_ExpectedAmount"].ToString();
                        posCollected = lstCashReceived.Rows[i]["usp_CollectedAmount"].ToString();
                        posVariance = lstCashReceived.Rows[i]["usp_Variance"].ToString();
                        lblPOS.Text = posExpected.ToString();
                        lblPOSVariance.Text = posVariance.ToString();
                        txtPos.Text = posCollected.ToString();
                    }
                    else if (mode.Equals("OP"))
                    {
                        opExpected = lstCashReceived.Rows[i]["usp_ExpectedAmount"].ToString();
                        opCollected = lstCashReceived.Rows[i]["usp_CollectedAmount"].ToString();
                        opVariance = lstCashReceived.Rows[i]["usp_Variance"].ToString();
                        lblOnlinePayment.Text = opExpected.ToString();
                        lblOnlinePaymentVariance.Text = opVariance.ToString();
                        txtOnlinePayment.Text = opCollected.ToString();
                    }
                }
            }
            if (lstChequeAmount.Rows.Count > 0)
            {
                string mode, amount;
                for (int i = 0; i < lstChequeAmount.Rows.Count; i++)
                {
                    mode = lstChequeAmount.Rows[i]["mode"].ToString();
                    amount = lstChequeAmount.Rows[i]["amount"].ToString();
                    if (mode.Equals("AR"))
                    {
                        lblARCollCheque.Text = amount.ToString(); ;
                    }
                    else if (mode.Equals("Adv"))
                    {
                        lblAdvCollCheque.Text = amount.ToString();
                    }
                }
            }
            //if (lstDebitNote.Rows.Count > 0)
            //{
            //    string debitNoteCount, debitNoteAmount;
            //    debitNoteCount = lstDebitNote.Rows[0]["totalCount"].ToString();
            //    debitNoteAmount = lstDebitNote.Rows[0]["totalAmount"].ToString();
            //    lblTotalDebitNoteCount.Text = debitNoteCount;
            //    lblTotalDebitNoteAmount.Text = debitNoteAmount;
            //}
        }

        public void LoadOrdersReport()
        {
            //string[] arr = { ddlRoute.SelectedValue.ToString() };
            DataTable lstOrder = ObjclsFrms.loadList("SelectOrdersReport", "sp_Settlement", ResponseID.ToString());
            grvOrders.DataSource = lstOrder;
        }

        public void LoadCreditInvoice()
        {
            //string[] arr = { ddlRoute.SelectedValue.ToString() };
            DataTable lstCredit = ObjclsFrms.loadList("SelectCreditInvoice", "sp_Settlement", ResponseID.ToString());
            grvCredit.DataSource = lstCredit;
        }

        public void LoadCashInvoice()
        {
            //string[] arr = { ddlRoute.SelectedValue.ToString() };
            DataTable lstCash = ObjclsFrms.loadList("SelectCashInvoice", "sp_Settlement", ResponseID.ToString());
            grvCash.DataSource = lstCash;
        }

        public void LoadARCollection()
        {
            //string[] arr = { ddlRoute.SelectedValue.ToString() };
            DataTable lstARCol = ObjclsFrms.loadList("SelectARCollection", "sp_Settlement", ResponseID.ToString());
            grvAR.DataSource = lstARCol;
        }

        public void LoadAdvanceCollection()
        {
            //string[] arr = { ddlRoute.SelectedValue.ToString() };
            DataTable lstAdvance = ObjclsFrms.loadList("SelectAdvanceCollection", "sp_Settlement", ResponseID.ToString());
            grvAdvance.DataSource = lstAdvance;
        }

        public void LoadPayment()
        {
            //string[] arr = { ddlRoute.SelectedValue.ToString() };
            DataTable lstPayment = ObjclsFrms.loadList("SelectPayment", "sp_Settlement", ResponseID.ToString());
            grvPayment.DataSource = lstPayment;
        }

        //protected void grvDebitNote_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        //{
        //    LoadDebitNote();
        //}

        //public void LoadDebitNote()
        //{
        //    //string[] arr = { ddlRoute.SelectedValue.ToString() };
        //    DataTable lstDebitNote = ObjclsFrms.loadList("SelectSalesManDebitNote", "sp_Settlement", ResponseID.ToString());
        //    grvDebitNote.DataSource = lstDebitNote;
        //}

        public void AppComplitionStatus()
        {
            DataTable lstCompletionStatus = ObjclsFrms.loadList("SelectAppCompleteionStatus", "sp_Settlement", ResponseID.ToString());
            string AppStatus = lstCompletionStatus.Rows[0]["udp_IsAppProcessComplete"].ToString();
            string processID = lstCompletionStatus.Rows[0]["ProcessID"].ToString();
            string date = lstCompletionStatus.Rows[0]["Dat"].ToString();
            ViewState["AppStatus"] = AppStatus.ToString();
            //lblLoadOutStatus.Text = AppStatus.ToString();
            lblProcessID.Text = processID.ToString();
            lblDate.Text = date.ToString();
        }
        protected void TotalVariance()
        {
            double hardVariance, posVariance, onlineVariance;

            if (double.TryParse(lblHardCashVariance.Text, out hardVariance) &&
                double.TryParse(lblPOSVariance.Text, out posVariance) &&
                double.TryParse(lblOnlinePaymentVariance.Text, out onlineVariance))
            {
                double totalVariance = hardVariance + posVariance + onlineVariance;
                string sum = Math.Round(totalVariance, 3).ToString();
                lblTotalVariance.Text = sum;
            }
            else
            {
                lblTotalVariance.Text = "0.00";

            }


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>showPreviousVariances();</script>", false);

            PopulateTable();
        }
        public void PopulateTable()
        {

            string FDate = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string TDate = DateTime.Parse(rdendDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string[] arr = { FDate, TDate };
            DataTable lstVariance = ObjclsFrms.loadList("SelectVariances", "sp_Settlement", ResponseID.ToString(), arr);

            // Clear existing rows from the table
            //tbodyPreviousVariances.Rows.Clear();

            if (lstVariance.Rows.Count > 0)
            {
                RadGridSuccess.DataSource = lstVariance;

            }
        }

        protected void RadGridSuccess_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            PopulateTable();
        }

        protected void Filtr_Click(object sender, EventArgs e)
        {
            PopulateTable();
            RadGridSuccess.Rebind();
        }

        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            Initiation();
        }
        public void Initiation()
        {
            //string[] arr = { ddlRoute.SelectedValue.ToString() };
            DataTable lstAdvance = ObjclsFrms.loadList("SelectIniation", "sp_Settlement", ResponseID.ToString());
            RadGrid1.DataSource = lstAdvance;
        }

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = (GridDataItem)e.Item;
                string imah = dataItem["Image"].Text.Replace(" ", "");
                string[] values = imah.Split(',');
                imah = imah.Replace("&nbsp;", null);
                for (int i = 0; i < values.Length; i++)
                {
                    if (!values[i].Equals("&nbsp;") && !values[i].Equals(""))
                    {

                        Image img = new Image();
                        img.ID = "Image1" + i.ToString();
                        img.ImageUrl = "../" + values[i].ToString();
                        img.Height = 20;
                        img.Width = 20;
                        img.BorderStyle = System.Web.UI.WebControls.BorderStyle.Groove;
                        img.BorderWidth = 2;
                        img.BorderColor = System.Drawing.Color.Black;
                        HyperLink hl = new HyperLink();
                        if (img.ImageUrl == "../../UploadFiles/NoImage/imagenotavailable.png")
                        {
                            hl.NavigateUrl = "";
                        }
                        else
                        {
                            hl.NavigateUrl = "../" + values[i].ToString();
                        }

                        hl.ID = "hl" + i.ToString();
                        hl.Target = "_blank";
                        hl.Controls.Add(img);

                        dataItem["Images"].Controls.Add(hl);
                    }
                }




            }
        }
        public void RoutePettycash()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelectRoutePettycash", "sp_Settlement", ResponseID.ToString());
            if (lstDatas != null && lstDatas.Rows.Count > 0)
            {
                // Find the control for the <tr> element
                foreach (DataRow row in lstDatas.Rows)
                {
                    // Assuming the column name is "rot_EnablePettyCash", change it if it's different
                    string value = row["rot_EnablePettyCash"].ToString();

                    // Check if the value is equal to "Y"
                    if (value == "Y")
                    {
                        // Set the Label's visibility to true
                        ddlPettycash.Visible = true;
                    }
                    else
                    {
                        // Set the Label's visibility to false
                        ddlPettycash.Visible = false;
                    }
                }
            }
        }

        public void Populatepettycash()
        {


            DataTable cash = ObjclsFrms.loadList("SelectPettycash", "sp_Settlement", ResponseID.ToString());

            // Clear existing rows from the table
            //tbodyPreviousVariances.Rows.Clear();


            RadGrid2.DataSource = cash;


        }

        protected void btnpettycash_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>showpettycash();</script>", false);

            Populatepettycash();
        }

        protected void RadGrid2_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {

            Populatepettycash();
        }

        protected void grvPayment_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = (GridDataItem)e.Item;

                string imagC = dataItem["image"].Text.Replace(" ", "");
                string[] valuesC = imagC.Split(',');
                imagC = imagC.Replace("&nbsp;", null);
                for (int i = 0; i < valuesC.Length; i++)
                {
                    if (!valuesC[i].Equals("&nbsp;") && !valuesC[i].Equals(""))
                    {

                        Image img = new Image();
                        img.ID = "Image2" + i.ToString();
                        img.ImageUrl = "../" + valuesC[i].ToString();
                        img.Height = 20;
                        img.Width = 20;
                        img.BorderStyle = System.Web.UI.WebControls.BorderStyle.Groove;
                        img.BorderWidth = 2;
                        img.BorderColor = System.Drawing.Color.Black;
                        HyperLink hl = new HyperLink();
                        if (img.ImageUrl == "../../UploadFiles/NoImage/imagenotavailable.png")
                        {
                            hl.NavigateUrl = "";
                        }
                        else
                        {
                            hl.NavigateUrl = "../" + valuesC[i].ToString();
                        }

                        hl.ID = "hll" + i.ToString();
                        hl.Target = "_blank";
                        hl.Controls.Add(img);

                        dataItem["ImagesCheque"].Controls.Add(hl);
                    }
                }
            }
        }
    }
}