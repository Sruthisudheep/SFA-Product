<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ListPriceListHeader.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.ListPriceListHeader" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script>
        function redirect() {

            window.location.href = "ListSpecialPriceAssign.aspx";
        }

    </script>
</asp:Content>
<asp:Content ID="ContentAction" ContentPlaceHolderID="Actions" runat="server">
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                <asp:LinkButton ID="lnkAssgnCus" runat="server" CssClass="btn btn-sm fw-bold btn-primary me-2" Text="Assigned Customer" OnClick="lnkAssgnCus_Click"></asp:LinkButton>

        <asp:LinkButton ID="lnkCusReAssign" runat="server" CssClass="btn btn-sm btn-light-primary me-2 border-1" BackColor="white" Text="Bulk Special Price Delete" OnClick="lnkCusReAssign_Click"></asp:LinkButton>
       
        <asp:LinkButton ID="lnkSubCat" runat="server" CssClass="btn btn-sm fw-bold btn-primary" Text="Add" OnClick="lnkSubCat_Click"></asp:LinkButton>
    </telerik:RadAjaxPanel>
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

                        <div class="kt-portlet__head">


                            <div class="kt-portlet__head-actions" style="text-align-last: end; padding-bottom: 10px;">
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
                                    AllowPaging="true" PageSize="10" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="prh_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>

                                            <telerik:GridButtonColumn CommandName="Edit" Text='<i class="fa fa-edit"></i>' HeaderStyle-Width="10px" EditFormColumnIndex="0" UniqueName="EditColumn">
                                            </telerik:GridButtonColumn>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="10px" AllowFiltering="false" HeaderText="" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="Detail" ID="RadImageButton2" Visible="true" AlternateText="Detail" runat="server"
                                                        ImageUrl="../assets/media/icons/details.png"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridTemplateColumn HeaderStyle-Width="10px" AllowFiltering="false" HeaderText="Assign" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="CusAssign">
                                                <ItemTemplate>
                                                    <asp:ImageButton CommandName="CusAssign" ID="CusAssign" Visible="true" AlternateText="Assign" runat="server"
                                                        ImageUrl="../assets/media/svg/General/Clipboard.svg"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                            <telerik:GridBoundColumn DataField="prh_Code" AllowFiltering="true" HeaderStyle-Width="20px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Code" FilterControlWidth="50%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prh_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="prh_Name" AllowFiltering="true" HeaderStyle-Width="20px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Name" FilterControlWidth="50%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prh_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="20px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Created On" FilterControlWidth="50%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="prh_PayMode" AllowFiltering="true" HeaderStyle-Width="20px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Pay Mode" FilterControlWidth="50%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prh_PayMode" Visible="false">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="20px"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="50%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="Status">
                                            </telerik:GridBoundColumn>
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
                                <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                            </div>
                        </telerik:RadAjaxLoadingPanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
