<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ProductTypes.aspx.cs" Inherits="NORDACApp.Setups.ProductTypes" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Product Types </h3>
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
                                                <asp:Button runat="server" ID="btnAdd" CssClass="btn btn-primary" Text="Add New" CausesValidation="false" OnClientClick="newModal()" />  
                                            </div>
                                        </div>
                                    </div>
                        <hr />
                        <telerik:RadGrid ID="productTypeGrid" runat="server" AutoGenerateColumns="False" DataSourceID="productTypeSource" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" OnItemDeleted="productTypeGrid_ItemDeleted" OnItemCommand="productTypeGrid_ItemCommand">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="producttype_list" HideStructureColumns="true"  >
                                        <Pdf AllowPrinting="true" AllowCopy="true" PaperSize="Letter" PageTitle="Product Type List" PageWidth="500"></Pdf>
                                    </ExportSettings>
                            <MasterTableView DataKeyNames="Id" DataSourceID="productTypeSource" AllowAutomaticDeletes="true" CommandItemDisplay="None" CommandItemSettings-AddNewRecordText="Add New Category">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter Id column" HeaderText="Id" SortExpression="Id" UniqueName="Id" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px" Display="false" ReadOnly="true">
                                        <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ProductType" FilterControlAltText="Filter ProductType column" HeaderText="ProductType" SortExpression="ProductType" UniqueName="ProductType" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="250px" MaxLength="50">
                                    <HeaderStyle Width="300px" />
                                         <ColumnValidationSettings EnableRequiredFieldValidation="True">
                                            <RequiredFieldValidator ForeColor="Red" ErrorMessage="Required Field" SetFocusOnError="true" Display="Dynamic"></RequiredFieldValidator>
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridNumericColumn DataField="UnitPrice" DataType="System.Double" FilterControlAltText="Filter UnitPrice column" HeaderText="UnitPrice" SortExpression="UnitPrice" UniqueName="UnitPrice" DecimalDigits="2" DefaultInsertValue="0.00" EmptyDataText="0.00" DataFormatString="{0:N2}" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px">
                                         <HeaderStyle Width="100px" />
                                         </telerik:GridNumericColumn>
                                    <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Edit" ButtonCssClass="btn-info" Text="Edit" Exportable="false">
                                        <HeaderStyle Width="40px" />
                                    </telerik:GridButtonColumn>
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" UniqueName="Delete" ConfirmText="Delete Record?" ButtonType="PushButton" ButtonCssClass="btn-danger" Exportable="false">
                                        <HeaderStyle Width="50px" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="productTypeSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblProductTypes] ORDER BY [Id]" DeleteCommand="DELETE FROM tblProductTypes WHERE (Id = @Id)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                    <Triggers>
                                  <asp:PostBackTrigger ControlID="btnExcelExport" />
                                  <asp:PostBackTrigger ControlID="btnPDFExport" />
                              </Triggers>
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
                                  <label>ProductType</label>
                                  <asp:TextBox runat="server" ID="txtProductType" Width="100%" MaxLength="50"></asp:TextBox>
                                  <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtProductType" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                             </div>
                            <div class="form-group">
                                  <label>Unit Price</label>
                                <telerik:RadNumericTextBox runat="server" ID="txtUnitPrice" Width="100%" Value="0"></telerik:RadNumericTextBox>
                                  <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtUnitPrice" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                             </div>
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" ValidationGroup="new" OnClick="btnSave_Click" />
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
                                        <label>ProductType</label>
                                       <asp:TextBox runat="server" ID="txtProductType1" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtProductType1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="edit"></asp:RequiredFieldValidator>
                             </div>
                            <div class="form-group">
                                  <label>Unit Price</label>
                                <telerik:RadNumericTextBox runat="server" ID="txtUnitPrice1" Width="100%" Value="0"></telerik:RadNumericTextBox>
                                  <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtUnitPrice1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                             </div>
                       </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="edit" OnClick="btnUpdate_Click" />
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
