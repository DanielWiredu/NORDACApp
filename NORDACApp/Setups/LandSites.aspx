<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="LandSites.aspx.cs" Inherits="NORDACApp.Setups.LandSites" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Land Sites </h3>
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
                        <telerik:RadGrid ID="landSiteGrid" runat="server" AutoGenerateColumns="False" DataSourceID="landSiteSource" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" OnItemDeleted="landSiteGrid_ItemDeleted" OnItemCommand="landSiteGrid_ItemCommand">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="landsite_list" HideStructureColumns="true"  >
                                        <Pdf AllowPrinting="true" AllowCopy="true" PaperSize="Letter" PageTitle="Land Site List" PageWidth="500"></Pdf>
                                    </ExportSettings>
                            <MasterTableView DataKeyNames="Id" DataSourceID="landSiteSource" AllowAutomaticDeletes="true" CommandItemDisplay="None" >
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Id" FilterControlAltText="Filter Id column" HeaderText="Id" SortExpression="Id" UniqueName="Id" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="80px" Display="false" ReadOnly="true">
                                        <HeaderStyle Width="100px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="LandSite" FilterControlAltText="Filter LandSite column" HeaderText="LandSite" SortExpression="LandSite" UniqueName="LandSite" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="250px" MaxLength="50">
                                    <HeaderStyle Width="300px" />
                                         <ColumnValidationSettings EnableRequiredFieldValidation="True">
                                            <RequiredFieldValidator ForeColor="Red" ErrorMessage="Required Field" SetFocusOnError="true" Display="Dynamic"></RequiredFieldValidator>
                                        </ColumnValidationSettings>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Edit" ButtonCssClass="btn-info" Text="Edit" Exportable="false">
                                        <HeaderStyle Width="40px" />
                                    </telerik:GridButtonColumn>
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" UniqueName="Delete" ConfirmText="Delete Record?" ButtonType="PushButton" ButtonCssClass="btn-danger" Exportable="false">
                                        <HeaderStyle Width="50px" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="landSiteSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblLandSites] ORDER BY [Id]" DeleteCommand="DELETE FROM tblLandSites WHERE (Id = @Id)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
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
                                  <label>Land Site</label>
                                  <asp:TextBox runat="server" ID="txtLandSite" Width="100%" MaxLength="50"></asp:TextBox>
                                  <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtLandSite" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
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
                                        <label>Land Site</label>
                                       <asp:TextBox runat="server" ID="txtLandSite1" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtLandSite1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="edit"></asp:RequiredFieldValidator>
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
