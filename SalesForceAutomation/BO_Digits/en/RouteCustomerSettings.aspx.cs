using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class RouteCustomerSettings : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["RID"], out ResponseID);

                return ResponseID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Route();
                Customer();
                SettingsName();
            }
        }
        public void Customer()
        {
            DataTable dts = ObjclsFrms.loadList("SelRotCustomerdropdown", "sp_Masters",ResponseID.ToString());
            ddlCustomer.DataSource = dts;
            ddlCustomer.DataTextField = "cus_Name";
            ddlCustomer.DataValueField = "cus_ID";
            ddlCustomer.DataBind();
        }
        public void SettingsName()
        {
            string page = "RouteCustomerSettings.aspx";
            DataTable dts = ObjclsFrms.loadList("SelRotSettingsName", "sp_Masters", page);
            dllSettings.DataSource = dts;
            dllSettings.DataTextField = "set_SettingsName";
            dllSettings.DataValueField = "set_ID";
            dllSettings.DataBind();
        }
        public void Route()
        {
            DataTable dt =ObjclsFrms.loadList("SelectRouteName", "sp_Masters", ResponseID.ToString());
            if (dt.Rows.Count > 0)
            {

                string rotname = dt.Rows[0]["rot_Name"].ToString();
               // route.Text = "Route : " + rotname;


            }

        }
        public void SettingsAnswer(string Answers)
        {
            string ID = ViewState["ID"].ToString();
            DataTable dts = ObjclsFrms.loadList("SelRotSettingsText", "sp_Masters", ID);
            if (Answers == "S")
            {
                dllSettingsText.DataSource = dts;
                dllSettingsText.DataTextField = "SettingsText";
                dllSettingsText.DataValueField = "SettingsValue";
                dllSettingsText.DataBind();
            }
            else
            {
                dllmultisettings.DataSource = dts;
                dllmultisettings.DataTextField = "SettingsText";
                dllmultisettings.DataValueField = "SettingsValue";
                dllmultisettings.DataBind();
            }

        }
        public string MultipleSettings()
        {
            string retStr = "";
            var checkedItems = dllmultisettings.CheckedItems;
            foreach (var item in checkedItems)
            {
                retStr += item.Value.ToString() + "-";
            }
            retStr = retStr.Substring(0, retStr.Length - 1);
            return retStr;
        }

        public string Cus()
        {
            var CollectionMarket = ddlCustomer.CheckedItems;
            string cusID = "";
            int j = 0;
            int MarCount = CollectionMarket.Count;
            if (CollectionMarket.Count > 0)
            {
                foreach (var item in CollectionMarket)
                {
                    if (j == 0)
                    {
                        cusID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        cusID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        cusID += item.Value;
                    }
                    j++;
                }
                return cusID;
            }
            else
            {
                return "0";
            }
        }
        public void Save()
        {

            string Customer, Settings, SettingsText, user;

            Customer = Cus();
            Settings = dllSettings.SelectedValue.ToString();
            user = UICommon.GetCurrentUserID().ToString();

            if (ViewState["Answer"].ToString() == "S")
            {
                SettingsText = dllSettingsText.SelectedValue.ToString();
            }
            else
            {
                SettingsText = MultipleSettings();
            }
            string mainCondition = " '" + SettingsText + "' ";
            string CusCondition = " rcs_cus_ID in (" + Customer + ") and rcs_rot_ID=" + ResponseID.ToString();
            string[] arr = { Settings, mainCondition };
            string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateRouteSettings", CusCondition, arr);
            int res = Int32.Parse(Value.ToString());
            if (res > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Route Customer Settings Saved Successfully');</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
            }

        }
        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListCustomerRoute.aspx?RID=" + ResponseID.ToString());
        }

        protected void dllSettings_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            RadComboBox comboBox = (RadComboBox)sender;
            string ID = comboBox.SelectedValue;
            ViewState["ID"] = ID.ToString();
            DataTable dts = ObjclsFrms.loadList("SelRotSettingsAnswerType", "sp_Masters", ID.ToString());
            string Answer = dts.Rows[0]["set_AnswerType"].ToString();
            ViewState["Answer"] = Answer.ToString();
            if (Answer == "S")
            {
                Single.Visible = true;
                Multiple.Visible = false;
            }
            else
            {
                Multiple.Visible = true;
                Single.Visible = false;

            }

            SettingsAnswer(Answer);
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListCustomerRoute.aspx?RID=" + ResponseID.ToString());
        }
    }
}