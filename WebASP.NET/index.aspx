<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebASP.NET.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Web ASP</title>
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" /> 
    <link type="text/css" href="//fonts.cdnfonts.com/css/helsinki" rel="stylesheet"/>
    <style type="text/css">
        /*h1 the title Pizza Hurts*/
        .auto-style1{
            text-align:center;
            font-family: 'Helsinki', sans-serif;                               
            font-weight:bolder;
            color: #8F5B14;
        }
        /*hr the line below the tile */
        .auto-style2{
            width:430px;
        }
        /*the table inside the pizza panel*/
        .auto-style3{
            width: 350px;
        }
        /*the address label, bigger than other : left colum of the pizza table*/
        .auto-style4{
            width: 100px;
            height: 50px;
        }
        /*for the logo*/
        .auto-style5{
            margin-left:0px;
            margin-top:0px;
        }
        /*the right colum of the pizza table*/
        .auto-style6{
            width:270px;
        }
        /*the address field, bigger than other field: right colum of the pizza table*/
        .auto-style7{
            width:270px;
            height: 50px;
        }
        /*the order information panel*/
        .auto-style8{ 
            margin-top:0px;
            border-radius:30px;
        }
        /*the whole form*/
        .auto-style9{
            width:750px;
            height: 730px;
        }
        /*the left colum of the pizza table*/
        .auto-style10{
            width:100px;
        }
        /*the biggest table*/
        .auto-style11{
            width:500px;
        }
        /*the pizza colum*/
        .auto-style12{
            height: 120px;
        }
        /*the order panel*/
        .auto-style13{
            border-radius:30px;
            margin-top:0px;
        }
        /*the pizza panel, we should have different style for each panel*/ 
        .stylePanel1{
            border-radius:30px;
        }
        .tecboc{
            border-radius: 5px;
        }
        body { font-family: "Open Sans";} 
        
    </style>
</head>
<body style="background:#FFE5C4">
    <form id="form1" runat="server" class="auto-style9">
        <div>
            <h1 class="auto-style1">P I Z Z A - H U R T S</h1>
        </div>
        <hr class="auto-style2"/>
        <br />
        <table class="auto-style11">
            <!--Vertical-align: top is to make the pricing and order information stick to the top of the table, not center -->
            <tr style="vertical-align:top">
                <td class="auto-style12">
                    <!--In web control of asp, class is CssClass-->
                    <asp:Panel ID="panPizza" CssClass="stylePanel1" BackColor="#CC9900" runat="server" GroupingText="Pizza Informations" Width="400px">
                        <table class="auto-style3">
                            <!--Customer-->
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblCustomer" runat="server" AccessKey="c" AssociatedControlID="txtCustomer" Text="Customer :"></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:TextBox ID="txtCustomer" CssClass="tecboc" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <!--Telephone-->
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblTelephone" runat="server" AccessKey="t" AssociatedControlID="txtPhone" Text="Telephone :"></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:TextBox ID="txtPhone" CssClass="tecboc" runat="server" Width="200px" TextMode="Phone"></asp:TextBox>
                                </td>
                            </tr>
                            <!--Deliver-->
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblDeliver" runat="server" Text="To deliver ?:"></asp:Label>
                                </td>
                                <!--OnCheckedChanged: when the checkbox is checked, do what?
                                    AutoPostBack : a property only in asp, ask the server run again the full page load back the page when this event happen
                                    Hide and show the data without losing other data, like isSet in PHP-->
                                <td class="auto-style6">
                                    <asp:CheckBox ID="chkDelivery" runat="server" AutoPostBack="true" OnCheckedChanged="chkDelivery_CheckedChanged"></asp:CheckBox>
                                </td>
                            </tr>
                            <!--Address-->
                            <tr>
                                <td class="auto-style4">
                                    <asp:Label ID="lblAddress" runat="server" Text="Address :"></asp:Label>
                                </td>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtAddress" CssClass="tecboc" runat="server" Width="200px" Height="45px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <!--Pizza-->
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblPizza" runat="server" Text="Pizza :"></asp:Label>
                                </td>
                                <!--OnSelectedIndexChanged: what to do when an item is selected-->
                                <td class="auto-style6">
                                    <asp:DropDownList ID="cboPizza" CssClass="tecboc" runat="server" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="cboPizza_SelectedIndexChanged">
                                        <asp:ListItem>Select a Pizza</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <!--Pizza Size -->
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblPizzaSize" runat="server" Text="Pizza Size :"></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:ListBox ID="lstPizzaSize" CssClass="tecboc" runat="server" Width="200px" AutoPostBack="true">
                                        
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <!--Toppings-->
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblToppings" runat="server" Text="Toppings :"></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:CheckBoxList ID="chklstToppings" runat="server" AutoPostBack="true" >
                                        
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <!--Crust-->
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblPizzaCrust" runat="server" Text="Pizza Crust :"></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:RadioButtonList ID="radlstCrust" runat="server" AutoPostBack="true">
                                        
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                    </asp:Panel>
                </td>
                <td class="auto-style12">
                    <!--2nd panel-->
                    <asp:Panel ID="panPricing" runat="server" GroupingText="Pricing" Width="280px" BackColor="#CC9900" CssClass="auto-style8" >
                        <asp:Image ID="imgHurtz" runat="server" ImageUrl="~/logo.png" Height="80px" width="90px" CssClass="auto-style5" />
                        <!--Allow to add dynamic text without writing HTML
                            Literal is used to show text. Passes the content directly to the client browser
                            Make the page loads fast, like onInstanceStateSave better performance-->
                        <asp:Literal ID="litPricing" runat="server"></asp:Literal>
                        <asp:Button ID="btnOrderNow" runat="server" Text="Order Now" OnClick="btnOrderNow_Click" />
                    </asp:Panel>
                    <br/>
                    <!--3rd panel-->
                    <asp:Panel ID="panOrder" runat="server" GroupingText="Order Information" Width="280px" BackColor="#CC9900" CssClass="auto-style13" >
                        <!--Allow to add dynamic text without writing HTML-->
                        <asp:Literal ID="litOrder" runat="server"></asp:Literal>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br/>
    </form>
</body>
</html>
