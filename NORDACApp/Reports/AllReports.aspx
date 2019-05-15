<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AllReports.aspx.cs" Inherits="NORDACApp.Reports.AllReports" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Content/dist/css/telerikCombo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">System Reports </h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
               
                 <asp:UpdatePanel runat="server">
                     <ContentTemplate>
                         <div class="modal-content">
                        <div class="modal-body">
                             <div class="form-group">
                                 <div class="row">
                                     <div class="col-md-1">

                                     </div>
                                     <div class="col-md-6" >
                                    <label class="col-sm-4 control-label">Customer</label>
                                    <div class="col-sm-8">
                                        <telerik:RadComboBox ID="dlCustomer" runat="server" Width="100%" DataSourceID="customerSource" MaxHeight="300" EmptyMessage="Select Customer" Filter="Contains"
                                           OnItemDataBound="dlCustomer_ItemDataBound" OnDataBound="dlCustomer_DataBound" OnItemsRequested="dlCustomer_ItemsRequested" EnableLoadOnDemand="true"
                                            OnClientItemsRequested="UpdateCustomerItemCountField" HighlightTemplatedItems="true" MarkFirstMatch="true"  >
                                            <HeaderTemplate>
                <ul>
                    <li class="ncol2">Customer Name</li>
                    <li class="ncol1">Id</li>
                </ul>
            </HeaderTemplate>
            <ItemTemplate>
                <ul>
                    <li class="ncol2">
                        <%# DataBinder.Eval(Container.DataItem, "CustomerName")%></li>
                    <li class="ncol1">
                        <%# DataBinder.Eval(Container.DataItem, "Id")%></li>
                </ul>
            </ItemTemplate>
            <FooterTemplate>
                A total of
                <asp:Literal runat="server" ID="customerCount" />
                items
            </FooterTemplate>
                                        </telerik:RadComboBox>
                                        <asp:SqlDataSource ID="customerSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT top (30) Id, CustomerName FROM [vwCustomers]">
                                        </asp:SqlDataSource>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dlCustomer" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                     </div>
                                      <%--<div class="col-md-4">
                                     <label>Type of Call</label>
                                    <telerik:RadDropDownList runat="server" ID="dlCallType" Width="100%" DefaultMessage="Select Call Type" >
                                        <Items>
                                            <telerik:DropDownListItem Text="Enquiry" />
                                        </Items>
                                    </telerik:RadDropDownList> 
                                 </div>--%>
                                    <%--<div class="col-md-3">
                                    <label>Start Date</label>
                                    <telerik:RadDatePicker runat="server" ID="dpStartDate" DateInput-ReadOnly="true" Width="100%"></telerik:RadDatePicker>
                                     <asp:RequiredFieldValidator runat="server" ControlToValidate="dpStartDate" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>--%>
                                <%--<div class="col-md-3">
                                     <label>End Date</label>
                                    <telerik:RadDatePicker runat="server" ID="dpEndDate" DateInput-ReadOnly="true" Width="100%"></telerik:RadDatePicker>
                                     <asp:RequiredFieldValidator runat="server" ControlToValidate="dpEndDate" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>--%>
                                     <div class="col-md-1">

                                     </div> 
                                 </div>
                                  
                             </div>
                            <div>
                              
                            </div>
                       </div>

                <div class="modal-footer">
                    
                    <asp:Button ID="btnGenerate" runat="server" Text="Generate Report" CssClass="btn btn-primary"  OnClick="btnGenerate_Click" />
                </div>
            </div>
                     </ContentTemplate>
                 </asp:UpdatePanel>

            </div><!-- /.box-body -->
         
          </div><!-- /.box -->

        <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
            function UpdateCustomerItemCountField(sender, args) {
                //Set the footer text.
                sender.get_dropDownElement().lastChild.innerHTML = "A total of " + sender.get_items().get_count() + " items";
            }
        </script>
    </telerik:RadScriptBlock>
</asp:Content>
