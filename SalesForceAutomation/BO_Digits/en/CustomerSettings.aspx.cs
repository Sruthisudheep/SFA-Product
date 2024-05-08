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
    public partial class CustomerSettings : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Customer();
                SettingsName();
            }
        }
        public void Customer()
        {
            DataTable dts = ObjclsFrms.loadList("SelCustomer", "sp_SettingsMaster");
            ddlCus.DataSource = dts;
            ddlCus.DataTextField = "cus_Name";
            ddlCus.DataValueField = "cus_ID";
            ddlCus.DataBind();
        }
        public void SettingsName()
        {
            string page = "CustomerSettings.aspx";
            DataTable dts = ObjclsFrms.loadList("SelectSettingsName", "sp_SettingsMaster", page);
            dllSettings.DataSource = dts;
            dllSettings.DataTextField = "set_SettingsName";
            dllSettings.DataValueField = "set_ID";
            dllSettings.DataBind();
        }
        public void SettingsAnswer(string Answers)
        {

            DataTable dts = ObjclsFrms.loadList("SelectSettingsText", "sp_SettingsMaster", ViewState["ID"].ToString());
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
            var CollectionMarket = ddlCus.CheckedItems;
            string CusID = "";
            int j = 0;
            int MarCount = CollectionMarket.Count;
            if (CollectionMarket.Count > 0)
            {
                foreach (var item in CollectionMarket)
                {
                    if (j == 0)
                    {
                        CusID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        CusID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        CusID += item.Value;
                    }
                    j++;
                }
                return CusID;
            }
            else
            {
                return "0";
            }
        }
        public void Save()
        {

            string Cust, Settings, SettingsText, user;

            Cust = Cus();
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
            string mainCondition = " '" + SettingsText + "' , ModifiedBy = '" + user + "' , ModifiedDate = getdate() ";
            string CusCondition = " cus_ID in (" + Cust + ")";
            string[] arr = { Settings, mainCondition };
            string Value = ObjclsFrms.SaveData("sp_SettingsMaster", "UpdateSettings", CusCondition, arr);
            int res = Int32.Parse(Value.ToString());
            if (res > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer Settings Saved Successfully');</script>", false);
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
            Response.Redirect("ListCustomer.aspx");
        }

        protected void dllSettings_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            RadComboBox comboBox = (RadComboBox)sender;
            string ID = comboBox.SelectedValue;
            ViewState["ID"] = ID.ToString();
            DataTable dts = ObjclsFrms.loadList("SelectSettingsAnswerType", "sp_SettingsMaster", ID.ToString());
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
            Response.Redirect("ListCustomer.aspx");
        }
    }
}