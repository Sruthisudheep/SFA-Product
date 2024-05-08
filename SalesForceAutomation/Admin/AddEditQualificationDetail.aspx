﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SalesForceAutomation.Master" AutoEventWireup="true" CodeBehind="AddEditQualificationDetail.aspx.cs" Inherits="SalesForceAutomation.Admin.AddEditQualificationDetail" %>
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
         function Failure() {
             $('#modalConfirm').modal('hide');
             $('#kt_modal_1_5').modal('show');
        }
        function redirect() {
            var url = new URL(window.location.href);
            var c = url.searchParams.get("HId");
            window.location.href = "ListQualificationDetail.aspx?Id=" + c;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
        <div class="row">
            <div class="col-lg-12">
                <!--begin::Portlet-->
                <div class="kt-portlet">
                  <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                      
                     <%-- breadcrumbs --%>
                        <div class="kt-subheader__breadcrumbs">
                            <a href="ListQualificationHeader.aspx" class="kt-subheader__breadcrumbs">
                                <i class="flaticon2-shelter"></i> List Qualification Header </a>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a href="javascript:redirect();" class="kt-subheader__breadcrumbs-link"> List Qualification Detail </a>
                            <span class="kt-subheader__breadcrumbs-separator">></span>
                            <a class="kt-subheader__breadcrumbs-link">Add Edit Qualification Detail </a>

                            <!-- <span class="kt-subheader__breadcrumbs-link kt-subheader__breadcrumbs-link--active">Active link</span> -->
                        </div>
                        <%-- breadcrumbs --%>
                      </div>
                    <div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">Add Edit Qualification Detail <asp:Label ID="lblTitle" runat="server"></asp:Label>
                            </h3>
                            
                        </div>
                       <div class="kt-portlet__head-actions">
                            <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                <asp:LinkButton ID="lnkSave" Width="100px" runat="server" ValidationGroup="form" OnClick="lnkSave_Click" UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Save'
                                    CssClass="btn btn-brand btn-elevate btn-icon-sm"  CausesValidation="true"/>
                                <asp:LinkButton ID="lnkCancel" Width="100px" runat="server"
                                    Text="Cancel" CssClass="btn btn-brand btn-elevate btn-icon-sm"
                                    CausesValidation="False" OnClick="lnkCancel_Click" />
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
                        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">
                        <div class="col-lg-12 row">
                            
                          <%-- <div class="col-lg-4 form-group" >
                                <label class="control-label col-lg-12">Category</label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlCat" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Category" OnSelectedIndexChanged="ddlCat_SelectedIndexChanged" AutoPostBack="true"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                        ControlToValidate="ddlCat" ErrorMessage="Please Select Category" ForeColor="Red" Display="Dynamic" ValidationGroup="form"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>

                            <div class="col-lg-4 form-group" >
                                <label class="control-label col-lg-12">Subcategory</label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlSubCat" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Subcategory" OnSelectedIndexChanged="ddlSubCat_SelectedIndexChanged" AutoPostBack="true"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                     ControlToValidate="ddlSubCat" ErrorMessage="Please Select Subcategory" ForeColor="Red" Display="Dynamic"  ValidationGroup="form"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>--%>

                            <div class="col-lg-4 form-group" >
                                <label class="control-label col-lg-12">Product</label>
                                <div class="col-lg-12">
                                    <telerik:RadComboBox ID="ddlProduct" runat="server" Width="100%" Filter="Contains" EmptyMessage="Select Product" CheckBoxes="true"></telerik:RadComboBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                     ControlToValidate="ddlProduct" ErrorMessage="Please Select Product" ForeColor="Red" Display="Dynamic"  ValidationGroup="form"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                </div>
                            </div>

                            <div class="col-lg-4 form-group">
                                <label class="control-label col-lg-12">Status</label>
                                <div class="col-lg-12">
                                    <telerik:RadDropDownList ID="ddlStatus" runat="server" Width="100%">
                                        <items>
                                            <telerik:DropDownListItem Text="Enabled" Value="Y" Selected="true" />
                                            <telerik:DropDownListItem Text="Disabled" Value="N" />
                                        </items>
                                    </telerik:RadDropDownList>
                                </div>
                            </div>
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
                    <asp:LinkButton ID="lnkAdd" runat="server" Text="Yes" OnClick="lnkAdd_Click" CssClass="btn btn-brand btn-elevate btn-icon-sm" />
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
                    <span>Something went wrong, please try again later.</span>
                </div>
                <div class="modal-footer">
                    <button type="reset" data-dismiss="modal" class="btn btn-secondary">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
</asp:Content>