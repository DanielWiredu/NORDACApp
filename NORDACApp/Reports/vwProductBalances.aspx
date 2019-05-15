<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="vwProductBalances.aspx.cs" Inherits="NORDACApp.Reports.vwProductBalances" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Customer Balances </h3>
              <%--<div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>--%>
            </div><!-- /.box-header -->
            <div class="box-body">
                
              <asp:UpdatePanel runat="server" UpdateMode="Conditional" >
                    <ContentTemplate>
                        <div class="row">
                                        <div class="col-sm-4 pull-right" style="width:inherit">
                                           <asp:Button runat="server" ID="btnExcelExport" CssClass="btn-success" Text="Excel" CausesValidation="false" OnClick="btnExcelExport_Click"/>
                                            <%--<asp:Button runat="server" ID="btnPDFExport" CssClass="btn btn-warning" Text="PDF" CausesValidation="false" OnClick="btnPDFExport_Click"/>--%>
                                        </div>
                                        <div class="col-sm-8 pull-left">
                                            <div class="toolbar-btn-action">
                                                <telerik:RadDropDownList ID="dlLandSite" runat="server" DataSourceID="landSiteSource" DataValueField="Id" DataTextField="LandSite" AutoPostBack="true" OnSelectedIndexChanged="dlLandSite_SelectedIndexChanged"></telerik:RadDropDownList>
                                        <asp:SqlDataSource ID="landSiteSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Id, LandSite from tblLandSites"></asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                        <hr />
                             <telerik:RadGrid ID="customersGrid" runat="server" ShowFooter="true" AutoGenerateColumns="False" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" CellSpacing="-1" GridLines="Both" DataSourceID="customerSource" >
                            <ClientSettings>
                                <%--<ClientEvents OnRowDblClick="RowDblClick" />--%>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="400px" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                                 <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="customers_list" HideStructureColumns="true"  >
                                        <Pdf AllowPrinting="true" AllowCopy="true" PaperSize="Letter" PageTitle="Customers List" PageWidth="1250"></Pdf>
                                    </ExportSettings>
                                 <MasterTableView DataKeyNames="ID" DataSourceID="customerSource" PageSize="100">
                                     <Columns>
                                         <telerik:GridBoundColumn DataField="ID" Aggregate="Count" FooterText="Total: " FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="60px">
                                         <HeaderStyle Width="80px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="CustomerName" FilterControlAltText="Filter CustomerName column" HeaderText="CustomerName" SortExpression="CustomerName" UniqueName="CustomerName" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="140px">
                                         <HeaderStyle Width="180px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridDateTimeColumn DataField="RegistrationDate" DataType="System.DateTime" FilterControlAltText="Filter RegistrationDate column" HeaderText="RegistrationDate" SortExpression="RegistrationDate" UniqueName="RegistrationDate" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px" DataFormatString="{0:dd-MMM-yyyy}">
                                           <HeaderStyle Width="140px" />
                                           </telerik:GridDateTimeColumn>
                                         <telerik:GridBoundColumn DataField="EmailAddress" FilterControlAltText="Filter EmailAddress column" HeaderText="EmailAddress" SortExpression="EmailAddress" UniqueName="EmailAddress" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="110px">
                                         <HeaderStyle Width="150px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="Telephone1" FilterControlAltText="Filter Telephone1 column" HeaderText="Telephone1" SortExpression="Telephone1" UniqueName="Telephone1" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="110px">
                                         <HeaderStyle Width="140px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridNumericColumn DataField="ProductsAmount" Aggregate="Sum" DataType="System.Double" FilterControlAltText="Filter ProductsAmount column" HeaderText="Products Total" SortExpression="ProductsAmount" UniqueName="ProductsAmount" DefaultInsertValue="0" EmptyDataText="0.00" DataFormatString="{0:N2}" FilterControlWidth="80px" ShowFilterIcon="false">
                                            <HeaderStyle Width="100px" />
                                        </telerik:GridNumericColumn>
                                        <telerik:GridNumericColumn DataField="AmountPaid" Aggregate="Sum" DataType="System.Double" FilterControlAltText="Filter AmountPaid column" HeaderText="Total Paid" SortExpression="AmountPaid" UniqueName="AmountPaid" DefaultInsertValue="0" EmptyDataText="0.00" DataFormatString="{0:N2}" FilterControlWidth="80px" ShowFilterIcon="false">
                                            <HeaderStyle Width="100px" />
                                        </telerik:GridNumericColumn>
                                        <telerik:GridNumericColumn DataField="ProductsBalance" Aggregate="Sum" DataType="System.Double" FilterControlAltText="Filter ProductsBalance column" HeaderText="Balance" SortExpression="ProductsBalance" UniqueName="ProductsBalance" DefaultInsertValue="0" EmptyDataText="0.00" DataFormatString="{0:N2}" FilterControlWidth="80px" ShowFilterIcon="false">
                                            <HeaderStyle Width="100px" />
                                        </telerik:GridNumericColumn>
                                     </Columns>
                                 </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="customerSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ID], [CustomerName], [RegistrationDate], [EmailAddress], [Telephone1], ProductsAmount, AmountPaid, ProductsBalance  FROM [vwCustomers] WHERE LandSiteId = @LandSiteId">
                        <SelectParameters>
                                <asp:ControlParameter ControlID="dlLandSite" Name="LandSiteId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                             <Triggers>
                                  <asp:PostBackTrigger ControlID="btnExcelExport" />
                                  <%--<asp:PostBackTrigger ControlID="btnPDFExport" />--%>
                              </Triggers>
                </asp:UpdatePanel>

            </div><!-- /.box-body -->
         
          </div><!-- /.box --> 
</asp:Content>
