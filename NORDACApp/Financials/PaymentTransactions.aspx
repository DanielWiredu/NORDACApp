<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="PaymentTransactions.aspx.cs" Inherits="NORDACApp.Financials.PaymentTransactions" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Payment Transactions </h3>
              <%--<div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>--%>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <div class="row">
                                        <div class="col-sm-4 pull-right">
                                           <asp:TextBox runat="server" ID="txtSearch" Width="100%" placeholder="PV No / Payee....." OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-8 pull-left">
                                            <div class="toolbar-btn-action">
                                                <asp:Button runat="server" ID="btnAddIncome" CssClass="btn btn-primary" Text="Add Income" CausesValidation="false" PostBackUrl="~/Financials/NewPaymentTransaction.aspx?tt=Income" />  
                                                <asp:Button runat="server" ID="btnAddExpense" CssClass="btn btn-warning" Text="Add Expense" CausesValidation="false" PostBackUrl="~/Financials/NewPaymentTransaction.aspx?tt=Expense" />  
                                            </div>
                                        </div>
                                    </div>
                        <hr />
                       <telerik:RadGrid ID="transactionGrid" runat="server" AutoGenerateColumns="False" DataSourceID="transactionSource" GroupPanelPosition="Top" AllowFilteringByColumn="False" AllowPaging="True" AllowSorting="True" OnItemCommand="transactionGrid_ItemCommand" OnItemDeleted="transactionGrid_ItemDeleted">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                                <MasterTableView DataKeyNames="ID" DataSourceID="transactionSource" AllowAutomaticDeletes="true" CommandItemDisplay="None" CommandItemSettings-AddNewRecordText="Add New Transaction Type">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="ID" FilterControlAltText="Filter ID column" HeaderText="ID" SortExpression="ID" UniqueName="ID" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="100px" Display="false">
                                        <HeaderStyle Width="60px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PvNo" HeaderText="PvNo" SortExpression="PvNo" UniqueName="PvNo">
                                    <HeaderStyle Width="80px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PayDate" HeaderText="PayDate" SortExpression="PayDate" UniqueName="PayDate" DataType="System.DateTime" DataFormatString="{0:dd-MMM-yyyy}">
                                    <HeaderStyle Width="120px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Payee" HeaderText="Payee" SortExpression="Payee" UniqueName="Payee">
                                    <HeaderStyle Width="180px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Description" HeaderText="Description" SortExpression="Description" UniqueName="Description">
                                    <HeaderStyle Width="200px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn Display="false" DataField="TransactionType" HeaderText="TransactionType" SortExpression="TransactionType" UniqueName="TransactionType">
                                    <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PayMode" HeaderText="PayMode" SortExpression="PayMode" UniqueName="PayMode">
                                    <HeaderStyle Width="80px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Amount" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" DataFormatString="{0:N2}">
                                    <HeaderStyle Width="80px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Edit" ButtonCssClass="btn-info" Text="Edit">
                                        <HeaderStyle Width="50px" />
                                    </telerik:GridButtonColumn>
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" UniqueName="Delete" ConfirmText="Delete Record?" ButtonType="PushButton" ButtonCssClass="btn-danger">
                                        <HeaderStyle Width="60px" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="transactionSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT top(100) Id, PvNo, PayDate, Payee, Description, TransactionType, PayMode, Amount FROM [vwPaymentTransactions] WHERE (PvNo LIKE '%' + @SearchValue + '%' OR Payee LIKE '%' + @SearchValue + '%') ORDER BY [Id] DESC" DeleteCommand="DELETE FROM [tblPaymentTransactions] WHERE [ID] = @ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter Name="SearchValue" ControlID="txtSearch" Type="String" PropertyName="Text" ConvertEmptyStringToNull="false" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box --> 
</asp:Content>
