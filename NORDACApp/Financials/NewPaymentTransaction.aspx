<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="NewPaymentTransaction.aspx.cs" Inherits="NORDACApp.Financials.NewPaymentTransaction" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">New Transaction </h3>
              <%--<div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>--%>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <div class="form-group">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>PV No</label>
                                        <asp:TextBox runat="server" ID="txtPVNo" Width="100%" Enabled="false"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                                <label>Payment Date</label>
                                       <telerik:RadDatePicker runat="server" ID="dpPaydate" Width="100%" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpPaydate" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        </div>
                                    <div class="col-md-4">
                                        <label>Payee</label>
                                        <asp:TextBox runat="server" ID="txtPayee" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtPayee" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                    
                                </div>
                            </div>
                             <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                        <label>Description</label>
                                        <telerik:RadDropDownList runat="server" ID="dlDescription" Width="100%" DefaultMessage="Select Description" DataSourceID="descriptionSource" DataTextField="Description" DataValueField="Id"></telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dlDescription" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <asp:SqlDataSource ID="descriptionSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Description] FROM [tblTransactionTypes] WHERE [TransactionType] = @Transtype">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="Transtype" QueryStringField="tt" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                        <div class="col-md-4">
                                        <label>Paymode</label>
                                        <telerik:RadDropDownList ID="dlPaymode" runat="server" Width="100%" AutoPostBack="true" OnItemSelected="dlPaymode_ItemSelected" CausesValidation="false">
                                            <Items>
                                                <telerik:DropDownListItem Text="Cash" />
                                                <telerik:DropDownListItem Text="Cheque" />
                                                <telerik:DropDownListItem Text="Mobile Money" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                        
                                 <div class="col-md-4">
                               <label>Amount</label>
                                <telerik:RadNumericTextBox runat="server" ID="txtAmount" MinValue="0" ShowSpinButtons="true" Width="100%" Value="0"></telerik:RadNumericTextBox>
                                <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtAmount" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                            </div>
                                      
                                    </div>
                             </div>
                            <div class="form-group">
                                <div class="row">
                                     <div class="col-md-4">
                                        <label>Bank</label>
                                        <telerik:RadDropDownList runat="server" ID="dlBank" Width="100%" DefaultMessage="Select Bank" DataSourceID="bankSource" DataTextField="Bankname" DataValueField="Id" Enabled="false"></telerik:RadDropDownList>
                                        <asp:SqlDataSource ID="bankSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Bankname] FROM [tblBanks]"></asp:SqlDataSource>
                                    </div>
                                      <div class="col-md-4">
                                        <label>Cheque No.</label>
                                         <asp:TextBox runat="server" ID="txtChequeno" Width="100%" Enabled="false"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                           <label>Received By</label>
                                            <asp:TextBox runat="server" ID="txtReceivedBy" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtReceivedBy" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        </div>
                                </div>
                            </div>
                              <div class="form-group">
                                            <label>Remarks</label>
                                            <asp:TextBox runat="server" ID="txtRemarks" Width="100%"></asp:TextBox>
                                        </div>

                        <div class="modal-footer">
                    <asp:Button ID="btnReturn" runat="server" Text="Return" CssClass="btn btn-warning" CausesValidation="false" PostBackUrl="~/Financials/PaymentTransactions.aspx" />
                     <asp:Button ID="btnAddNew" runat="server" Text="Add New" CssClass="btn btn-danger" CausesValidation="false" OnClick="btnAddNew_Click" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box --> 
</asp:Content>
