﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesForceAutomation.Admin
{
    public partial class RouteMap : System.Web.UI.Page
    {

        GeneralFunctions ObjclsFrms = new GeneralFunctions();

        public int ResponseID
        {
            get
            {
                int ResponseID = 231;
                //int.TryParse(Request.Params["id"], out ResponseID);

                return ResponseID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                DataTable lstTitle = ObjclsFrms.loadList("SelGeoCodes", "sp_Maps", ResponseID.ToString());
                string geoCodes = "", cusNames = "", DtFormat = "", type = "";
                int i = 0;
                foreach (DataRow dr in lstTitle.Rows)
                {
                    if (i < lstTitle.Rows.Count - 1)
                    {
                        geoCodes += dr[3].ToString() + "-";
                        cusNames += dr[4].ToString() + "{0}";
                        DtFormat += dr[5].ToString() + "{0}";
                        type += dr[0].ToString() + "{0}";
                    }
                    else
                    {
                        geoCodes += dr[3].ToString();
                        cusNames += dr[4].ToString();
                        DtFormat += dr[5].ToString();
                        type += dr[0].ToString();
                    }
                    i++;
                }
                string maps = "PlotMap('" + geoCodes + "' , '" + cusNames + "' , '" + DtFormat + "'  , '" + type + "');";
                string ssmaps = "PlotMap('asd');";


                //ClientScript.RegisterStartupScript(GetType(), "Open", maps, true);
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>PlotMap('" + geoCodes + "' , '" + cusNames + "' , '" + DtFormat + "'  , '" + type + "');</script>", false);
            }
        }
    }
}