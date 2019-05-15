<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="NewUser.aspx.cs" Inherits="NORDACApp.Security.NewUser" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">New User </h3>
              <%--<div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>--%>
            </div><!-- /.box-header -->
            <div class="box-body">
                 <asp:UpdatePanel runat="server">
                           <ContentTemplate>
                      
            
                 <div>
                  <div class="form-group">
                 <div class="row">
                     <div class="col-md-3">
                         <label>Username</label>
                         <asp:TextBox ID="txtUsername" runat="server" Width="100%" MaxLength="20"></asp:TextBox>
                          <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtUsername" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                     </div>
                     <div class="col-md-3">
                         <label>Password</label>
                         <asp:TextBox ID="txtPassword" runat="server" Width="100%" TextMode="Password"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                     </div>
                     <div class="col-md-6">
                         <label>Fullname</label>
                         <asp:TextBox ID="txtFullname" runat="server" Width="100%"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Field" ControlToValidate="txtFullname" Display="Dynamic" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                     </div>
                 </div>
             </div>
                      <div class="form-group">
                 <div class="row">
                         <div class="col-md-3">
                         <label>Gender</label>
                         <telerik:RadDropDownList ID="dlGender" runat="server" Width="100%">
                             <Items>
                                 <telerik:DropDownListItem Text="Male" />
                                 <telerik:DropDownListItem Text="Female"  />
                                 <telerik:DropDownListItem Text="Unknown" />
                             </Items>
                         </telerik:RadDropDownList>
                     </div>
                   
                     <div class="col-md-3">
                         <label>Marital Status</label>
                         <telerik:RadDropDownList ID="dlMaritalStatus" runat="server" Width="100%">
                             <Items>
                                 <telerik:DropDownListItem Text="Single" />
                                 <telerik:DropDownListItem Text="Married" />
                                 <telerik:DropDownListItem Text="Separated" />
                                 <telerik:DropDownListItem Text="Divorced" />
                                 <telerik:DropDownListItem Text="Widowed"/>
                             </Items>
                         </telerik:RadDropDownList>
                     </div>
                    <div class="col-md-5">
                         <label>Mobile No.</label>
                         <asp:TextBox ID="txtMobile" runat="server" Width="100%"></asp:TextBox>
                        <asp:RegularExpressionValidator Runat="server" ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Please enter numbers only." ForeColor="Red" SetFocusOnError="true" ValidationExpression="(^([0-9]*|\d*\d{1}?\d*)$)"></asp:RegularExpressionValidator>
                     </div>
                       <div class="col-md-1">
                         <label>Active</label>
                         <asp:CheckBox runat="server" ID="chkActive" Width="100%" />
                     </div>
                           
                 </div>
             </div>
                     <div class="form-group">
                         <div class="row">
                               <div class="col-md-6">
                         <label>Email</label>
                         <asp:TextBox ID="txtEmail" runat="server" Width="100%" TextMode="Email"></asp:TextBox>
                     </div>
                             <div class="col-md-6">
                         <label>Address</label>
                         <asp:TextBox ID="txtAddress" runat="server" Width="100%"></asp:TextBox>
                            </div>
                         </div>
                     </div>
                     <div class="form-group">
                         <div class="row">
                              <div class="col-md-6">
                         <label>Post Type</label>
                           <telerik:RadDropDownList ID="dlPost" runat="server" Width="100%" DefaultMessage="Select Post Type">
                             <Items>
                                 <telerik:DropDownListItem Text="Accountant" />
                                 <telerik:DropDownListItem Text="Sales Person" />
                                 <telerik:DropDownListItem Text="Manager" />
                                 <telerik:DropDownListItem Text="Director" />
                                 <telerik:DropDownListItem Text="Secretary" />
                                 <telerik:DropDownListItem Text="Data Clerk" />
                                 <telerik:DropDownListItem Text="Office Assistant" />
                             </Items>
                         </telerik:RadDropDownList>
                            </div>
                         <div class="col-md-6">
                         <label>User Role</label>
                         <telerik:RadDropDownList ID="dlRole" runat="server" Width="100%">
                             <Items>
                                 <telerik:DropDownListItem Text="User" />
                                 <telerik:DropDownListItem Text="Admin" />
                             </Items>
                         </telerik:RadDropDownList>
                     </div>
                         </div>
                     </div>

                     <div class="modal-footer">
                    <asp:Button runat="server" CssClass="btn btn-warning" Text="Return" CausesValidation="false" PostBackUrl="~/Security/Users.aspx"/>              
                    <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" Text="Save" OnClick="btnSave_Click" />         
                </div>
                            </div>
                           </ContentTemplate>
                       </asp:UpdatePanel>

            </div><!-- /.box-body -->
         
          </div><!-- /.box --> 
</asp:Content>
