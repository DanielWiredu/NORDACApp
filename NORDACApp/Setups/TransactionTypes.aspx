<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TransactionTypes.aspx.cs" Inherits="NORDACApp.Setups.TransactionTypes" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Transaction Types </h3>
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
                       <telerik:RadGrid ID="transTypeGrid" runat="server" AutoGenerateColumns="False" DataSourceID="transTypeSource" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" OnItemCommand="transTypeGrid_ItemCommand" OnItemDeleted="transTypeGrid_ItemDeleted">
                            <ClientSettings>
                                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                                <MasterTableView DataKeyNames="ID" DataSourceID="transTypeSource" AllowAutomaticDeletes="true" CommandItemDisplay="None" CommandItemSettings-AddNewRecordText="Add New Transaction Type">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="ID" FilterControlAltText="Filter ID column" HeaderText="ID" SortExpression="ID" UniqueName="ID" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="100px" Display="false">
                                        <HeaderStyle Width="120px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Description" FilterControlAltText="Filter Description column" HeaderText="Description" SortExpression="Description" UniqueName="Description" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="240px" MaxLength="50">
                                    <HeaderStyle Width="250px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TransactionType" FilterControlAltText="Filter TransactionType column" HeaderText="Transaction Type" SortExpression="TransactionType" UniqueName="TransactionType" AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="120px" MaxLength="10">
                                    <HeaderStyle Width="150px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Edit" ButtonCssClass="btn-info" Text="Edit">
                                        <HeaderStyle Width="40px" />
                                    </telerik:GridButtonColumn>
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" UniqueName="Delete" ConfirmText="Delete Record?" ButtonType="PushButton" ButtonCssClass="btn-danger">
                                        <HeaderStyle Width="50px" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                                <EditFormSettings>
                                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                                    </EditColumn>
                                </EditFormSettings>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:SqlDataSource ID="transTypeSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblTransactionTypes] ORDER BY [ID]" DeleteCommand="DELETE FROM [tblTransactionTypes] WHERE [ID] = @ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
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


    <div class="modal fade" id="newmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                 <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">New Transaction Type</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                        <label>Description</label>
                                       <asp:TextBox runat="server" ID="txtDescription" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtDescription" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="new"></asp:RequiredFieldValidator>
                             </div>
                            <div class="form-group">
                                        <label>Transaction Type</label>
                                          <telerik:RadDropDownList ID="dlTransType" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Income"/>
                                                <telerik:DropDownListItem Text="Expense"/>
                                            </Items>
                                        </telerik:RadDropDownList>
                            </div>     
                       </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" ValidationGroup="new" />
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
         </div>

             <div class="modal fade" id="editmodal">
    <div class="modal-dialog" style="width:50%">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                  <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Edit Transaction Type</h4>
                </div>
                        <div class="modal-body">
                             <div class="form-group">
                                        <label>Description</label>
                                       <asp:TextBox runat="server" ID="txtDescription1" Width="100%" MaxLength="50"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtDescription1" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="edit"></asp:RequiredFieldValidator>
                             </div>
                            <div class="form-group">
                                        <label>Transaction Type</label>
                                          <telerik:RadDropDownList ID="dlTransType1" runat="server" Width="100%">
                                            <Items>
                                                <telerik:DropDownListItem Text="Income"/>
                                                <telerik:DropDownListItem Text="Expense"/>
                                            </Items>
                                        </telerik:RadDropDownList>
                            </div>
                       </div>
                <div class="modal-footer">
                     <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <asp:Button runat="server" ID="btnUpdate" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="edit"/>
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
