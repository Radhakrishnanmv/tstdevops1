<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebChat.aspx.cs" Inherits="MVFC.Bot.WebChat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Css/botchat.css" rel="stylesheet" />
    <script src="Js/jquery-1.12.4.min.js"></script>
    <script src="Js/botchat.js"></script>

    <style type="text/css">
        html, body {
            overflow: hidden;
        }

        .wc-header {
            display: none;
        }

        body, html {
            margin: 0;
            padding: 0;
        }

        .FullSize {
            width: 100%;
            height: 100%;
        }

        .wc-message-groups {
            top: 36px !important;
            bottom: 62px !important;
        }

        .wc-console svg {
            fill: white !important;
        }
        .has-text input[type=text]
        {
            color:white !important;
        }
        .wc-message-from-me svg.wc-message-callout path
        {
            fill:#B4CD2D !important;
        }
        .wc-message-from-me .wc-message-content
        {
            background-color:#B4CD2D !important;
            color:black !important;
        }
        
    </style>
    <script>
        $(document).ready(function () {
            //document.getElementById("WebChatCloseIcon").addEventListener('click', function (event) {
            //    document.getElementById("BotSection").style.visibility = "hidden";
            //    document.getElementById("WebChatOpenIcon").style.visibility = "visible";
            //});

            window.addEventListener('message', function (e) {
                results.innerHTML = e.data;
            }, false);


            if ($(".wc-header").length == 0) {
                BotChat.App({
                    directLine: { secret: 'KfmDYGhDx-0.cwA.sQ8.FAZCSzjJsFaFF7NSLjH8DlL-GF68wTxuFtDKESc1j-g' },
                    user: { id: '00012', name: 'WebChat1' },
                    bot: { id: '28:11c2aca2-d979-4679-adbd-8d2cfe707ffb', name: 'Mona2' },
                    conversation: { id: 'GWxMcJv8qGijxespkIDj0-k' },
                    resize: 'detect'
                }, document.getElementById("bot"));
            }
            $("#WebChat_HeaderClose").click(function () {
                parent.postMessage("Close","*");
            });
        });
    </script>
</head>
<body>






    <form id="form1" runat="server">
        <div id="WebChat_OuterDiv" class="FullSize">
            <div id="WebChat_InterDiv" class="FullSize" style="background-color: black;">
                <div id="WebChat_HeaderDiv" style="background-color: #B4CD2D; min-height: 35px; display: block; vertical-align: central;">
                    <img id="WebChat_HeaderClose" src="Image/Minus.png" style="position: absolute; right: 5px; top: 2px; block;cursor:pointer" />
                </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div id="BotSection" style="display: block; width: 100%; height: 100%;">
                                <div id="bot" style="display: block; width: 100%; height: 100%; background-color: aliceblue">
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>







    </form>
</body>
</html>
