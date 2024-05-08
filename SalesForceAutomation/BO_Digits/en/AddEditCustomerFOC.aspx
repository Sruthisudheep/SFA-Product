<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditCustomerFOC.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.AddEditCustomerFOC" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript">
        function Confim() {
            $('#modalConfirm').modal('show');
        }
        function Succcess(a) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');
            $('#success').text(a);
        }
        function Failure(b) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_5').modal('show');
            $('#failure').text(b);
        }
    </script>
</asp:Content>
<asp:Content ID="ContentAction" ContentPlaceHolderID="Actions" runat="server">
    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
        <asp:LinkButton ID="LinkButton2" Width="100px" runat="server"
            Text="Cancel"
            CausesValidation="False" CssClass="btn btn-sm fw-bold btn-secondary" OnClick="LinkButton2_Click" />


        <asp:LinkButton ID="LinkButton1" Width="100px" runat="server" ValidationGroup="form" OnClick="LinkButton1_Click" UseSubmitBehavior="false"
            Text='<i class="icon-ok"></i>Proceed' CssClass="btn btn-sm fw-bold btn-primary" CausesValidation="true" />
    </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
        BackColor="Transparent"
        ForeColor="Blue">
        <div class="col-lg-12 text-center mt-5">
            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
        </div>
    </telerik:RadAjaxLoadingPanel>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body" style="background-color: white; padding: 20px;">

        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
            <div class="row">
                <div class="col-lg-12">
                    <br />
                    <!--begin::Portlet-->
                    <div class="kt-portlet">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">

                        <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                            <div class=" col-lg-12 row" style="display: -webkit-box; padding-bottom: 10px">
 
                                <div class="col-lg-3">
                                    <label class="control-label col-lg-12">Route </label>
                                    <div class="col-lg-12">
                                        <telerik:RadComboBox ID="ddlids" runat="server" Filter="Contains"
                                            RenderMode="Lightweight" EmptyMessage="Select Route" Width="100%" OnSelectedIndexChanged="ddlids_SelectedIndexChanged" AutoPostBack="true">
                                        </telerik:RadComboBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                            ControlToValidate="ddlids" ErrorMessage="Please choose Route" ForeColor="Red" Display="Dynamic" ValidationGroup="form"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                    </div>
                                </div>



                                <div class="col-lg-2">
                                    <label class="control-label col-lg-12">From Date</label>
                                    <div class="col-lg-12">
                                        <telerik:RadDatePicker RenderMode="Lightweight" ID="rdFromData" Width="100%" DateInput-DateFormat="dd-MMM-yyyy" runat="server">
                                        </telerik:RadDatePicker>
                                        <%--                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rdfromDate"></asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>

                                <div class="col-lg-2">
                                    <label class="control-label col-lg-12">To Date</label>
                                    <div class="col-lg-12">
                                        <telerik:RadDatePicker RenderMode="Lightweight" ID="rdEndDate" Width="100%" DateInput-DateFormat="dd-MMM-yyyy" runat="server">
                                        </telerik:RadDatePicker>
                                        <asp:CompareValidator ID="dd" runat="server" ControlToValidate="rdEndDate" ControlToCompare="rdFromData" ErrorMessage="End date must be greater"
                                            Display="Dynamic" ForeColor="Red" Operator="GreaterThanEqual"></asp:CompareValidator>
                                        <%--                                        <asp:RequiredFieldValidator ID="l" runat="server" Display="Dynamic" ErrorMessage="To Date is mandatory" ForeColor="Red" ControlToValidate="rdendDate"></asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
   


                            </div>
                                  
                        </div>
                        <%-- strat form --%>
                        <div class="col-lg-12 row">


                            <div class="col-lg-6">

                                <!--begin::Portlet-->
                                <div class="kt-portlet">

                                    <div class="col-lg-12 row" style="padding-top: 20px; padding-bottom: 20px;">
                                        <div class="col-lg-10">
                                            <h3 class="kt-portlet__head-title">Customer
                                            </h3>
                                        </div>
                                      
                                    </div>

                                    <!--begin::Form-->
                                    <div class="kt-form kt-form--label-right">
                                        <div class="kt-portlet__body">
                                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>

                                            <telerik:RadSkinManager ID="RadSkinManager2" runat="server" Skin="Material" />
                                            <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
                                                ID="grvcustomer" GridLines="None"
                                                ShowFooter="True" AllowSorting="True"
                                                OnNeedDataSource="grvcustomer_NeedDataSource"
                                                AllowFilteringByColumn="true"
                                                ClientSettings-Resizing-ClipCellContentOnResize="true"
                                                EnableAjaxSkinRendering="true"
                                                AllowPaging="true" PageSize="200" CellSpacing="0" PagerStyle-AlwaysVisible="true">
                                                <ClientSettings>
                                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                                </ClientSettings>
                                                <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                                    ShowFooter="false" DataKeyNames="cus_ID"
                                                    EnableHeaderContextMenu="true">
                                                    <Columns>

                                                        <telerik:GridClientSelectColumn HeaderStyle-Width="40px" UniqueName="chkAll">
                                                        </telerik:GridClientSelectColumn>

                                                        <telerik:GridBoundColumn DataField="cus_Code" AllowFiltering="true" HeaderStyle-Width="100px"
                                                            HeaderStyle-Font-Size="Smaller" HeaderText="Code" FilterControlWidth="100%"
                                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                            HeaderStyle-Font-Bold="true" UniqueName="cus_Code">
                                                        </telerik:GridBoundColumn>

                                                        <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                                            HeaderStyle-Font-Size="Smaller" HeaderText="Customer" FilterControlWidth="100%"
                                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                            HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
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
                                <div class="kt-portlet">
                                    <div class="col-lg-12 row" style="padding-top: 20px; padding-bottom: 20px;">
                                        <div class="col-lg-10">
                                            <h3 class="kt-portlet__head-title">Products
                                            </h3>
                                        </div>
                                       
                                    </div>
                                    <!--begin::Form-->
                                    <div class="kt-form kt-form--label-right">
                                        <div class="kt-portlet__body">
                                            <asp:Literal ID="Literal2" runat="server"></asp:Literal>


                                            <telerik:RadAjaxPanel ID="RadAjaxPanel8" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
                                                    ID="grvproduct" GridLines="None"
                                                    ShowFooter="True" AllowSorting="True"
                                                    OnNeedDataSource="grvproduct_NeedDataSource"
                                                    AllowFilteringByColumn="true"
                                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                                    EnableAjaxSkinRendering="true"
                                                    AllowPaging="true" PageSize="200" CellSpacing="0" PagerStyle-AlwaysVisible="true">
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

                                                            <telerik:GridTemplateColumn HeaderStyle-Width="90px" AllowFiltering="false" UniqueName="txttotalQty" HeaderText="Total Qty" HeaderStyle-Font-Size="Smaller"
                                                                HeaderStyle-Font-Bold="true">
                                                                <ItemTemplate>
                                                                    <telerik:RadNumericTextBox ID="txttotalQty" runat="server" Width="100px" NumberFormat-AllowRounding="false" DecimalDigits="0"></telerik:RadNumericTextBox>

                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>


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
                                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel4" EnableEmbeddedSkins="false"
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
                                                           </telerik:RadAjaxPanel>

<telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
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


    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" style="height: auto" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confirm">Are you sure you want to save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="save" runat="server" Text="Yes" CssClass="btn btn-sm fw-bold btn-primary" OnClick="save_Click" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/icons/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(modalConfirm);">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" style="height: auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span id="success"></span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->

    <!--begin::FailedModal-->
    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" style="height: auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span id="failure"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">OK</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
</asp:Content>
