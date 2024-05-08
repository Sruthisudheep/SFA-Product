﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SalesForceAutomation.Master" AutoEventWireup="true" CodeBehind="SalesDetails.aspx.cs" Inherits="SalesForceAutomation.Admin.SalesDetails" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    <div class="kt-portlet__head" style="padding-top: 8px; padding-bottom: 8px;">


                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Invoice Details</h3>

                        <a href="SalesHeader.aspx" class="kt-subheader__breadcrumbs" style="padding-left:10px;">
                            <i class="flaticon2-shelter" style="padding-right:10px;"></i>Invoice</a>
                        <span class="kt-subheader__breadcrumbs-separator">></span>
                        <a class="kt-subheader__breadcrumbs-link">Invoice Details </a>

                     
                        </div>

                        <div class="kt-portlet__head-actions">

                            <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="../Media/excel.png" Height="50" ToolTip="Download" OnClick="imgExcel_Click" AlternateText="Xlsx" />

                        </div>
                    </div>


                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">
                        <div class="kt-portlet__body pb-0">

                            <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12" Width="100%" ID="RadPanelBar0" runat="server">
                                <Items>
                                    <telerik:RadPanelItem Font-Bold="true" Expanded="false" BackColor="#F2F6F9">

                                        <ContentTemplate>
                                            <div class="kt-portlet__body" style="background-color: #F9FAFC; display: grid">
                                                <table>
                                                    <td style="width: 56%">
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Route:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblRot" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-6 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Customer:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblCustomer" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>

                                                        <div class="col-lg-6 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Created Date:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblCreatedDate" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Created By:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblCreatedBy" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>

                                                    </td>
                                                    <td>

                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Discount:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblDis" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-6 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">SubTotal:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblSub" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>

                                                        <div class="col-lg-6 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">VAT:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblvat" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-12 mb-2">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Grand Total:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblGrand" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>

                                                    </td>
                                                </table>

                                            </div>

                                        </ContentTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelBar>
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
                                    AllowFilteringByColumn="false"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="10" CellSpacing="0">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="sld_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>




                                            <telerik:GridBoundColumn DataField="sld_TransType" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Type"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_TransType">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="false" HeaderStyle-Width="70px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText=" Code"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="false" HeaderStyle-Width="170px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText=" Product Name"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Name">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="sld_HigherUOM" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Higher UOM"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_HigherUOM">
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn DataField="sld_HigherQty" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Higher Qty"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_HigherQty">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="sld_LowerUOM" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Lower UOM"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_LowerUOM">
                                            </telerik:GridBoundColumn>
                                           
                                            <telerik:GridBoundColumn DataField="sld_LowerQty" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Lower Qty"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_LowerQty">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="sld_HigherPrice" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Higher Price"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_HigherPrice">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="sld_LowerPrice" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Lower Price"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_LowerPrice">
                                            </telerik:GridBoundColumn>



                                            <telerik:GridBoundColumn DataField="sld_LineTotal" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Total"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_LineTotal">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="sld_Discount" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Discount"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_Discount">
                                            </telerik:GridBoundColumn>

                                            <%-- <telerik:GridBoundColumn DataField="ind_SubTotal_WDiscount" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="SubTotal" 
                                                HeaderStyle-Font-Bold="true" UniqueName="ind_SubTotal_WDiscount">
                                            </telerik:GridBoundColumn>--%>



                                            <telerik:GridBoundColumn DataField="sld_LineVAT" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="VAT"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_LineVAT">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="sld_GrandTotal" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Line Total"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_GrandTotal">
                                            </telerik:GridBoundColumn>

                                            <%-- <telerik:GridBoundColumn DataField="sld_HUOMRtnAmount" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="HUOM Rtn Amount"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_HUOMRtnAmount">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="sld_LUOMRtnAmount" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="LUOM Rtn Amount"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_LUOMRtnAmount">
                                            </telerik:GridBoundColumn>

                                             <telerik:GridBoundColumn DataField="sld_ReturnAmount" AllowFiltering="false" HeaderStyle-Width="50px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Return Amount"
                                                HeaderStyle-Font-Bold="true" UniqueName="sld_ReturnAmount">
                                            </telerik:GridBoundColumn>--%>

                                        </Columns>
                                    </MasterTableView>
                                    <PagerStyle AlwaysVisible="true" />
                                    <GroupingSettings CaseSensitive="false" />
                                    <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="True">
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
    </div>
</asp:Content>
