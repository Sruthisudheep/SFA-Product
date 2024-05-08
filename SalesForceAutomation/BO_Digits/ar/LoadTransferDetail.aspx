﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/ar/ar_master.Master" AutoEventWireup="true" CodeBehind="LoadTransferDetail.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.ar.LoadTransferDetail" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="ContentAction" ContentPlaceHolderID="Actions" runat="server">

    <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="../assets/media/icons/excel.png" Style="height: 60px; padding-top: 10px; padding-left: 20px;" ToolTip="تحميل" OnClick="imgExcel_Click" AlternateText="Xlsx" />
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet" style="background-color:white; padding:20px;">

                     
                  
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
                                                        <div class="col-lg-6 mb-2 ms-4">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">طريق:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblRot" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-6 mb-2 ms-4">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">مستخدم:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblUser" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>

                                                    </td>
                                                    <td>

                                                        <div class="col-lg-6 mb-2 ms-4">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;"> تاريخ:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblDate" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>

                                                         <div class="col-lg-6 mb-2 ms-4">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;"> يكتب:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblType" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                    </td>
                                                </table>


                                            </div>

                                        </ContentTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelBar>
                        </div>


                        <div class="kt-portlet__body">
                           <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1"  >
                                                
                            <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                            <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                ID="grvRpt" GridLines="None"
                                ShowFooter="True" AllowSorting="True"
                                OnNeedDataSource="grvRpt_NeedDataSource"
                                OnItemCommand="grvRpt_ItemCommand"
                                AllowFilteringByColumn="true"
                                ClientSettings-Resizing-ClipCellContentOnResize="true"
                                EnableAjaxSkinRendering="true"
                                AllowPaging="true" PageSize="10" CellSpacing="0" PagerStyle-AlwaysVisible="true" ScrollHeight="500px">
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                    ShowFooter="false" DataKeyNames="ltd_ID"
                                    EnableHeaderContextMenu="true">
                                    <Columns>
                                        <%--<telerik:GridTemplateColumn HeaderStyle-Width="40px" UniqueName="Detail" AllowFiltering="false" HeaderText="" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandName="Detail" ID="RadImageButton2" Visible="true" AlternateText="Detail" runat="server"
                                                    ImageUrl="assets/media/icons/svg/General/Clipboard.svg"></asp:ImageButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>--%>

                                        <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="true" HeaderStyle-Width="150px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="كود المنتج" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="prd_Code">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="منتج" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="prd_Name">
                                        </telerik:GridBoundColumn>

                                          <telerik:GridBoundColumn DataField="prd_NameArabic" AllowFiltering="true" HeaderStyle-Width="150px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="المنتج باللغة العربية" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="prd_NameArabic">
                                        </telerik:GridBoundColumn>
                                          <telerik:GridBoundColumn DataField="ltd_CurrentStockHUOM" AllowFiltering="true" HeaderStyle-Width="120px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="المخزون الحالي وحدة قياس أعلى" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="ltd_CurrentStockHUOM">
                                        </telerik:GridBoundColumn>
                                          
                                        <telerik:GridBoundColumn DataField="ltd_CurrentStockHQty" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="كمية المخزون الحالي أعلى" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="ltd_CurrentStockHQty">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="ltd_CurrentStockLUOM" AllowFiltering="true" HeaderStyle-Width="120px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="وحدة القياس السفلية للمخزون الحالي" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="ltd_CurrentStockLUOM">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="ltd_CurrentStockLQty" AllowFiltering="true" HeaderStyle-Width="120px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="الكمية المنخفضة للمخزون الحالي" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="ltd_CurrentStockLQty">
                                        </telerik:GridBoundColumn>

                                       

                                        <telerik:GridBoundColumn DataField="ltd_OffloadHUOM" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="تفريغ وحدة قياس أعلى" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="ltd_OffloadHUOM" >
                                        </telerik:GridBoundColumn>

                                         <telerik:GridBoundColumn DataField="ltd_OffloadHQty" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="تفريغ كمية أعلى" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="ltd_OffloadHQty">
                                        </telerik:GridBoundColumn>

                                         <telerik:GridBoundColumn DataField="ltd_OffloadLUOM" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="تفريغ وحدة القياس السفلية" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="ltd_OffloadLUOM">
                                        </telerik:GridBoundColumn>

                                         <telerik:GridBoundColumn DataField="ltd_OffloadLQty" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="تفريغ كمية أقل" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="ltd_OffloadLQty">
                                        </telerik:GridBoundColumn>


                                         <telerik:GridBoundColumn DataField="ltd_BalanceHUOM" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="ميزان وحدة قياس أعلى" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="ltd_BalanceHUOM">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="ltd_BalanceHQty" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="توازن كمية أعلى" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="ltd_BalanceHQty">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="ltd_BalanceLUOM" AllowFiltering="true" HeaderStyle-Width="100px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="توازن وحدة قياس أقل" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="ltd_BalanceLUOM">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="ltd_BalanceLQty" AllowFiltering="true" HeaderStyle-Width="80px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="توازن كمية أقل" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="ltd_BalanceLQty">
                                        </telerik:GridBoundColumn>

                                        
                                    </Columns>
                                </MasterTableView>
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
    </div>
</asp:Content>

