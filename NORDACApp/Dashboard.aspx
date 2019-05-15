<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="NORDACApp.Dashboard" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">Dashboard </h3>
              <%--<div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
              </div>--%>
            </div><!-- /.box-header -->
            <div class="box-body">
                
               <div class="row">
                    <div class="col-md-6">
                   <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="chtProductAmount" Skin="Silk" DataSourceID="productAmountSource">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries Name="Total Amount" DataFieldY="AMOUNT">
                        <TooltipsAppearance Color="White"  />
                    </telerik:ColumnSeries>
                </Series>
                <XAxis  DataLabelsField="PRODUCTTYPE">
                    <LabelsAppearance RotationAngle="55">
                    </LabelsAppearance>
                    <TitleAppearance Text="Product Type">
                    </TitleAppearance>
                </XAxis>
                <YAxis>
                    <TitleAppearance Text="Amount">
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Visible="false">
                </Appearance>
            </Legend>
            <ChartTitle Text="Products Amount">
            </ChartTitle>
        </telerik:RadHtmlChart>

                    <asp:SqlDataSource ID="productAmountSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select PRODUCTTYPE, sum(amount) as AMOUNT from vwCustomerProducts group by PRODUCTTYPE"></asp:SqlDataSource>
                
                    <%--<telerik:RadButton ID="btnExport" Text="Export to PDF" runat="server" OnClientClicked="exportRadHtmlChart" UseSubmitBehavior="false" AutoPostBack="false"></telerik:RadButton>--%>
                    <%--<telerik:RadClientExportManager ID="RadClientExportManager1" runat="server"></telerik:RadClientExportManager>--%>

                    </div>
                            <div class="col-md-6">
                         <asp:SqlDataSource ID="productCountSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select PRODUCTTYPE, count(customerid) as CUSTOMERS from vwCustomerProducts group by PRODUCTTYPE"></asp:SqlDataSource>

                     <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart2"
            DataSourceID="productCountSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:DonutSeries DataFieldY="CUSTOMERS" Name="count" NameField="PRODUCTTYPE" StartAngle="45">
                        <LabelsAppearance DataField="PRODUCTTYPE" Position="OutsideEnd" Visible="false"></LabelsAppearance>
                    </telerik:DonutSeries>
                </Series>
            </PlotArea>
            <Legend>
                <Appearance Visible="true" Position="Bottom">
                </Appearance>
            </Legend>
            <ChartTitle Text="Customers Products">
            </ChartTitle>
        </telerik:RadHtmlChart> 
                        </div>
                </div>

            </div><!-- /.box-body -->
         
          </div><!-- /.box --> 
</asp:Content>
