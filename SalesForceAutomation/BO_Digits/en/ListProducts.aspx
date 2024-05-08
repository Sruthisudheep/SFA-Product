﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ListProducts.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.ListProducts" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="ContentAction" ContentPlaceHolderID="Actions" runat="server">

    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
        <asp:LinkButton ID="lnkAddProduct" runat="server" CssClass="btn btn-sm fw-bold btn-primary" OnClick="lnkAddProduct_Click">
                                             Add
        </asp:LinkButton>


    </telerik:RadAjaxPanel>

    <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="../assets/media/icons/excel.png" Height="50px" ToolTip="Download" OnClick="imgExcel_Click" AlternateText="Xlsx" />
    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
        BackColor="Transparent"
        ForeColor="Blue">
        <div class="col-lg-12 text-center mt-5">
            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
        </div>
    </telerik:RadAjaxLoadingPanel>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body" style="background-color: white; padding: 20px;">
        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
            <div class="row">
                <div class="col-lg-12">
                    <!--begin::Portlet-->
                    <div class="kt-portlet">

                        <!--begin::Form-->


                        <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

                            <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>
                            <div class="kt-form kt-form--label-right">
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
                                            ShowFooter="false" DataKeyNames="prd_ID"
                                            EnableHeaderContextMenu="true">
                                            <Columns>

                                                <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="50px" EditFormColumnIndex="0" UniqueName="EditColumn">
                                                </telerik:GridButtonColumn>

                                                <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText=" Code" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="prd_Code">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="true" HeaderStyle-Width="180px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText=" Name" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="prd_Name">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="prd_NameArabic" AllowFiltering="true" HeaderStyle-Width="150px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Arabic Name" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="prd_NameArabic">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="cat_Name" AllowFiltering="true" HeaderStyle-Width="130px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Category" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="cat_Name">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="sct_Name" AllowFiltering="true" HeaderStyle-Width="130px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Sub Category" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="sct_Name">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="brd_Name" AllowFiltering="true" HeaderStyle-Width="130px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Brand" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="brd_Name">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="prd_ReturnDays" AllowFiltering="true" HeaderStyle-Width="100px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Return Days" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="prd_ReturnDays">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="prd_ItemLongDesc" AllowFiltering="true" HeaderStyle-Width="200px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Item Long Desc" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="prd_ItemLongDesc">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="prd_ArabicItemLongDesc" AllowFiltering="true" HeaderStyle-Width="100px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Arabic Item Long Desc" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="prd_ArabicItemLongDesc">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="prd_isSalesHold" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Sales Hold" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="prd_isSalesHold" Visible="true">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="prd_isReturnHold" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Return Hold" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="prd_isReturnHold" Visible="true">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="prd_isOrderHold" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Order Hold" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="prd_isOrderHold" Visible="true">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="prd_EnableReturnReqHold" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Return.Req Hold" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="prd_EnableReturnReqHold" Visible="true">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="60px"
                                                    HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                                                    CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                    HeaderStyle-Font-Bold="true" UniqueName="Status" Visible="true">
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
                                </div>
                            </div>
                        </telerik:RadAjaxPanel>
                        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                            BackColor="Transparent"
                            ForeColor="Blue">
                            <div class="col-lg-12 text-center mt-5">
                                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel>



                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
