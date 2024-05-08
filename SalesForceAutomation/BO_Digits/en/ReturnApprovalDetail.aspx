﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ReturnApprovalDetail.aspx.cs" Inherits="SalesForceAutomation.BO_Digits.en.ReturnApprovalDetail" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript">

        function Confim() {
            $('#modalConfirm').modal('show');
        }
        function successModal(a) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');
            $('#success').text(a);
        }
        function RequiredModal() {

            $('#kt_modal_1_0').modal('show');
        }
        function failedModal(b) {
            $('#kt_modal_1_5').modal('show');
            $('#failtext').text(b);
        }
        function failedModals() {
            $('#kt_modal_1_3').modal('hide');
            $('#kt_modal_1_4').modal('hide');
            $('#kt_modal_1_5').modal('hide');

            $('#kt_modal_1_9').modal('show');


        }

    </script>
</asp:Content>
<asp:Content ID="ContentAction" ContentPlaceHolderID="Actions" runat="server">
    <telerik:RadAjaxPanel ID="RadAjaxPanel5" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

        <asp:LinkButton ID="lnkConfirm" runat="server" ValidationGroup="form" UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Confirm'
            CssClass="btn btn-sm fw-bold btn-primary" CausesValidation="true" OnClick="lnkConfirm_Click" />
    </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel5" EnableEmbeddedSkins="false"
        BackColor="Transparent"
        ForeColor="Blue">
        <div class="col-lg-12 text-center mt-5">
            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
        </div>
    </telerik:RadAjaxLoadingPanel>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet" style="background-color: white; padding: 20px;">



                    <!--begin::Form-->
                    <div class="kt-form kt-form--label-right">

                        <div class="kt-portlet__body pb-0">

                            <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12" Width="100%" ID="RadPanelBar0" runat="server">
                                <Items>
                                    <telerik:RadPanelItem Font-Bold="true" Expanded="True" BackColor="#F2F6F9">

                                        <ContentTemplate>
                                            <div class="kt-portlet__body" style="background-color: #F9FAFC; display: grid; padding: 10px;">
                                                <table>
                                                    <td style="width: 33%">
                                                        <asp:PlaceHolder ID="pnlReq" runat="server" Visible="false">
                                                            <div class="col-lg-6 mb-2 ms-4">
                                                                <label class="col-lg-2 col-form-label" style="display: contents;">Request ID:</label>
                                                                <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                    <asp:Label ID="lblReqID" Font-Bold="true" runat="server"></asp:Label></label>
                                                            </div>
                                                        </asp:PlaceHolder>
                                                        <div class="col-lg-6 mb-2 ms-4">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Route:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblRot" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-6 mb-2 ms-4">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">User:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblUser" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>

                                                    </td>
                                                    <td style="width: 35%">
                                                        <div class="col-lg-6 mb-2 ms-4">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Customer:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblCustomer" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <div class="col-lg-6 mb-2 ms-4">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">Date&Time:</label>
                                                            <label class="col-lg4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblDate" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>
                                                        <%-- <div class="col-lg-6 mb-2 ms-4">
                                                             <label class="col-lg-2 col-form-label" style="display: contents;"> Total:</label>
                                                             <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                 <asp:Label ID="lblTotal" Font-Bold="true" runat="server"></asp:Label></label>
                                                         </div>

                                                        
                                                    </td>
                                                     <td>
                                                      <div class="col-lg-6 mb-2 ms-4">
                                                          <label class="col-lg-2 col-form-label" style="display: contents;">Discount:</label>
                                                          <label class="col-lg-4 col-form-label" style="display: contents;">
                                                              <asp:Label ID="lblDiscount" Font-Bold="true" runat="server"></asp:Label></label>
                                                      </div>
                                                     <div class="col-lg-6 mb-2 ms-4">
                                                         <label class="col-lg-2 col-form-label" style="display: contents;">SubTotal:</label>
                                                         <label class="col-lg-4 col-form-label" style="display: contents;">
                                                             <asp:Label ID="lblSubTotal" Font-Bold="true" runat="server"></asp:Label></label>
                                                     </div>
                                                      <div class="col-lg-6 mb-2 ms-4">
                                                          <label class="col-lg-2 col-form-label" style="display: contents;">VAT:</label>
                                                          <label class="col-lg-4 col-form-label" style="display: contents;">
                                                              <asp:Label ID="lblVat" Font-Bold="true" runat="server"></asp:Label></label>
                                                      </div>
                                                         <div class="col-lg-6 mb-2 ms-4">
                                                            <label class="col-lg-2 col-form-label" style="display: contents;">GrandTotal:</label>
                                                            <label class="col-lg-4 col-form-label" style="display: contents;">
                                                                <asp:Label ID="lblGrandTotal" Font-Bold="true" runat="server"></asp:Label></label>
                                                        </div>--%>

     
                                                    </td>
                                                </table>


                                            </div>

                                        </ContentTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelBar>
                        </div>


                        <div class="kt-portlet__body">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

                                <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                    ID="grvRpt" GridLines="None"
                                    ShowFooter="True" AllowSorting="True"
                                    OnNeedDataSource="grvRpt_NeedDataSource"
                                    OnItemCommand="grvRpt_ItemCommand"
                                    OnItemDataBound="grvRpt_ItemDataBound"
                                    OnPreRender="grvRpt_PreRender"
                                    AllowFilteringByColumn="true"
                                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                                    EnableAjaxSkinRendering="true"
                                    AllowPaging="true" PageSize="10" CellSpacing="0" PagerStyle-AlwaysVisible="true" ScrollHeight="500px">
                                    <ClientSettings>
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
                                    </ClientSettings>
                                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                        ShowFooter="false" DataKeyNames="rad_ID"
                                        EnableHeaderContextMenu="true">
                                        <Columns>
                                            

                                        <telerik:GridBoundColumn DataField="inv_InvoiceID" AllowFiltering="true" HeaderStyle-Width="100%"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Invoice No" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="inv_InvoiceID">
                                        </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="prd_Code" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Product Code" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Code">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="prd_Name" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Product" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="prd_Name">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="HUOM" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Higher UOM" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="HUOM">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="RequestedHQty" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Requested HQty" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="RequestedHQty">
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ReturnHQty" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Return HQty" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ReturnHQty">
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="AdjustedHQty" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Adjusted HQty" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="AdjustedHQty">
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="ExcessHQty" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Excess HQty" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ExcessHQty">
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="LUOM" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Lower UOM" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="LUOM">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="RequestedLQty" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Requested LQty" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="RequestedLQty">
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ReturnLQty" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Return LQty" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ReturnLQty">
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="AdjustedLQty" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Adjusted LQty" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="AdjustedLQty">
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="ExcessLQty" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Excess LQty" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="ExcessLQty">
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn DataField="rsn_Name" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="User Reason" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rsn_Name">
                                            </telerik:GridBoundColumn>


                                            <telerik:GridTemplateColumn UniqueName="DropDownColum" AllowFiltering="false" HeaderStyle-Width="100%"
                                                HeaderText="Reason" FilterControlWidth="100%" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true">
                                                <ItemTemplate>
                                                    <telerik:RadComboBox ID="ddlReason" runat="server" Filter="Contains" EmptyMessage="Select Reason"
                                                        Width="100%" RenderMode="Lightweight">
                                                    </telerik:RadComboBox>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>

                                              <telerik:GridBoundColumn DataField="rad_ApprovalStatus" AllowFiltering="true" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="rad_ApprovalStatus" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="rad_ApprovalStatus" Display="false">
                                            </telerik:GridBoundColumn>

                                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="100%"
                                                HeaderStyle-Font-Size="Smaller" HeaderText="Actions" FilterControlWidth="100%"
                                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                                HeaderStyle-Font-Bold="true" UniqueName="btn">

                                                <ItemTemplate>
                                                    <asp:RadioButtonList ID="rbActions" runat="server" RepeatDirection="Horizontal" CssClass="radioList">
                                                        <asp:ListItem ID="rdApprove" Text="Approve" Value="A" style="color: blue; padding-right: 5px;" />
                                                        <asp:ListItem ID="rdReject" Text="Reject" Value="R" style="color: Red;" />
                                                    </asp:RadioButtonList>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>



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

    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" style="height: auto;" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confirm">Are you sure you want to save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="save" runat="server" Text="Yes" OnClick="save_Click" CssClass="btn btn-sm fw-bold btn-primary" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(modalConfirm);">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" style="height: auto;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    <div class="modal fade" id="kt_modal_1_5" style="height: auto;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span id="failtext"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="kt_modal_1_0" tabindex="-1" role="dialog" style="height: auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Ooops..!</h5>
                </div>
                <div class="modal-body">
                    <p>You must select any  Reason and should do approve or reject for all the items listed here.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_0);">OK</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
    <div class="modal fade" id="kt_modal_1_9" style="height: auto;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">No selection found..!</h5>
                </div>
                <div class="modal-body">
                    <p>Please make selection and try again.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_9);">OK</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
