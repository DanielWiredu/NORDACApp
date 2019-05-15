<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Debtors.aspx.cs" Inherits="NORDACApp.Main.Debtors" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Debtors </h3>
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
                                                <%--<asp:Button runat="server" ID="btnAddNew" CssClass="btn btn-primary" Text="Add Customer" CausesValidation="false" PostBackUrl="~/Main/NewCustomer.aspx" />--%> 
                                                
                                                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%> 
                                                
                                                <telerik:RadDropDownList ID="dlLandSite" runat="server" DataSourceID="landSiteSource" DataValueField="Id" DataTextField="LandSite" AutoPostBack="true" OnSelectedIndexChanged="dlLandSite_SelectedIndexChanged"></telerik:RadDropDownList>
                                        <asp:SqlDataSource ID="landSiteSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Id, LandSite from tblLandSites"></asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                        <hr />
                             <telerik:RadGrid ID="debtorsGrid" runat="server" ShowFooter="true" AutoGenerateColumns="False" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" CellSpacing="-1" GridLines="Both" DataSourceID="debtorSource">
                            <ClientSettings>
                                <%--<ClientEvents OnRowDblClick="RowDblClick" />--%>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="400px" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                                 <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="debtors_list" HideStructureColumns="true"  >
                                        <Pdf AllowPrinting="true" AllowCopy="true" PaperSize="Letter" PageTitle="Debtors List" PageWidth="1250"></Pdf>
                                    </ExportSettings>

                                 <MasterTableView DataKeyNames="CustomerId" DataSourceID="debtorSource" PageSize="100">
                                     <Columns>
                                         <%--<telerik:GridButtonColumn ButtonType="PushButton" CommandName="Edit" ButtonCssClass="btn-info" Text="Edit" Exportable="false">
                                        <HeaderStyle Width="50px" />
                                        </telerik:GridButtonColumn>--%>
                                         <telerik:GridBoundColumn DataField="CustomerId" Aggregate="Count" FooterText="Total: " FilterControlAltText="Filter CustomerId column" HeaderText="CustomerId" ReadOnly="True" SortExpression="CustomerId" UniqueName="CustomerId" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px">
                                         <HeaderStyle Width="120px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="Firstname" FilterControlAltText="Filter Firstname column" HeaderText="Firstname" SortExpression="Firstname" UniqueName="Firstname" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px">
                                         <HeaderStyle Width="150px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="Othernames" FilterControlAltText="Filter Othernames column" HeaderText="Othernames" SortExpression="Othernames" UniqueName="Othernames" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="140px">
                                         <HeaderStyle Width="180px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn DataField="Telephone1" FilterControlAltText="Filter Telephone1 column" HeaderText="Telephone1" SortExpression="Telephone1" UniqueName="Telephone1" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="110px">
                                         <HeaderStyle Width="140px" />
                                         </telerik:GridBoundColumn>
                                         <telerik:GridDateTimeColumn DataField="lastPaymentDate" DataType="System.DateTime" FilterControlAltText="Filter lastPaymentDate column" HeaderText="LastPaymentDate" SortExpression="lastPaymentDate" UniqueName="lastPaymentDate" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px" DataFormatString="{0:dd-MMM-yyyy}">
                                           <HeaderStyle Width="140px" />
                                           </telerik:GridDateTimeColumn>
                                     </Columns>
                                 </MasterTableView>

                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="debtorSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [vwCustomerLastPayment] WHERE LandSiteId = @LandSiteId and datediff(D,lastPaymentDate,getdate()) >= 30">
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
