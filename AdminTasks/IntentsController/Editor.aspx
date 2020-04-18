<%@ Page Title="" Language="C#" MasterPageFile="~/AdminTasks/Admin.Master" AutoEventWireup="true" CodeBehind="Editor.aspx.cs" Inherits="MVFC.Bot.AdminTasks.IntentsController.Editor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <%-- <script src="../Js/jquery-1.10.2.js"></script>
    <link href="../Css/jquery.contextMenu.css" rel="stylesheet" />
    <script src="../Js/jquery.contextMenu.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>
    <link rel="stylesheet" href="../Css/bootstrap.min.css" />
    <script src="../Js/bootstrap.min.js"></script>
    <script type="text/javascript">

        $(function () {
            $.contextMenu({
                selector: ".Menu",
                build: function ($trigger) {
                    debugger;
                    var options = {
                        callback: function (key, options, wewew, w, q, q) {
                            document.getElementById("<%= hdnAction.ClientID %>").value = key;
                            var intentData = $(options.$trigger).attr("intentData");
                            if (intentData != undefined && intentData != null)
                                document.getElementById("<%= hdnCurrentEditIntentJSON.ClientID %>").value = intentData;
                            else
                                document.getElementById("<%= hdnCurrentEditIntentJSON.ClientID %>").value = "";
                            if (key.trim().toUpperCase() == "EDIT") {
                                $(".modal-title")[0].innerText="Edit Intent";
                                var jsonIntentData = JSON.parse(intentData);
                                PopulateControlBasedIntentType(jsonIntentData.IntentType);
                                ApplyAllValueInControlFromObject(jsonIntentData);
                                $("#myModal").modal();
                            }
                            else if (key.trim().toUpperCase() != "DELETE") {
                                $(".modal-title")[0].innerText="Add Intent";
                                PopulateControlBasedIntentType(key);
                                $("#myModal").modal();
                            }
                            else {
                                $("#<%= btnSave.ClientID %>").click();
                            }
                        },
                        items: {}
                    };
                    if (!$trigger.hasClass('RootMenu'))
                        options.items.Edit = { name: "Edit" };
                    if ($trigger.hasClass('RootMenu')) {
                        options.items.SimpleResponse = { name: "Add Simple Response" };
                        options.items.ChoiceSet = { name: "Add Choice Set" };
                    }
                    else if ($trigger.hasClass('SimpleResponse')) {
                        options.items.SimpleResponse = { name: "Add Simple Response" };
                        options.items.ChoiceSet = { name: "Add Choice Set" };
                    } else if ($trigger.hasClass('ChoiceSet')) {
                        options.items.Choice = { name: "Add Choice" };
                    } else if ($trigger.hasClass('Choice')) {
                        options.items.Choice = { name: "Add Choice" };
                        options.items.Question = { name: "Add Question" };
                    }
                    if (!$trigger.hasClass('RootMenu'))
                        options.items.Delete = { name: "Delete" };
                    return options;
                }
            });
        });
        $(document).ready(function () {

        });
        function getGUID(mystr) {
            var reGUID = /\w{8}[-]\w{4}[-]\w{4}[-]\w{4}[-]\w{12}/g //regular expression defining GUID
            var retArr = [];
            var retval = '';
            retArr = mystr.match(reGUID);
            if (retArr != null) {
                retval = retArr[retArr.length - 1];
            }
            return retval;
        }
        function PopulateControlBasedIntentType(intentType) {
            document.getElementById("<%=hdnFldIntentType.ClientID %>").value = intentType;
            AllIntentInputControlsVisibility("Hide");
            switch (intentType.trim().toUpperCase()) {
                case "SIMPLERESPONSE":
                    SimpleIntentInputControlsVisibility();
                    break;
                case "CHOICESET":
                    ChoiceSetIntentInputControlsVisibility();
                    break;
                case "CHOICE":
                    ChoiceIntentInputControlsVisibility();
                    break;
                case "QUESTION":
                    ArgumentIntentInputControlsVisibility();
                    break;
            }
        }
        function AllIntentInputControlsVisibility(action) {
            if (action.trim().toUpperCase() == "HIDE") {
                $(".AdditionalInfo").each(function () {
                    if (!$(this).hasClass("hide"))
                        $(this).addClass("hide");
                });
                document.getElementById("<%=txtIntentName.ClientID %>").value = "";
                $(".AdditionalInfo input").val("");
                $(".AdditionalInfo select").val("");
                $("#<%=ddlAuditLog.ClientID %>").val("No");
            }
            else
                $(".AdditionalInfo").removeClass("hide");
        }
        function SimpleIntentInputControlsVisibility() {
            AllIntentInputControlsVisibility("Hide");

            $("#trResult").removeClass("hide");

            $("#trNextIntent").removeClass("hide");

            $("#trNextIntentCondition").removeClass("hide");
        }
        function ChoiceSetIntentInputControlsVisibility() {
            AllIntentInputControlsVisibility("Hide");

            $("#trRequestText").removeClass("hide");

            $("#trValidateMessage").removeClass("hide");
        }
        function ChoiceIntentInputControlsVisibility() {
            AllIntentInputControlsVisibility("Hide");
            $(".ChoiceSupportControl").removeClass("hide");
        }
        function ArgumentIntentInputControlsVisibility() {
            AllIntentInputControlsVisibility("Hide");
            $("#trTypeOfSourceForQuestion").removeClass("hide");
            $("#trRequestText").removeClass("hide");
            $("#trResult").removeClass("hide");
            $("#trResultForInternalProcess").removeClass("hide");
            $("#trOptions").removeClass("hide");
        }
        function ApplyAllValueInControlFromObject(jsonIntentData) {
            document.getElementById("<%=txtIntentName.ClientID %>").value = jsonIntentData.IntentName;
            document.getElementById("<%=hdnFldIntentType.ClientID %>").value = jsonIntentData.IntentType;
            document.getElementById("<%=txtRequestText.ClientID %>").value = jsonIntentData.RequestText;
            document.getElementById("<%=ddlTypeOfSourceForQuestion.ClientID %>").value = jsonIntentData.TypeOfSource;
            document.getElementById("<%=txtValidateMessage.ClientID %>").value = jsonIntentData.ValidateMessage;
            document.getElementById("<%=txtResult.ClientID %>").value = jsonIntentData.Result;
            document.getElementById("<%=txtResultForInternalProcess.ClientID %>").value = jsonIntentData.ResultForInternalProcess;
            document.getElementById("<%=txtQueueReturnMessage.ClientID %>").value = jsonIntentData.QueueReturnMessage;
            document.getElementById("<%=ddlCallType.ClientID %>").value = jsonIntentData.CallType;
            document.getElementById("<%=ddlTypeOfSourceForBusinessProcApp.ClientID %>").value = jsonIntentData.TypeOfSource;
            document.getElementById("<%=txtSourceNameOfCallMethod.ClientID %>").value = jsonIntentData.SourceNameOfCallMethod;
            document.getElementById("<%=txtCallMethodName.ClientID %>").value = jsonIntentData.CallMethodName;
            document.getElementById("<%=txtNextIntentCondition.ClientID %>").value = jsonIntentData.NextIntentsCondition;
            document.getElementById("<%=ddlNextIntent.ClientID %>").value = jsonIntentData.NextIntents;
            document.getElementById("<%=ddlAuditLog.ClientID %>").value = jsonIntentData.AuditLog;
            if (jsonIntentData.AuditLog.trim().toUpperCase() != "YES" && jsonIntentData.AuditLog.trim().toUpperCase() != "NO")
                document.getElementById("<%=txtAuditLogColumn.ClientID %>").value = jsonIntentData.AuditLog;
            document.getElementById("<%=txtGroupsToShowMenu.ClientID %>").value = jsonIntentData.GroupsToShowMenu;
            document.getElementById("<%=txtAllowedGroupsAndUsersToAccess.ClientID %>").value = jsonIntentData.AllowedGroupsAndUsersToAccess;
            document.getElementById("<%=txtMessageForNotAllowed.ClientID %>").value = jsonIntentData.MessageForNotAllowed;
            document.getElementById("<%=txtOptions.ClientID %>").value = jsonIntentData.Options;
        }

    </script>
    <style>
        .auto-style1 {
            border-collapse: separate;
            border-spacing: 0 1em;
        }

        .treeNode {
            text-decoration: none;
        }

        .rootNode {
            font-weight: bold;
            color: #000000;
            text-decoration: none;
        }

        .leafNode {
            text-decoration: none;
        }

        .treeviewClass td div {
            height: 20px !important
        }

        .treeviewClass {
            line-height: 1.1;
        }

        .hide {
            visibility: hidden !important;
        }
    </style>
    <div>
        <asp:TreeView runat="server" ID="TreeView1" CssClass="treeviewClass" ImageSet="Arrows" LineImagesFolder="../Images/TreeLineImages" ShowLines="True" Font-Size="15px">
            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />

            <LeafNodeStyle CssClass="leafNode"></LeafNodeStyle>

            <NodeStyle CssClass="treeNode" Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px"></NodeStyle>

            <ParentNodeStyle Font-Bold="False" />

            <RootNodeStyle CssClass="rootNode"></RootNodeStyle>

            <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
        </asp:TreeView>
    </div>

    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Intent</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <table class="auto-style1">
                            <tr id="trIntentName">
                                <td>Intent Name : </td>
                                <td>
                                    <asp:TextBox ID="txtIntentName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trIntentType" class="hide">
                                <td>Intent Type :
                                </td>
                                <td>
                                    <asp:HiddenField ID="hdnFldIntentType" runat="server" />
                                </td>
                            </tr>
                            <tr id="trRequestText" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Question Text : </td>
                                <td>
                                    <asp:TextBox ID="txtRequestText" runat="server" ToolTip="Request Text"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trTypeOfSourceForQuestion" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Type Of Answer Of Question : </td>
                                <td>
                                    <asp:DropDownList ID="ddlTypeOfSourceForQuestion" runat="server">
                                        <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="String" Value="String"></asp:ListItem>
                                        <asp:ListItem Text="Int" Value="Int"></asp:ListItem>
                                        <asp:ListItem Text="Bool" Value="Bool"></asp:ListItem>
                                        <asp:ListItem Text="Question" Value="Question"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="trValidateMessage" class="hide AdditionalInfo">
                                <td>Validate Message : </td>
                                <td>
                                    <asp:TextBox ID="txtValidateMessage" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trResult" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Response Text: </td>
                                <td>
                                    <asp:TextBox ID="txtResult" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trResultForInternalProcess" class="hide AdditionalInfo">
                                <td>Answer For Internal Process : </td>
                                <td>
                                    <asp:TextBox ID="txtResultForInternalProcess" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trQueueReturnMessage" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Response Text Of Asynchronous Process : </td>
                                <td>
                                    <asp:TextBox ID="txtQueueReturnMessage" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trCallType" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Business Process Type : </td>
                                <td>
                                    <asp:DropDownList ID="ddlCallType" runat="server">
                                        <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Long Running" Value="Async"></asp:ListItem>
                                        <asp:ListItem Text="Short Running" Value="Sync"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="trTypeOfSourceForBusinessProcApp" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Business Process Application Type : </td>
                                <td>
                                    <asp:DropDownList ID="ddlTypeOfSourceForBusinessProcApp" runat="server">
                                        <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Exe" Value="Exe"></asp:ListItem>
                                        <asp:ListItem Text="Dll" Value="Dll"></asp:ListItem>
                                        <asp:ListItem Text="Web Service" Value="WebService"></asp:ListItem>
                                        <asp:ListItem Text="Jar" Value="Jar"></asp:ListItem>
                                        <asp:ListItem Text="Batch" Value="Batch"></asp:ListItem>
                                        <asp:ListItem Text="KnowledgeBase Call" Value="KBCall"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="trSourceNameOfCallMethod" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Business Process Application Relative Path : </td>
                                <td>
                                    <asp:TextBox ID="txtSourceNameOfCallMethod" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trCallMethodName" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Business Process Application Method : </td>
                                <td>
                                    <asp:TextBox ID="txtCallMethodName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trNextIntentCondition" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Next Excute Intent Condition: </td>
                                <td>
                                    <asp:TextBox ID="txtNextIntentCondition" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trNextIntent" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Next Excute Intent : </td>
                                <td>
                                    <asp:DropDownList ID="ddlNextIntent" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="trAuditLog" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Audit Log: </td>
                                <td>
                                    <asp:DropDownList ID="ddlAuditLog" runat="server">
                                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="No" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="trAuditLogColumn" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Audit Log Column Name: </td>
                                <td>
                                    <asp:TextBox ID="txtAuditLogColumn" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trGroupsToShowMenu" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Groups And Users To Allow Choice View: </td>
                                <td>
                                    <asp:TextBox ID="txtGroupsToShowMenu" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trAllowedGroupsAndUsersToAccess" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Allowed Groups And Users To Access Choice: </td>
                                <td>
                                    <asp:TextBox ID="txtAllowedGroupsAndUsersToAccess" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trMessageForNotAllowed" class="hide AdditionalInfo ChoiceSupportControl">
                                <td>Message For Not Allowed: </td>
                                <td>
                                    <asp:TextBox ID="txtMessageForNotAllowed" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trOptions" class="hide AdditionalInfo">
                                <td>Options : </td>
                                <td>
                                    <asp:TextBox ID="txtOptions" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trBusinessServerURL" class="hide AdditionalInfo">
                                <td>Business Server URL : </td>
                                <td>
                                    <asp:TextBox ID="txtBusinessServerURL" runat="server" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button type="button" CssClass="btn btn-Save" runat="server" ID="btnSave" OnClick="btnSave_Click" Text="Save"></asp:Button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>



    <asp:HiddenField runat="server" ID="hdnAction" />
    <asp:HiddenField runat="server" ID="hdnCurrentEditIntentJSON" />
    <asp:HiddenField runat="server" ID="hdnIsPostBack" />

</asp:Content>
