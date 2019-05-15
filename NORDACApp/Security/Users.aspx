<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="NORDACApp.Security.Users" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Users </h3>
              <%--<div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>--%>
            </div><!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                       <div class="col-sm-4 pull-right">
                                           
                                        </div>
                                        <div class="col-sm-8 pull-left">
                                            <div class="toolbar-btn-action">
                                                <asp:Button runat="server" CssClass="btn btn-primary" Text="Add User" CausesValidation="false" PostBackUrl="~/Security/NewUser.aspx"  />  
                                            </div>
                                        </div>
                                    </div>
                <hr />
                <asp:UpdatePanel runat="server">
                           <ContentTemplate>
                               <telerik:RadGrid ID="userGrid" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" DataSourceID="userSource" GroupPanelPosition="Top" OnItemDataBound="userGrid_ItemDataBound" OnItemCommand="userGrid_ItemCommand" OnItemDeleted="userGrid_ItemDeleted">
                                   <GroupingSettings CaseSensitive="False" />
                                   <ClientSettings>
                                       <Selecting AllowRowSelect="True" />
                                       <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="400px" />
                                   </ClientSettings>
                                   <GroupingSettings CaseSensitive="false" />
                                   <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="None" DataKeyNames="ID" DataSourceID="userSource">
                                       <CommandItemSettings ShowAddNewRecordButton="false" />
                                       <RowIndicatorColumn Visible="False">
                                       </RowIndicatorColumn>
                                       <Columns>
                                           <telerik:GridBoundColumn  DataField="ID" FilterControlAltText="Filter ID column"  SortExpression="ID" UniqueName="ID" Display="false">
                                           </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" DataField="Username" EmptyDataText="" FilterControlAltText="Filter USERNAME column" FilterDelay="1000" HeaderText="Username"  SortExpression="USERNAME" UniqueName="USERNAME" ShowFilterIcon="false" FilterControlWidth="120px">
                                           <HeaderStyle Width="150px" />
                                           </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" DataField="FullName" FilterControlAltText="Filter FULLNAME column" FilterDelay="1000" HeaderText="Full Name" SortExpression="FULLNAME" UniqueName="FULLNAME" ShowFilterIcon="false" FilterControlWidth="170px">
                                           <HeaderStyle Width="200px" />
                                           </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn DataField="POSTTYPE" FilterControlAltText="Filter POSTTYPE column" HeaderText="Post Type" SortExpression="POSTTYPE" UniqueName="POSTTYPE" ShowFilterIcon="false" FilterControlWidth="170px">
                                           <HeaderStyle Width="200px" />
                                           </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ACTIVE" FilterControlAltText="Filter ACTIVE column" HeaderText="ACTIVE" SortExpression="ACTIVE" UniqueName="ACTIVE" Display="false">
                                           <HeaderStyle Width="120px" />
                                            </telerik:GridBoundColumn>
                                           <telerik:GridButtonColumn CommandName="Edit" Text="Edit" UniqueName="Edit" ButtonType="PushButton" ButtonCssClass="btn-info">
                                           <HeaderStyle Width="50px" />
                                           </telerik:GridButtonColumn>
                                           <telerik:GridButtonColumn CommandName="ToggleActive" Text="Toggle Active" ButtonType="PushButton" ButtonCssClass="btn-warning" UniqueName="ToggleActive" ConfirmText="Toggle User's active status?">
                                           <HeaderStyle Width="100px" />
                                           </telerik:GridButtonColumn>
                                       </Columns>
                                   </MasterTableView>
                               </telerik:RadGrid>
                               <asp:SqlDataSource ID="userSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ID, USERNAME, FULLNAME, POSTTYPE, ACTIVE FROM TBLUSERS" DeleteCommand="DELETE FROM TBLUSERS WHERE ID = @ID">
                                   <DeleteParameters>
                                       <asp:Parameter Name="ID" Type="Int32" />
                                   </DeleteParameters>
                               </asp:SqlDataSource>
                           </ContentTemplate>
                       </asp:UpdatePanel> 
            </div><!-- /.box-body -->
         
          </div><!-- /.box --> 
</asp:Content>
