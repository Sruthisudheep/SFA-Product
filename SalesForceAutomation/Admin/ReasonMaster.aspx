﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SalesForceAutomation.Master" AutoEventWireup="true" CodeBehind="ReasonMaster.aspx.cs" Inherits="SalesForceAutomation.Admin.ReasonMaster" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                   
                    <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">List Reason</h3>

                             <div class="kt-subheader__breadcrumbs" style="padding-left:20px;">
                            <a href="ReasonMaster.aspx" class="kt-subheader__breadcrumbs">
                                <i class="flaticon2-shelter"></i> Reason </a>
                            <%--<span class="kt-subheader__breadcrumbs-separator">></span>
                            <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link">Users </a>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a class="kt-subheader__breadcrumbs-link">Reviewer/Approver Assignment </a>--%>

                            <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                        </div>
                        </div>
                        <div class="kt-portlet__head-actions">
                            <div class="row">
                                <asp:LinkButton ID="lnkSubCat" runat="server" CssClass="btn btn-brand btn-elevate btn-icon-sm" Text="Add" OnClick="lnkSubCat_Click" Style="padding-top:14px;"></asp:LinkButton>
                                   </div>
                        </div>
                    </div>
                    <!--end: Search Form -->
                    <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                    <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>
                    <div class="kt-portlet__body">
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
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                            </ClientSettings>
                            <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                ShowFooter="false" DataKeyNames="rsn_ID"
                                EnableHeaderContextMenu="true">
                                <Columns>

                                    <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="1px" EditFormColumnIndex="0" UniqueName="EditColumn">
                                    </telerik:GridButtonColumn>

                                    <telerik:GridBoundColumn DataField="rsn_Name" AllowFiltering="true" HeaderStyle-Width="2px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Name" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="rsn_Name">
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn DataField="rsn_NameArabic" AllowFiltering="true" HeaderStyle-Width="2px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Arabic Name" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="rsn_NameArabic">
                                    </telerik:GridBoundColumn>

                                   <telerik:GridBoundColumn DataField="rsn_Type" AllowFiltering="true" HeaderStyle-Width="2px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Type" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="rsn_Type">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="2px"
                                        HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                        HeaderStyle-Font-Bold="true" UniqueName="Status">
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
                    </div>
                    </telerik:RadAjaxPanel>
                        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
