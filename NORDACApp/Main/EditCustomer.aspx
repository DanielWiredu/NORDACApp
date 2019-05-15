<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="EditCustomer.aspx.cs" Inherits="NORDACApp.Main.EditCustomer" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Edit Customer </h3>
              <%--<div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>--%>
            </div><!-- /.box-header -->
            <div class="box-body">
                
              <asp:UpdatePanel runat="server" >
                  <ContentTemplate>
                      <div class="row">
                            <div class="col-md-6">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Land Site</label>
                                    <div class="col-sm-8">
                                        <telerik:RadDropDownList ID="dlLandSite" runat="server" Width="100%" DataSourceID="landSiteSource" DataValueField="Id" DataTextField="LandSite"></telerik:RadDropDownList>
                                        <asp:SqlDataSource ID="landSiteSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Id, LandSite from tblLandSites"></asp:SqlDataSource>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Registration Date</label>
                                    <div class="col-sm-8">
                                        <telerik:RadDatePicker runat="server" ID="dpRegdate" Width="100%" DateInput-ReadOnly="true" MinDate="1/1/1850"></telerik:RadDatePicker>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dpRegdate" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Customer ID</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtCustomerId" runat="server" Width="100%" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Firstname</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtFirstname" runat="server" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstname" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Othernames</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtOthernames" runat="server" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtOthernames" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Date of Birth</label>
                                    <div class="col-sm-8">
                                        <telerik:RadDatePicker runat="server" ID="dpDateOfBirth" Width="100%" DateInput-ReadOnly="true" MinDate="1/1/1850"></telerik:RadDatePicker>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dpDateOfBirth" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Telephone 1</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtTelephone1" runat="server" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTelephone1" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Telephone 2</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtTelephone2" runat="server" Width="100%"></asp:TextBox>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Email Address</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtEmailAddress" runat="server" Width="100%" TextMode="Email"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmailAddress" Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
                                    
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Postal Address</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtPostalAddress" runat="server" Width="100%"></asp:TextBox>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Residential Address</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtResidentialAddress" runat="server" Width="100%"></asp:TextBox>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Initial Deposit</label>
                                    <div class="col-sm-8">
                                        <telerik:RadNumericTextBox ID="txtInitialDeposit" runat="server" Width="100%" Value="0"></telerik:RadNumericTextBox>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Payment Duration</label>
                                    <div class="col-sm-8">
                                        <telerik:RadDropDownList ID="dlPaymentDuration" runat="server" Width="100%" >
                                            <Items>
                                                <telerik:DropDownListItem Text="CASH" />
                                                <telerik:DropDownListItem Text="12 MONTHS" />
                                                <telerik:DropDownListItem Text="20 MONTHS" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Payment Plan</label>
                                    <div class="col-sm-8">
                                        <telerik:RadDropDownList ID="dlPaymentPlan" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="SALARY" />
                                                <telerik:DropDownListItem Text="LOAN" />
                                                <telerik:DropDownListItem Text="SAVINGS" />
                                                <telerik:DropDownListItem Text="OTHER" />
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Plot Number(s)</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtPlotNo" runat="server" Width="100%"></asp:TextBox>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Occupation</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtOccupation" runat="server" Width="100%"></asp:TextBox>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Referred By</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtReferredBy" runat="server" Width="100%"></asp:TextBox>
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <label class="col-sm-4 control-label">Remarks</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtRemarks" runat="server" Width="100%" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>

                      <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0" AutoPostBack="false" CausesValidation="false" >
                <Tabs>
                    <telerik:RadTab runat="server" Text="Products" Enabled="true" >
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Payments" Enabled="true">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
                      <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" RenderSelectedPageOnly="false" >
                                <telerik:RadPageView ID="pvProducts" runat="server" Height="100%">
                                    <hr />
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional" >
                    <ContentTemplate>
                        <telerik:RadGrid ID="productsGrid" DataSourceID="productSource" ShowFooter="true" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" AllowFilteringByColumn="False" AllowPaging="True" AllowSorting="True" CellSpacing="-1" GridLines="Both" OnItemInserted="productsGrid_ItemInserted" OnItemUpdated="productsGrid_ItemUpdated" OnItemDeleted="productsGrid_ItemDeleted" OnItemCreated="productsGrid_ItemCreated">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="200px"/>
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView DataKeyNames="Id" DataSourceID="productSource" CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="Add Product" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" EditMode="InPlace">
                                    <RowIndicatorColumn Visible="false"></RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True"></ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridTemplateColumn HeaderText="ProductType" DataField="ProductTypeId" SortExpression="ProductTypeId" FilterControlAltText="Filter ProductTypeId column" UniqueName="ProductTypeId">
                                                <ItemTemplate>
                                                     <%#DataBinder.Eval(Container.DataItem, "ProductType")%>
                                                    </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="dlProductType" runat="server" DataSourceID="productTypeSource" DataValueField="Id" DataTextField="ProductType" SelectedValue='<%#Bind("ProductTypeId") %>' AppendDataBoundItems="true">
                                                    <asp:ListItem Selected="True" Text="Select" Value="">
                                                            </asp:ListItem>    
                                                    </asp:DropDownList>    
                                            </EditItemTemplate>
                                            <HeaderStyle Width="100px" />
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridNumericColumn Aggregate="Sum" DataField="Quantity" DataType="System.Int32" FilterControlAltText="Filter Quantity column" HeaderText="Quantity" SortExpression="Quantity" UniqueName="Quantity" DecimalDigits="0" DefaultInsertValue="0" EmptyDataText="0">
                                        <ColumnValidationSettings EnableRequiredFieldValidation="true">
                                            <RequiredFieldValidator Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></RequiredFieldValidator>
                                        </ColumnValidationSettings>
                                            <HeaderStyle Width="100px" />
                                        </telerik:GridNumericColumn>
                                         <telerik:GridNumericColumn DataField="UnitPrice" DataType="System.Double" FilterControlAltText="Filter UnitPrice column" HeaderText="UnitPrice" SortExpression="UnitPrice" UniqueName="UnitPrice" DecimalDigits="2" DefaultInsertValue="0.00" EmptyDataText="0.00" DataFormatString="{0:N2}">
                                         <HeaderStyle Width="100px" />
                                         </telerik:GridNumericColumn>
                                        <telerik:GridNumericColumn Aggregate="Sum" ReadOnly="true" DataField="Amount" DataType="System.Double" FilterControlAltText="Filter Amount column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" DecimalDigits="2" DataFormatString="{0:N2}">
                                         <HeaderStyle Width="100px" />
                                        </telerik:GridNumericColumn>
                                         <telerik:GridTemplateColumn AllowFiltering="false"> 
                                         <ItemTemplate>
                                            <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn-info" /> 
                                          </ItemTemplate> 
                                        <EditItemTemplate > 
                                            <asp:Button ID="btnUpdate" runat="server" CommandName='<%# (Container is GridDataInsertItem) ? "PerformInsert" : "Update" %>' Text='<%# (Container is GridDataInsertItem) ? "Save" : "Update" %>' CssClass="btn-primary" /> 
                                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn-warning" /> 
                                        </EditItemTemplate>
                                            <HeaderStyle Width="80px" />
                                        </telerik:GridTemplateColumn> 
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" UniqueName="Delete" ConfirmText="Delete Record?" ButtonType="PushButton" ButtonCssClass="btn-danger">
                                        <HeaderStyle Width="70px" />
                                    </telerik:GridButtonColumn>
                                    </Columns>
                                </MasterTableView>
                        </telerik:RadGrid>
                         <asp:SqlDataSource ID="productTypeSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Id, ProductType from tblProductTypes"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="productSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM tblCustomerProducts WHERE (Id = @Id)" InsertCommand="spAddCustomerProduct" InsertCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Id, ProductTypeId, ProductType, Quantity, UnitPrice, Amount from vwCustomerProducts WHERE (CustomerId = @CustomerId)" UpdateCommand="UPDATE tblCustomerProducts SET UnitPrice = @UnitPrice, Quantity = @Quantity WHERE (Id = @Id)">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter Name="CustomerId" Type="Int32" ControlID="txtCustomerId" PropertyName="Text" DefaultValue="0" />
                                    <asp:Parameter Name="ProductTypeId" Type="Int32"  />
                                    <asp:Parameter Name="Quantity" Type="Int32" />
                                    <asp:Parameter Name="UnitPrice" Type="Double" />
                                    <asp:CookieParameter Name="CreatedBy" CookieName="LoginUser" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter Name="CustomerId" Type="Int32" ControlID="txtCustomerId" PropertyName="Text" DefaultValue="0" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="UnitPrice" Type="Double" />
                                    <asp:Parameter Name="Quantity" Type="Int32" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
                                </telerik:RadPageView>
                                <telerik:RadPageView ID="pvPayments" runat="server" Height="100%">
                                    <hr />
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional" >
                    <ContentTemplate>

                        <telerik:RadGrid ID="paymentGrid" DataSourceID="paymentSource" ShowFooter="true" runat="server" AutoGenerateColumns="False" GroupPanelPosition="Top" AllowFilteringByColumn="False" AllowPaging="True" AllowSorting="True" CellSpacing="-1" GridLines="Both" OnItemCommand="paymentGrid_ItemCommand">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" ScrollHeight="200px"/>
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView DataKeyNames="Id" DataSourceID="paymentSource" CommandItemDisplay="Top" CommandItemSettings-AddNewRecordText="Add Payment" EditMode="InPlace">
                                    <RowIndicatorColumn Visible="false"></RowIndicatorColumn>
                                    <ExpandCollapseColumn Created="True"></ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter Id column" HeaderText="Id" SortExpression="Id" UniqueName="Id" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px" Display="false" ReadOnly="true">
                                        <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                        <telerik:GridDateTimeColumn DataField="PaymentDate" DataType="System.DateTime" FilterControlAltText="Filter PaymentDate column" HeaderText="PaymentDate" SortExpression="PaymentDate" UniqueName="PaymentDate" DataFormatString="{0:dd-MMM-yyyy}">
                                         <ColumnValidationSettings EnableRequiredFieldValidation="true">
                                            <RequiredFieldValidator Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></RequiredFieldValidator>
                                        </ColumnValidationSettings>
                                             <HeaderStyle Width="120px" />
                                         </telerik:GridDateTimeColumn>
                                        <telerik:GridBoundColumn DataField="PaymentMode" FilterControlAltText="Filter PaymentMode column" HeaderText="PaymentMode" SortExpression="PaymentMode" UniqueName="PaymentMode" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="100px" MaxLength="50" EmptyDataText="">
                                    <HeaderStyle Width="120px" />
                                    </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ChequeNo" FilterControlAltText="Filter ChequeNo column" HeaderText="ChequeNo" SortExpression="ChequeNo" UniqueName="ChequeNo" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="100px" MaxLength="50" EmptyDataText="">
                                    <HeaderStyle Width="120px" />
                                    </telerik:GridBoundColumn>
                                        <telerik:GridNumericColumn Aggregate="Sum" DataField="Amount" DataType="System.Double" FilterControlAltText="Filter Amount column" HeaderText="Amount" SortExpression="Amount" UniqueName="Amount" DefaultInsertValue="0" EmptyDataText="0.00" DataFormatString="{0:N2}">
                                        <ColumnValidationSettings EnableRequiredFieldValidation="true">
                                            <RequiredFieldValidator Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="true" ForeColor="Red"></RequiredFieldValidator>
                                        </ColumnValidationSettings>
                                            <HeaderStyle Width="100px" />
                                        </telerik:GridNumericColumn>
                                         <telerik:GridTemplateColumn AllowFiltering="false"> 
                                         <ItemTemplate>
                                            <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn-info" /> 
                                          </ItemTemplate> 
                                        <EditItemTemplate > 
                                            <asp:Button ID="btnUpdate" runat="server" CommandName='<%# (Container is GridDataInsertItem) ? "PerformInsert" : "Update" %>' Text='<%# (Container is GridDataInsertItem) ? "Save" : "Update" %>' CssClass="btn-primary" /> 
                                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn-warning" /> 
                                        </EditItemTemplate>
                                            <HeaderStyle Width="80px" />
                                        </telerik:GridTemplateColumn> 
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" UniqueName="Delete" ConfirmText="Delete Record?" ButtonType="PushButton" ButtonCssClass="btn-danger">
                                        <HeaderStyle Width="70px" />
                                    </telerik:GridButtonColumn>
                                    </Columns>
                                </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="paymentSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM tblPayments WHERE (Id = @Id)" InsertCommand="INSERT INTO tblPayments(CustomerId, PaymentDate, PaymentMode, Amount, CreatedBy) VALUES(@CustomerId, @PaymentDate, @PaymentMode, @Amount, @CreatedBy)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Id, PaymentDate, PaymentMode, ChequeNo, Amount from tblPayments WHERE (CustomerId = @CustomerId)" UpdateCommand="UPDATE tblPayments SET PaymentDate = @PaymentDate, PaymentMode = @PaymentMode, Amount = @Amount WHERE (Id = @Id)">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter Name="CustomerId" Type="Int32" ControlID="txtCustomerId" PropertyName="Text" DefaultValue="0" />
                                    <asp:Parameter Name="PaymentDate" Type="DateTime" />
                                    <asp:Parameter Name="PaymentMode" Type="String" />
                                    <asp:Parameter Name="Amount" Type="Double" />
                                    <asp:CookieParameter Name="CreatedBy" CookieName="LoginUser" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter Name="CustomerId" Type="Int32" ControlID="txtCustomerId" PropertyName="Text" DefaultValue="0" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="PaymentDate" Type="DateTime" />
                                    <asp:Parameter Name="PaymentMode" Type="String" />
                                    <asp:Parameter Name="Amount" Type="Double" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
                                </telerik:RadPageView>
                            </telerik:RadMultiPage>

                        <div class="modal-footer">
                            <asp:Button runat="server" ID="btnReturn" Text="Return" CssClass="btn btn-warning" CausesValidation="false" PostBackUrl="~/Main/Customers.aspx"/>
                            <%--<asp:Button runat="server" ID="btnPrint" Text="Print" CssClass="btn btn-info" OnClick="btnPrint_Click" CausesValidation="false" Enabled="false" />--%>
                            <asp:Button runat="server" ID="btnUpdate" Text="Update" CssClass="btn btn-success" OnClick="btnUpdate_Click" />
                        </div> 
                  </ContentTemplate>
              </asp:UpdatePanel>

            </div><!-- /.box-body -->
         
          </div><!-- /.box --> 

    <!-- new modal -->
         <div class="modal fade" id="newmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">New </h4>
                </div>
                        <div class="modal-body">
                            <div class="form-group">
                                  <label>Payment Date</label>
                                  <telerik:RadDatePicker runat="server" ID="dpPaymentDate" Width="100%" DateInput-ReadOnly="true" MinDate="1/1/1850"></telerik:RadDatePicker>
                                  <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpPaymentDate" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                             </div>
                            <div class="form-group">
                                  <label>Payment Mode</label>
                                  <telerik:RadDropDownList ID="dlPaymentMode" runat="server" Width="100%" OnItemSelected="dlPaymentMode_ItemSelected" AutoPostBack="true" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Cash" />
                                                <telerik:DropDownListItem Text="Cheque" />
                                                <telerik:DropDownListItem Text="Bank Deposit" />
                                                <telerik:DropDownListItem Text="Direct Debit" />
                                                <telerik:DropDownListItem Text="Mobile Money" />
                                            </Items>
                                        </telerik:RadDropDownList>
                             </div>
                             <div class="form-group">
                                  <label>Cheque No</label>
                                  <asp:TextBox runat="server" ID="txtChequeno" Width="100%" Enabled="false"></asp:TextBox>
                             </div>
                            <div class="form-group">
                                  <label>Amount</label>
                                <telerik:RadNumericTextBox runat="server" ID="txtAmount" Width="100%" Value="0"></telerik:RadNumericTextBox>
                                  <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtAmount" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                             </div>
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnSavePayment" runat="server" Text="Save" CssClass="btn btn-success" ValidationGroup="new" OnClick="btnSavePayment_Click" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

    <!-- edit modal -->
         <div class="modal fade" id="editmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Edit </h4>
                </div>
                        <div class="modal-body">
                            <div class="form-group">
                                  <label>Payment Date</label>
                                  <telerik:RadDatePicker runat="server" ID="dpPaymentDate1" Width="100%" DateInput-ReadOnly="true" MinDate="1/1/1850"></telerik:RadDatePicker>
                                  <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="dpPaymentDate1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="edit"></asp:RequiredFieldValidator>
                             </div>
                            <div class="form-group">
                                  <label>Payment Mode</label>
                                  <telerik:RadDropDownList ID="dlPaymentMode1" runat="server" Width="100%" OnItemSelected="dlPaymentMode1_ItemSelected" AutoPostBack="true" >
                                            <Items>
                                                <telerik:DropDownListItem Text="Cash" />
                                                <telerik:DropDownListItem Text="Cheque" />
                                                <telerik:DropDownListItem Text="Bank Deposit" />
                                                <telerik:DropDownListItem Text="Direct Debit" />
                                                <telerik:DropDownListItem Text="Mobile Money" />
                                            </Items>
                                        </telerik:RadDropDownList>
                             </div>
                             <div class="form-group">
                                  <label>Cheque No</label>
                                  <asp:TextBox runat="server" ID="txtChequeno1" Width="100%" Enabled="false"></asp:TextBox>
                             </div>
                            <div class="form-group">
                                  <label>Amount</label>
                                <telerik:RadNumericTextBox runat="server" ID="txtAmount1" Width="100%" Value="0"></telerik:RadNumericTextBox>
                                  <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtAmount1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="edit"></asp:RequiredFieldValidator>
                             </div>
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnUpdatePayment" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="edit" OnClick="btnUpdatePayment_Click" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

        <script type="text/javascript">
            function newModal() {
                $('#newmodal').modal('show');
            }
            function closenewModal() {
                $('#newmodal').modal('hide');
            }
            function editModal() {
                $('#editmodal').modal('show');
            }
            function closeeditModal() {
                $('#editmodal').modal('hide');
            }
    </script>
</asp:Content>
