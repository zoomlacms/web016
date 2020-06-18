<%@ page language="C#" autoeventwireup="true" inherits="User_ChangeMP, App_Web_umfx2esq" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link  rel="stylesheet" type="text/css" href="../App_Themes/UserThem/bidding.css" />
<link href="../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery.js"></script>
<title>修改手机</title>
<style type="text/css">
.auto-style1 {height: 24px;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="us_topinfo">
您现在的位置：<a title="网站首页" href="/" target="_blank">
<asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a> &gt;&gt;<a title="会员中心" href="/User/Default.aspx" target="_parent">会员中心</a> &gt;&gt; 修改手机
</div>
    <div runat="server" id="Login" class="us_seta"   style="position:absolute;top:40%;left:40%" visible="false">
<table ><tr><td colspan="2"><font color="red">本页需支付密码才能登入请输入支付密码</font> </td></tr>
<tr><td><asp:TextBox ID="Second" runat="server" TextMode="Password"></asp:TextBox></td><td>
        <asp:Button ID="sure" runat="server" Text="确定" onclick="sure_Click" /></td></tr></table>
</div>
<div runat="server" id="DV_show">
<div style="margin-top: 10px;">
<div class="us_seta" style="margin-top: 5px;width:100%;">
    <asp:Panel ID="panel1" runat="server" Visible="true" Width="100%">
    <table align="center" border="0">
    <tr>
        <td style="text-align:center;width:40%" class="auto-style1"><strong>原手机号：</strong></td>
        <td class="auto-style1">
            <asp:Label ID="Label1" runat="server" ></asp:Label>
        </td>
    </tr>
        <tr>
        <td style="text-align:center;width:40%"><strong>请输入验证码：</strong></td>
        <td><asp:TextBox ID="codeText" runat="server"   CssClass="f_input" Height="18px" /> <span style="color:Red">*</span>
             <input type="text" id="sendCodeBtn"   class="i_bottom" value="发送验证码"  onclick="this.value = '正在发送'; postToCS('sendCode', this);" title="点击后过20秒才能再次发送"/>
            <script type="text/javascript">
                function disButton(obj) {
                    var time = 20000;//20秒
                    setTimeout(function () { obj.disabled = true; }, 50);
                    var a = setInterval(
                        function () {
                            time = time - 1000;
                            obj.value =+time / 1000 + "秒";
                        }, 1000);
                    setTimeout(function () { obj.disabled = false; clearInterval(a); obj.value = "发送验证码"; }, time);
                }
                
                function postToCS(a,obj)
                {
                    $.ajax({
                        type: "Post",
                        url: "ChangeMP.aspx",
                        data: { action: a, },
                        success: function (data) { disButton(obj); alert(data); },
                        error: function () { alert("发送失败");}
                    });
                }
            </script>
        </td>
    </tr>
        <tr>
            <td  style="text-align:center;width:40%"  colspan="2">
                <asp:Button ID="nextBtn" runat="server"  CssClass="i_bottom" Text="下一步" OnClick="nextBtn_Click"  /></td>
        </tr>
        <tr>
            <td><asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
        </tr>
    </table>
            </asp:Panel>
    <asp:Panel ID="panel2" runat="server"  Width="100%" Visible="false">
    <table  align="center" border="0">   
    <tr>
        <td style="text-align:center;width:40%" class="auto-style1"><strong>新手机号：</strong></td>
        <td>
            <asp:TextBox ID="tbMobile" runat="server" CssClass="f_input" Height="18px"/>
            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ValidationExpression="^1[(0-9)]{10}$" ControlToValidate="tbMobile" ErrorMessage="按照手机号规则输入" />
        </td>
    </tr>     
    <tr>
        <td  style="text-align:center;width:40%"  colspan="2">
        <asp:Button ID="BtnSubmit" runat="server" Text="提交"  class="i_bottom" OnClick="BtnSubmit_Click" /></td>
    </tr>
    </table>
        </asp:Panel>
    <div style="width:100%; text-align:center;margin-top:10px">
    <div style="width:100%; text-align:center"> </div>
    </div>
</div>
</div>
</div>
</form>
</body>
</html>

