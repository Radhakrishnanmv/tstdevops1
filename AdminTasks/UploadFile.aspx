<%@ Page Title="" Language="C#" MasterPageFile="~/AdminTasks/Admin.Master" AutoEventWireup="true" CodeBehind="UploadFile.aspx.cs" Inherits="MVFC.Bot.AdminTasks.UploadFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <script src="Js/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        function UploadFile() {
            var settings = {
                "async": true,
                "crossDomain": true,
                "url": "https://fourcolorsbusinessservice-adientcog.msappproxy.net/BotMessageProcess.svc/FileUpload",
                "method": "POST",
                "headers": {
                    "Content-Type": "application/json",
                    "Access-Control-Allow-Origin": "*",
                    "Access-Control-Allow-Methods": "POST,GET,OPTIONS,PUT"
                },
                "processData": false,
                "dataType": "jsonp",
                "data": "{\"ServerName\":\"1\",\"FileName\":\"2\",\"FileType\":\"3\",\"FileContent\":null}"
            }

            $.ajax(settings).done(function (response) {
                console.log(response);
            });
            //var file = document.querySelector('input[type=file]').files[0];
            //var reader = new FileReader();
            //reader.readAsArrayBuffer(file);
            //reader.addEventListener("load", function () {
            //    debugger;
            //    //  preview.src = reader.result;
            //    let data = new Uint8Array(reader.result)
            //    UserAction(data);
            //});
            return false;
        }
        function UserAction(ParByteArray) {
            debugger;
            var data = JSON.stringify({
                "ServerName": "1",
                "FileName": "2",
                "FileType": "3",
                "FileContent": null
            });

            var xhr = new XMLHttpRequest();


            xhr.addEventListener("readystatechange", function () {
                debugger;
                if (this.readyState === 4) {
                    console.log(this.responseText);
                }
            });
            debugger;
            xhr.open("POST", "https://fourcolorsbusinessservice-adientcog.msappproxy.net/BotMessageProcess.svc/FileUpload", true);
            xhr.setRequestHeader("Content-Type", "application/json");
            xhr.send(data);
            return false;
        }
    </script>
    <table>
        <tr>
            <td>

                <asp:Label ID="label1" runat="server" Text="File :"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="file" runat="server" />
            </td>
            <td>
                <asp:Label ID="fileError" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="label2" runat="server" Text="Utility Name :"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="UtilityName" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="label3" runat="server" Text="Server Name :"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="ServerName" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="label4" runat="server" Text="File Content Convert To :"></asp:Label>
            </td>
            <td colspan="2">
                <asp:RadioButtonList ID="rdbFileContentConvert" runat="server">
                    <asp:ListItem Text="Byte Array" Selected="True">
                    </asp:ListItem>
                    <asp:ListItem Text="Base64 String"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Result :  </td>
            <td colspan="2">
                <asp:HyperLink ID="hlResult" runat="server"></asp:HyperLink>
                <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Button ID="TestMethod" runat="server" Text="Upload File" OnClick="TestMethod_Click" />
    <asp:Button ID="Button1" runat="server" Text="Upload File Through Javascript" OnClientClick="return UploadFile()" />
</asp:Content>
