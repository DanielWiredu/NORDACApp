<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="vwProductPayments.aspx.cs" Inherits="NORDACApp.Reports.vwProductPayments" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Customer Payments </h3>
              <%--<div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>--%>
            </div><!-- /.box-header -->
            <div class="box-body">
                <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                        <div class="row">
                                        <div class="col-sm-4 pull-right" style="width:inherit">
                                           <asp:Button runat="server" ID="btnExcelExport" CssClass="btn btn-success" Text="Excel" CausesValidation="false" OnClick="btnExcelExport_Click"/>
                                            <asp:Button runat="server" ID="btnPDFExport" CssClass="btn btn-warning" Text="PDF" CausesValidation="false" OnClick="btnPDFExport_Click"/>
                                        </div>
                                        <div class="col-sm-8 pull-left">
                                            <div class="toolbar-btn-action">
                                                <telerik:RadDropDownList ID="dlLandSite" runat="server" DataSourceID="landSiteSource" DataValueField="Id" DataTextField="LandSite" AutoPostBack="true" OnSelectedIndexChanged="dlLandSite_SelectedIndexChanged"></telerik:RadDropDownList>
                                        <asp:SqlDataSource ID="landSiteSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Id, LandSite from tblLandSites"></asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                        <hr />
                        <telerik:RadGrid ID="paymentGrid" DataSourceID="paymentSource" ShowFooter="true" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" CellSpacing="-1" GridLines="Both">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="400px"/>
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView DataKeyNames="Id" DataSourceID="paymentSource" CommandItemDisplay="None" EditMode="InPlace" PageSize="100">
                                    <RowIndicatorColumn Visible="false"></RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True"></ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Firstname" FilterControlAltText="Filter Firstname column" HeaderText="Firstname" SortExpression="Firstname" UniqueName="Firstname" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px" MaxLength="50">
                                    <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Othernames" FilterControlAltText="Filter Othernames column" HeaderText="Othernames" SortExpression="Othernames" UniqueName="Othernames" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px" MaxLength="50">
                                    <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                        <telerik:GridDateTimeColumn DataField="PaymentDate" DataType="System.DateTime" FilterControlAltText="Filter PaymentDate column" HeaderText="PaymentDate" SortExpression="PaymentDate" UniqueName="PaymentDate" DataFormatString="{0:dd-MMM-yyyy}">
                                             <HeaderStyle Width="130px" />
                                         </telerik:GridDateTimeColumn>
                                        <telerik:GridBoundColumn DataField="PaymentMode" FilterControlAltText="Filter PaymentMode column" HeaderText="PaymentMode" SortExpression="PaymentMode" UniqueName="PaymentMode" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px" MaxLength="50">
                                    <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                        <telerik:GridNumericColumn Aggregate="Sum" DataField="Amount" DataType="System.Double" FilterControlAltText="Filter Amount column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" DefaultInsertValue="0" EmptyDataText="0.00" DataFormatString="{0:N2}" FilterControlWidth="80px" ShowFilterIcon="false">
                                            <HeaderStyle Width="100px" />
                                        </telerik:GridNumericColumn>
                                       <%-- <telerik:GridNumericColumn DataField="ProductsAmount" DataType="System.Double" FilterControlAltText="Filter ProductsAmount column" HeaderText="Products Total" SortExpression="ProductsAmount" UniqueName="ProductsAmount" DefaultInsertValue="0" EmptyDataText="0.00" DataFormatString="{0:N2}" FilterControlWidth="80px" ShowFilterIcon="false">
                                            <HeaderStyle Width="100px" />
                                        </telerik:GridNumericColumn>
                                        <telerik:GridNumericColumn DataField="AmountPaid" DataType="System.Double" FilterControlAltText="Filter AmountPaid column" HeaderText="Total Paid" SortExpression="AmountPaid" UniqueName="AmountPaid" DefaultInsertValue="0" EmptyDataText="0.00" DataFormatString="{0:N2}" FilterControlWidth="80px" ShowFilterIcon="false">
                                            <HeaderStyle Width="100px" />
                                        </telerik:GridNumericColumn>
                                        <telerik:GridNumericColumn DataField="ProductsBalance" DataType="System.Double" FilterControlAltText="Filter ProductsBalance column" HeaderText="Balance" SortExpression="ProductsBalance" UniqueName="ProductsBalance" DefaultInsertValue="0" EmptyDataText="0.00" DataFormatString="{0:N2}" FilterControlWidth="80px" ShowFilterIcon="false">
                                            <HeaderStyle Width="100px" />
                                        </telerik:GridNumericColumn>--%>
                                    </Columns>
                                </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="paymentSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Id, CustomerId, Firstname, Othernames, PaymentDate, PaymentMode, Amount from vwCustomerPayments WHERE LandSiteId = @LandSiteId">
                        <SelectParameters>
                                <asp:ControlParameter ControlID="dlLandSite" Name="LandSiteId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>    
                        </asp:SqlDataSource>
                    </ContentTemplate>
                    <Triggers>
                                  <asp:PostBackTrigger ControlID="btnExcelExport" />
                                  <asp:PostBackTrigger ControlID="btnPDFExport" />
                              </Triggers>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box --> 
</asp:Content>
