﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class AddEditCusHeader : System.Web.UI.Page
    {
        GeneralFunctions obj = new GeneralFunctions();
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
                string Id = ResponseID.ToString();
                if (Id.Equals("") || Id == "0")                                //To check whether there is a value for ResponseID or not. For adding there won't be a value.
                {

                }
                else                                                                        //If we are editing there will be a value and the following code will be executed.
                {
                    DataTable lstDatas = obj.loadList("EditCusHeader", "sp_Masters", ResponseID.ToString());
                    if (lstDatas.Rows.Count > 0)
                    {
                        string Cshname, Cshcode, status,TRN,cshArabicName;                                          //Declare the variables
                        Cshname = lstDatas.Rows[0]["csh_Name"].ToString();                         //Set the value to the variables
                        Cshcode = lstDatas.Rows[0]["csh_Code"].ToString();
                        status = lstDatas.Rows[0]["Status"].ToString();
                        TRN = lstDatas.Rows[0]["csh_TRN"].ToString();
                        cshArabicName = lstDatas.Rows[0]["csh_NameArabic"].ToString();

                        txtName.Text = Cshname.ToString();                                     //Here the binding is done. "txtName" is the ID of the textBox in ASPX
                        txtCode.Text = Cshcode.ToString();
                        ddlStatus.SelectedValue = status.ToString();
                        txtCode.Enabled = false;
                        txtArabicName.Text = cshArabicName.ToString();
                        txtTRN.Text = TRN.ToString();
                    }
                    else                                                              //If there is no value you can leave it as it is.
                    {

                    }
                }
            }
        }
        public void Save()
        {
            string Cshname, Cshcode, User, status, TRN, cshArabicName;
            Cshname = this.txtName.Text.ToString();
            Cshcode = this.txtCode.Text.ToString();
            User = UICommon.GetCurrentUserID().ToString();
            status = this.ddlStatus.SelectedValue.ToString();
            TRN = txtTRN.Text.ToString();
            cshArabicName = txtArabicName.Text.ToString();



            if (ResponseID.Equals("") || ResponseID == 0)
            {
                
                string[] arr = { Cshcode, User, status, TRN, cshArabicName };
                string value = obj.SaveData("sp_Masters", "InsertCusHeader", Cshname, arr);
                int res = Int32.Parse(value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess();</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
            else
            {
                string ID = ResponseID.ToString();
                string[] arr = { Cshcode, User, status, ID,TRN,cshArabicName };
                string value = obj.SaveData("sp_Masters", "UpdateCusHeader", Cshname, arr);
                int res = Int32.Parse(value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess();</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
        }
        protected void LinkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }

        protected void LinkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListCustomerHeader.aspx");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListCustomerHeader.aspx");
        }
    }
}