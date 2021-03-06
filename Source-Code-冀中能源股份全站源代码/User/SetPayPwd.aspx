﻿<%@ page language="C#" autoeventwireup="true" inherits="User_SetSecondPWDWeb, App_Web_sw1ttb1p" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html >

<html>
<head runat="server">
    <title></title>
 <link href="../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link  rel="stylesheet" type="text/css" href="../App_Themes/UserThem/bidding.css" />
<link href="../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="us_topinfo" runat="server" >
    您现在的位置：<a title="网站首页" href="/" target="_blank">
<asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a> &gt;&gt;<a title="会员中心" href="/User/Default.aspx" target="_parent">会员中心</a> &gt;&gt;支付密码[<a href ="SetSecondPwd.aspx" >设置支付密码</a>]</div>
    <div style="margin-top: 10px;">
    <div class="us_seta"  runat="server" >
    <table>
    <tr><td style="width:180px;">页面名称</td><td style="width:380px;">操作</td></tr>
    <tr><td style="width:180px;">
         会员信息</td> <td style="width:80px;">
            <asp:LinkButton runat="server" 
            ID="open" oncommand="open_Command" CommandName="open" CommandArgument="/User/Info/UserInfo.aspx">开启</asp:LinkButton>
        </td></tr> 
        <tr><td style="width:180px;">
         虚拟钱包兑换</td> <td style="width:80px;"><asp:LinkButton runat="server" 
            ID="LinkButton1" oncommand="open_Command" CommandName="open" CommandArgument="/User/Info/ExchangeDP.aspx">开启</asp:LinkButton>
        </td></tr>
        <tr><td style="width:180px;">
         兑换银币</td> <td style="width:80px;"><asp:LinkButton runat="server" 
            ID="LinkButton3" oncommand="open_Command" CommandName="open" CommandArgument="/User/Info/ExchangeSilverCoin.aspx">开启</asp:LinkButton>
        </td></tr>
        <tr><td style="width:180px;">
         基本信息设置</td> <td style="width:80px;"><asp:LinkButton runat="server" 
            ID="LinkButton5" oncommand="open_Command" CommandName="open" CommandArgument="/User/Info/UserBase.aspx">开启</asp:LinkButton>
        </td></tr>
        <tr><td style="width:180px;">
         登入密码设置</td> <td style="width:80px;"><asp:LinkButton runat="server" 
            ID="LinkButton7" oncommand="open_Command" CommandName="open" CommandArgument="/User/ChangPSW.aspx">开启</asp:LinkButton>
        </td></tr>
        <tr><td style="width:180px;">
         商城订单</td> <td style="width:80px;"><asp:LinkButton runat="server" 
            ID="LinkButton9" oncommand="open_Command" CommandName="open" CommandArgument="/User/PreViewOrder.aspx">开启</asp:LinkButton>
        </td></tr>
        <tr><td style="width:180px;">
         卖家订单</td> <td style="width:80px;"><asp:LinkButton runat="server" 
            ID="LinkButton11" oncommand="open_Command" CommandName="open" CommandArgument="/User/Profile/OrderManage.aspx">开启</asp:LinkButton>
        </td></tr>
        <tr><td style="width:180px;">
         积分补录</td> <td style="width:80px;"><asp:LinkButton runat="server" 
            ID="LinkButton13" oncommand="open_Command" CommandName="open" CommandArgument="/User/AddUserOrder.aspx">开启</asp:LinkButton>
        </td></tr>
        <tr><td style="width:180px;">
                 有问必答</td> <td style="width:80px;"><asp:LinkButton runat="server" 
             ID="LinkButton15" oncommand="open_Command" CommandName="open" CommandArgument="/user/iServer/FiServer.aspx">开启</asp:LinkButton>
        </td></tr>
        <tr><td style="width:180px;">
                 投稿管理</td> <td style="width:80px;"><asp:LinkButton runat="server" 
              ID="LinkButton17" oncommand="open_Command" CommandName="open" CommandArgument="/User/Content/Default.aspx">开启</asp:LinkButton></td></tr>
        <tr><td style="width:180px;">
                 店铺在线支付</td> <td style="width:80px;"><asp:LinkButton runat="server" 
              ID="LinkButton18" oncommand="open_Command" CommandName="open" CommandArgument="/PayOnline/StorePayOnline.aspx">开启</asp:LinkButton></td></tr>
        <tr><td style="width:180px;">
                 商城在线支付</td> <td style="width:80px;"><asp:LinkButton runat="server" 
              ID="LinkButton19" oncommand="open_Command" CommandName="open" CommandArgument="/PayOnline/PayOnline.aspx">开启</asp:LinkButton></td></tr>
    </table>
    </div>
    </div>
    </form>
</body>
</html>
