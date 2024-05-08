﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SalesForceAutomation.Master" AutoEventWireup="true" CodeBehind="AddEditCustomerFOC.aspx.cs" Inherits="SalesForceAutomation.Admin.AddEditCustomerFOC" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <br />
                <!--begin::Portlet-->
                <div class="kt-portlet">
                    <%--<div class="kt-portlet__head" style="padding-top: 20px">

                       
                    </div>--%>
                    <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Add Edit Customer FOC
                            </h3>
                            
                             <span class="kt-subheader__separator kt-hidden"></span>
                        <div class="kt-subheader__breadcrumbs" style="padding-left:30px">


                            <a href="ListCustomerFOC.aspx" class="kt-subheader__breadcrumbs">
                                <i class="flaticon2-shelter"></i> List Customer FOC</a>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a class="kt-subheader__breadcrumbs-link"> Add Edit Customer FOC</a>

                            <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                        </div>

                        </div>
                         <%--<span class="kt-subheader__separator kt-hidden"></span>
                        <div class="kt-subheader__breadcrumbs">


                            <a href="ListCustomerFOC.aspx" class="kt-subheader__breadcrumbs">
                                <i class="flaticon2-shelter"></i>List Customer FOC</a>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a class="kt-subheader__breadcrumbs-link">Add Edit Customer FOC</a>

                            <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                        </div>--%>
                        <div class="kt-portlet__head-actions">
                            <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <asp:LinkButton ID="LinkButton1" Width="100px" runat="server" ValidationGroup="form" OnClick="LinkButton1_Click" UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Save'
                                    CssClass="btn btn-brand btn-elevate btn-icon-sm" CausesValidation="true" />
                                <asp:LinkButton ID="LinkButton2" Width="100px" runat="server"
                                    Text="Cancel" CssClass="btn btn-brand btn-elevate btn-icon-sm"
                                    CausesValidation="False" OnClick="LinkButton2_Click" />
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

                    <div class="kt-portlet__body">
                         <telerik:RadAjaxPanel ID="cdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">
                           
                        <asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>

                        <div class="col-lg-12 row">

                            <div class="col-lg-3 form-group">
                                <label class="control-label col-lg-12">Route Name <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlids" runat="server" EmptyMessage="Select Route Name" AutoPostBack="true" OnSelectedIndexChanged="ddlids_SelectedIndexChanged"
                                        CausesValidation="false" Width="100%" Filter="Contains">
                                    </telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="ddlids" ErrorMessage="Please select Route Name" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>

                            <div class="col-lg-3 form-group">
                                <label class="control-label col-lg-12">Customer</label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlCus" runat="server" Width="100%" EmptyMessage="Select Customer" Filter="Contains" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlCus_SelectedIndexChanged" CausesValidation="false"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="ddlCus" ErrorMessage="Please Select Customer" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True" InitialValue="Select Route"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>

                            <div class="col-lg-3 form-group">
                                <label class="control-label col-lg-12">Product Name <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlp" runat="server" EmptyMessage="Select Product Name" OnSelectedIndexChanged="ddlp_SelectedIndexChanged" AutoPostBack="true" CausesValidation="false" Width="100%" Filter="Contains"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="ddlp" ErrorMessage="Please select Product Name" ForeColor="Red" Display="Dynamic"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>

                          <div class="col-lg-3 form-group" >
                                <label class="control-label col-lg-12">Total Qty <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadNumericTextBox ID="txteligible" NumberFormat-DecimalDigits="0" runat="server" AutoPostBack="true" OnTextChanged="txteligible_TextChanged" CssClass="form-control" Width="100%"></telerik:RadNumericTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="form"
                                        ControlToValidate="txteligible" Display="Dynamic" ForeColor="Red"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="col-lg-3 form-group" >
                                <label class="control-label col-lg-12">Higher UOM  <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtHUom"  runat="server" enabled="false"  Width="100%"
                                           OnSelectedIndexChanged="ddlHUom_SelectedIndexChanged" AutoPostBack="true"></telerik:RadTextBox>
                                  
                                </div>
                            </div> 
                          
                            <div class="col-lg-3 form-group" >
                                <label class="control-label col-lg-12">Higher Qty <span class="required">* </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadNumericTextBox ID="txtHQty" NumberFormat-DecimalDigits="0" enabled="false" runat="server" CssClass="form-control" Width="100%"></telerik:RadNumericTextBox>
                                
                                </div>
                            </div>

                            <div class="col-lg-3 form-group" >
                                <label class="control-label col-lg-12">Lower UOM <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadTextBox ID="txtLUom"  runat="server" CssClass="form-control" enabled="false" Width="100%"  ></telerik:RadTextBox>
                                 
                                </div>
                            </div>

                            <div class="col-lg-3 form-group" >
                                <label class="control-label col-lg-12">Lower Qty <span class="required"> </span></label>
                                <div class="col-lg-12">
                                    <telerik:RadNumericTextBox ID="txtLQty" NumberFormat-DecimalDigits="0" runat="server" Enabled="false" CssClass="form-control" Width="100%"></telerik:RadNumericTextBox>
                               
                                </div>
                            </div>

                           

                            <div class="col-lg-3 form-group">
                                    <div class="col-lg-12">
                                        <label class="control-label col-lg-12 pl-0">From Date </label>
                                    </div>
                                    <div class="col-lg-12">
                                        <telerik:RadDatePicker ID="rdFromData" DateInput-DateFormat="yyyy-MM-dd" runat="server"
                                            Width="100%">
                                        </telerik:RadDatePicker>
                                    </div>
                                </div>

                            <div class="col-lg-3 form-group">
                                    <div class="col-lg-12">
                                        <label class="control-label col-lg-12 pl-0">To Date </label>
                                    </div>
                                    <div class="col-lg-12" style="padding-left: 1rem;">
                                        <telerik:RadDatePicker ID="rdEndDate" runat="server" DateInput-DateFormat="yyyy-MM-dd" Width="100%"></telerik:RadDatePicker>
                                        <asp:CompareValidator ID="cmp" runat="server" ControlToCompare="rdFromData" ControlToValidate="rdEndDate" Operator="GreaterThan"
                                            ErrorMessage="To data must be greater" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                    </div>
                                </div>

                           
                                <%-- <div class="col-lg-4 form-group" style="padding-top: 8px;">
                                    <label class="control-label col-lg-12">EligibleQty <span class="required">*</span></label>
                                    <div class="col-lg-12">
                                        <telerik:RadTextBox ID="txteligible" runat="server" CssClass="form-control" Width="83%"></telerik:RadTextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                            ControlToValidate="txteligible" ErrorMessage="Please Enter  EligibleQty" ForeColor="Red" Display="Dynamic"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                    </div>
                                </div>--%>
                            </div>
                        
                        </telerik:RadAjaxPanel>
                         <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
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
    

    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confirm">Are you sure you want to save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="save" runat="server" Text="Yes" OnClick="save_Click" CssClass="btn btn-brand btn-elevate btn-icon-sm" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../Media/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="reset" data-dismiss="modal" class="btn btn-secondary">
                        Cancel
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span id="success"></span>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-secondary">OK</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--end::SuccessModal-->

    <!--begin::FailedModal-->
    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span id="failure"></span>
                </div>
                <div class="modal-footer">
                    <button type="reset" data-dismiss="modal" class="btn btn-secondary">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
</asp:Content>
