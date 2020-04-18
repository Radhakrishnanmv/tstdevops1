<%@ Page Title="" Language="C#" MasterPageFile="~/AdminTasks/Admin.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MVFC.Bot.AdminTasks.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <table id="tbl_SignIn" runat="server">       
        <tr>
            <td colspan="2">
                <asp:Button ID="btn_Login" runat="server" Text="SignIn" OnClick="btn_Login_Click" />
            </td>
        </tr>
    </table>
    <table id="tbl_SignOut" runat="server">
        <tr>
            <td>
                <asp:Label ID="lbl_UserDisplayName" runat="server"></asp:Label>
            </td>
            <td>

            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btn_SignOut" runat="server" Text="SignOut" OnClick="btn_SignOut_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
