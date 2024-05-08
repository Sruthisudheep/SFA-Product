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
    public partial class RouteSettingsMaster : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Route();
                SettingsName();
            }
        }
     
        public void Route()
        {
            DataTable dts = ObjclsFrms.loadList("SelRoute", "sp_Masters");
            ddlRoute.DataSource = dts;
            ddlRoute.DataTextField = "rot_Name";
            ddlRoute.DataValueField = "rot_ID";
            ddlRoute.DataBind();
        }
        public void SettingsName()
        {
            string page = "RouteSettingsMaster.aspx";
            DataTable dts = ObjclsFrms.loadList("SelRotSettingsName", "sp_Masters",page);
            dllSettings.DataSource = dts;
            dllSettings.DataTextField = "set_SettingsName";
            dllSettings.DataValueField = "set_ID";
            dllSettings.DataBind();
        }
        public void SettingsAnswer(string Answers)
        {

            DataTable dts = ObjclsFrms.loadList("SelRotSettingsText", "sp_Masters", ViewState["ID"].ToString());
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
                return "0";
            }
        }
        public void Save()
        {

            string route, Settings, SettingsText, user;

            route = Rot();
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
            string mainCondition = " '" + SettingsText + "' ,ModifiedBy = '" + user + "' , ModifiedDate = getdate() ";
            string rotCondition = " rot_ID in (" + route + ")";
            string[] arr = { Settings, mainCondition };
            string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateRouteSettings", rotCondition, arr);
            int res = Int32.Parse(Value.ToString());
            if (res > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Route Settings Saved Successfully');</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
            }

        }
        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListRoute.aspx");
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListRoute.aspx");
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
    }
}