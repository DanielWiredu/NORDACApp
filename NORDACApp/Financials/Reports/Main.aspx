<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="NORDACApp.Financials.Reports.Main" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Financial Reports </h3>
              <%--<div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>--%>
            </div><!-- /.box-header -->
            <div class="box-body">
                
              <asp:UpdatePanel runat="server" >
                    <ContentTemplate>
                          <div class="bg-primary">Select duration for Report</div>
             
                       <div class="form-group">
                          <div class="row">
                              <div class="col-md-3">

                              </div>
                              <div class="col-md-3">
                                  <label>Start Date</label>
                                  <telerik:RadDatePicker ID="dpSdate" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                                  <asp:RequiredFieldValidator runat="server" ControlToValidate="dpSdate" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Start date required" ValidationGroup="detail"></asp:RequiredFieldValidator>
                              </div>
                                <div class="col-md-3">
                                  <label>End Date</label>
                                  <telerik:RadDatePicker ID="dpEdate" runat="server" Width="100%" DateInput-ReadOnly="true"></telerik:RadDatePicker>
                                  <asp:RequiredFieldValidator runat="server" ControlToValidate="dpEdate" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="End date required" ValidationGroup="detail"></asp:RequiredFieldValidator>
                              </div>
                              <div class="col-md-3">

                              </div>
                          </div>
                      </div>

                     <div class="modal-footer">
                    <asp:Button ID="btnReport" CssClass="btn btn-primary" runat="server" Text="Generate Report" OnClick="btnReport_Click" ValidationGroup="detail"/>         
                </div>

                        <div class="divider"></div>
                        <div>&nbsp;</div>
                         <div class="bg-primary">Select Period for Report</div>
                       <div class="form-group">
                          <div class="row">
                              <div class="col-md-3">

                              </div>
                              <div class="col-md-3">
                                  <label>Type</label>
                                  <asp:RadioButtonList ID="rdType" runat="server" RepeatDirection="Horizontal">
                                      <asp:ListItem Text="Monthly" Value="Monthly" Selected="True"></asp:ListItem>
                                      <asp:ListItem Text="Yearly" Value="Yearly"></asp:ListItem>
                                  </asp:RadioButtonList>
                              </div>
                              <div class="col-md-3">
                                  <label>Month/Year</label>
                                  <telerik:RadMonthYearPicker ID="dpPeriod" runat="server" DateInput-ReadOnly="true" Width="100%"></telerik:RadMonthYearPicker>
                                  <asp:RequiredFieldValidator runat="server" ControlToValidate="dpPeriod" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Report Period required" ValidationGroup="summary"></asp:RequiredFieldValidator>
                              </div>
                              <div class="col-md-3">

                              </div>
                          </div>
                      </div>

                     <div class="modal-footer">
                    <asp:Button ID="btnReportSummary" CssClass="btn btn-primary" runat="server" Text="Generate Report" OnClick="btnReportSummary_Click" ValidationGroup="summary"/>         
                </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div><!-- /.box-body -->
         
          </div><!-- /.box --> 
</asp:Content>
