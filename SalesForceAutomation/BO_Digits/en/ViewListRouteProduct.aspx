﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ViewListRouteProduct.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.ViewListRouteProduct" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
     
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
      <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet" style="background-color:white; padding:20px;">
                   
                    <div class="kt-portlet__head" style="padding-top: 8px; ">
                        <div class="kt-portlet__head-label" style="border-bottom-style:inset;">
                            <h3 class="kt-portlet__head-title">
                           
                            <telerik:RadLabel ID="Proroute" runat="server" CssClass="kt-portlet__head-title"></telerik:RadLabel>
                             </h3>
                          
                        </div>

                    </div>
          
                  

                    <%-- strat form --%>
                     <div class="col-lg-12 row">
                    <div class="col-lg-6">

                        <!--begin::Portlet-->
                        <div class="kt-portlet" style="background-color:white; padding:20px;">

                            <div class="kt-portlet__head" >
                                <div class="col-lg-12 row">
                                    <div class="col-lg-6">
                                <div class="kt-portlet__head-label">
                                    <h3 class="kt-portlet__head-title">Unassigned Products
                                    </h3>
                                </div>
                                    </div>
                                    
                                </div>
                            </div>

                            <!--begin::Form-->
                            <div class="kt-form kt-form--label-right">
                                <div class="kt-portlet__body">
                                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>

                                    <telerik:RadSkinManager ID="RadSkinManager2" runat="server" Skin="Material" />
                                     <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
                                    ID="RadGrid1" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="RadGrid1_NeedDataSource"
                                    AllowFilteringByColumn="true"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="10" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="prd_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                            <telerik:GridClientSelectColumn HeaderStyle-Width="40px" UniqueName="chkAll">
                                            </telerik:GridClientSelectColumn>

                                            <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Product" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Name">
                                            </telerik:GridBoundColumn>

                                            
                                            <telerik:GridBoundColumn DataField="cat_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Category" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cat_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="sct_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Sub Category" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="sct_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="brd_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Brand" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="brd_Name">
                                            </telerik:GridBoundColumn>

                                        </Columns>
                                    </MasterTableView>
                                    <PagerStyle AlwaysVisible="true" />
                                    <GroupingSettings CaseSensitive="false" />
                                    <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                        <Resizing AllowColumnResize="true"></Resizing>
                                        <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                    </ClientSettings>
                                </telerik:RadGrid>

                                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel7" EnableEmbeddedSkins="false"
                                        BackColor="Transparent"
                                        ForeColor="Blue">
                                        <div class="col-lg-12 text-center">
                                            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                                        </div>
                                    </telerik:RadAjaxLoadingPanel>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-6">
                        <!--begin::Portlet-->
                        <div class="kt-portlet" style="background-color:white; padding:20px;">
                           
                            <div class="kt-portlet__head" >
                                <div class="col-lg-12 row">
                                    <div class="col-lg-6">
                                <div class="kt-portlet__head-label">
                                    <h3 class="kt-portlet__head-title">Assigned Products
                                    </h3>
                                </div>
                                    </div>
                                   
                            </div>
                               
                            <!--begin::Form-->
                            <div class="kt-form kt-form--label-right">
                                <div class="kt-portlet__body">
                                    <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>

                                    
                                    <telerik:RadAjaxPanel ID="RadAjaxPanel8" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                        <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
                                    ID="grvRpt" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                    AllowFilteringByColumn="true"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="10" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="rop_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                            <telerik:GridClientSelectColumn HeaderStyle-Width="40px" UniqueName="chkAll">
                                            </telerik:GridClientSelectColumn>

                                            <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Product" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Name">
                                            </telerik:GridBoundColumn>

                                            
                                            <telerik:GridBoundColumn DataField="cat_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Category" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="cat_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="sct_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Sub Category" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="sct_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="brd_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Brand" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="brd_Name">
                                            </telerik:GridBoundColumn>

                                        </Columns>
                                    </MasterTableView>
                                    <PagerStyle AlwaysVisible="true" />
                                    <GroupingSettings CaseSensitive="false" />
                                    <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                        <Resizing AllowColumnResize="true"></Resizing>
                                        <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                    </ClientSettings>
                                </telerik:RadGrid>

                                    </telerik:RadAjaxPanel>
                                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                                        BackColor="Transparent"
                                        ForeColor="Blue">
                                        <div class="col-lg-12 text-center mt-5">
                                            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                                        </div>
                                    </telerik:RadAjaxLoadingPanel>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <%-- End form --%>
                </div>
            </div>
        </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
