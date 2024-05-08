<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ListExcelUploadHeader.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.ListExcelUploadHeader" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
     


                     
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body p-8" style="background-color:white;"> 

    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
        <div class =" col-lg-12 row " style="padding-bottom : 10px;">
                                     
        
             <div class="col-lg-2">
                                    <label class="control-label col-lg-12">Procedure</label>
                                    <div class="col-lg-12">
                                        <telerik:RadDropDownList ID="ddlproc" runat="server" Width="100%" Filter="Contains" DefaultMessage="Select Procedure" EmptyMessage="Select flag" RenderMode="Lightweight">
                                            <items>
                                             <telerik:DropDownListItem Text="Special Price - Add Items" Value="[dbo].[sp_InsBulkSpecialPrice]-Insert"  />
                                                    <telerik:DropDownListItem Text="Item Mapping Group" Value="[dbo].[sp_InsItemMappingGroup]" />
                                                    <telerik:DropDownListItem Text="Special Price - Assign Customers" Value="[dbo].[sp_SplPriceAssign]" />
                                                    <telerik:dropDownListItem Text="Daily Loads" Value="[dbo].[sp_InsBulkDailyLoads]" />
                                                    <telerik:DropDownListItem Text="Customer Re-Assign" Value="[dbo].[sp_CusReAssign]"  />
                                                    <telerik:DropDownListItem Text="Customer Master" Value="[dbo].[sp_InsNewCus]" />
                                                    <telerik:DropDownListItem Text="Customer Route Mapping" Value="[dbo].[sp_InsRouteCus]"  />
                                                    <telerik:DropDownListItem Text="Target Package" Value="[dbo].[sp_InsTargetPackage]"  />
                                                    <telerik:DropDownListItem Text="Route Target Package" Value="[dbo].[sp_InsRouteTargetPackage]"  />
                                                    <telerik:DropDownListItem Text="Customer Item Mapping" Value="[dbo].[sp_InsCustomerItemMapping]"  />



                                           
                                        </items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>

                           
                        <div class="col-lg-2">
                                    <label class="control-label col-lg-12"> Date</label>
                                    <div class="col-lg-12">
                                        <telerik:RadDatePicker ID="rddate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%" RenderMode="Lightweight"></telerik:RadDatePicker>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rddate"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

              <div class="col-lg-2" style="text-align: center; top: 19px;padding-top:15px;">
                                    <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-sm btn-primary me-2" BackColor="#DAE9F8"  ForeColor="#009EF7" CausesValidation="true" OnClick="lnkFilter_Click">
                                                    Apply Filter
                                    </asp:LinkButton>
                                </div>
             
            </div>
                       <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                        <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                            ID="grvRpt" GridLines="None"
                            ShowFooter="True" AllowSorting="True"
                            OnNeedDataSource="grvRpt_NeedDataSource"
                            OnItemCommand="grvRpt_ItemCommand"
                            AllowFilteringByColumn="true"
                            ClientSettings-Resizing-ClipCellContentOnResize="true"
                            EnableAjaxSkinRendering="true"
                            AllowPaging="true" PageSize="10" CellSpacing="0">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500"></Scrolling>
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                ShowFooter="false" DataKeyNames="eul_ID"
                                EnableHeaderContextMenu="true">
                                <Columns>


                                    

                                     <telerik:GridTemplateColumn HeaderStyle-Width="50px" AllowFiltering="false" HeaderText="Detail" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="Detail">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Detail" ID="Detail" Visible="true" AlternateText="Detail" runat="server"
                                                    ImageUrl="../assets/media/icons/details.png"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                 
                                    <telerik:GridBoundColumn DataField="eul_Procedure" AllowFiltering="true" HeaderStyle-Width="80px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Procedure" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="eul_Procedure">
                                    </telerik:GridBoundColumn>
                                   
                                    
                                    
                                    <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="80px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Created Date" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                                    </telerik:GridBoundColumn>

                                   
                                </Columns>
                            </MasterTableView>
                            <PagerStyle AlwaysVisible="true" />
                            <GroupingSettings CaseSensitive="false" />
                            <ClientSettings  EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                <Resizing AllowColumnResize="true"></Resizing>
                                <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                            </ClientSettings>
                        </telerik:RadGrid>
         </telerik:RadAjaxPanel>

                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel>

        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
