<%@ Page Title="" Language="C#" MasterPageFile="~/AdminTasks/Admin.Master" AutoEventWireup="true" CodeBehind="Editor.aspx.cs" Inherits="MVFC.Bot.AdminTasks.LuisController.Editor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>
    <script type="text/javascript">
        $(function () {
            $.contextMenu({
                selector: '.context-menu-one',
                callback: function (key, options) {
                    var m = "clicked: " + key;
                    window.console && console.log(m) || alert(m);
                },
                items: {
                    "edit": { name: "Edit", icon: "edit" },
                    "cut": { name: "Cut", icon: "cut" },
                    copy: { name: "Copy", icon: "copy" },
                    "paste": { name: "Paste", icon: "paste" },
                    "delete": { name: "Delete", icon: "delete" },
                    "sep1": "---------",
                    "quit": {
                        name: "Quit", icon: function () {
                            return 'context-menu-icon context-menu-icon-quit';
                        }
                    }
                }
            });

            $('.context-menu-one').on('click', function (e) {
                console.log('clicked', this);
            })
        });
    </script>
    <span class="context-menu-one btn btn-neutral">right click me</span>
</asp:Content>
