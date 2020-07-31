<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Calcu.aspx.vb" Inherits="calculadora.Calcu" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Width="95px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="7" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="8" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" Text="9" />
        <br />
        <asp:Button ID="Button4" runat="server" Text="4" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button5" runat="server" Text="5" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button6" runat="server" Text="6" />
        <br />
        <asp:Button ID="Button7" runat="server" style="width: 21px" Text="1" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button8" runat="server" Text="2" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button9" runat="server" Text="3" />
        <br />
        <asp:Button ID="Button10" runat="server" Text="0" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button11" runat="server" Text="." />
        <br />
    </div>
    </form>
</body>
</html>
