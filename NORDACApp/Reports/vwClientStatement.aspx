<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vwClientStatement.aspx.cs" Inherits="NORDACApp.Reports.vwClientStatement" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:Button ID="btnSendStatement" runat="server" Text="Send Statement" CssClass="btn-success" OnClick="btnSendStatement_Click" />

        <CR:CrystalReportViewer ID="ClientStatementReport" runat="server" AutoDataBind="true" EnableDatabaseLogonPrompt="false" />
    </div>
    </form>

    
</body>
</html>
