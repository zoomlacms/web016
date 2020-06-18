﻿<%@ page language="C#" autoeventwireup="true" inherits="User_BidManage_BidOrderlist, App_Web_c5fu4qgb" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>竞拍订单提交</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
<!-- 正文布局 -->
<div class="s_body">
	<div class="rg_inout">
		<h1>请填写您的商品信息</h1>
		<h2>第二步：确认订单&nbsp;<img src="/user/images/regl2.gif" width="242" height="14" /></h2>
        <ul>
        <li style="text-align:left;">
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        <asp:HiddenField ID="hftype" runat="server" />
        <asp:HiddenField ID="hfcid" runat="server" />
        <asp:HiddenField ID="hfid" runat="server" />
        </li>
        </ul>
		<ul>
            <li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 市价：</b></li>
			<li>&nbsp;<asp:Label ID="lbllinkpri" runat="server"></asp:Label>&nbsp;</li>
          </ul>
        	<div class="cleardiv"></div>
        <ul>
            <li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 您使用的宝点：</b></li>
			<li>&nbsp;<asp:Label ID="lblbaodian" runat="server"></asp:Label>&nbsp;</li>
          </ul>
          	<div class="cleardiv"></div>
        <ul>
            <li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 您需支付的价格：</b></li>
			<li>&nbsp;<asp:Label ID="lblshijia" runat="server"></asp:Label>&nbsp;</li>
          </ul>
          	<div class="cleardiv"></div>
        <ul>
			<li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 收货人姓名：</b></li>
			<li>&nbsp;<asp:TextBox ID="Receiver" runat="server"></asp:TextBox>&nbsp;</li>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Receiver"
                ErrorMessage="收货人姓名不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator></ul>
		<div class="cleardiv"></div>
		<ul>
			<li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 收货人地址：</b></li>
			<li>&nbsp;
            <asp:DropDownList ID="dddizhi" runat="server" 
                    onselectedindexchanged="dddizhi_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            <br /><asp:TextBox ID="Jiedao" runat="server" Width="409px"></asp:TextBox><asp:CheckBox ID="ckdizhi" runat="server" />保存到地址薄</li><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Jiedao"
                ErrorMessage="收货人地址不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator></ul>
		<div class="cleardiv" style="margin-top:30px"></div>
		<ul>
			<li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 收货人邮箱：</b></li>
			<li>&nbsp;<asp:TextBox ID="Email" runat="server"></asp:TextBox></li><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Email"
                ErrorMessage="收货人邮箱不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator></ul>
		<div class="cleardiv"></div>
		<ul id="payinfo" runat="server">
			<li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 付款方式：</b></li><li></li>
            <li>&nbsp;<asp:DropDownList ID="Payment" runat="server">
            </asp:DropDownList></li></ul>
		<div class="cleardiv"></div>
		<ul style=" margin-bottom:20px">
			<li style="width:150px;text-align:right;"><b>发票信息：</b></li>
			<li><asp:TextBox ID="Invoice" runat="server" Height="46px" Width="331px" Rows="10"></asp:TextBox>
            
            <asp:CheckBox ID="Invoiceneeds" runat="server" Text="需开发票 " /></li></ul>
				<ul>
			<li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 要求送货时间：</b></li>
			<li>&nbsp;<asp:DropDownList ID="Deliverytime" runat="server">
                        <asp:ListItem Value="1">对送货时间没有特殊要求</asp:ListItem>
                        <asp:ListItem Value="2">双休日或者周一至周五的晚上送达</asp:ListItem>
                        <asp:ListItem Value="3">周一至周五的白天送达</asp:ListItem>
                    </asp:DropDownList></li></ul>
				<ul>
			<li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 联系电话：</b></li>
			<li>
                    <asp:TextBox ID="Phone" runat="server"></asp:TextBox> 格式:区号-号码
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Phone"
                        Display="Dynamic" ErrorMessage="联系电话不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Phone"
                        ErrorMessage="联系电话格式不正确!" SetFocusOnError="True" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{8}|(\(\d{4}\)|\d{4}-)?\d{8}|(\(\d{4}\)|\d{4}-)?\d{8}|(\(\d{4}\)|\d{4}-)?\d{7}|(\(\d{4}\)|\d{4}-)?\d{7}" Display="Dynamic"></asp:RegularExpressionValidator>
                        </li>
                        </ul>
				<ul>
			<li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 邮政编码：</b></li>
			<li>&nbsp;
                    <asp:TextBox ID="ZipCode" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ZipCode"
                        Display="Dynamic" ErrorMessage="邮政编码不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ZipCode"
                        ErrorMessage="邮政编码格式不正确!" ValidationExpression="^\d{6}$" SetFocusOnError="True"></asp:RegularExpressionValidator></li></ul>
				<ul>
			<li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 收货人手机：</b></li>
			<li>&nbsp;
                    <asp:TextBox ID="Mobile" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Mobile"
                        Display="Dynamic" ErrorMessage="收货人手机不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Mobile"
                        ErrorMessage="手机号码格式不正确!" ValidationExpression="^(\d{2}|\d{3})?[\-]?(\d{11})$" SetFocusOnError="True"></asp:RegularExpressionValidator></li></ul>
					<ul>
			<li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 收货人所属地区：</b></li>
			<li>&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList1"
                        ErrorMessage="收货人所属城市!" SetFocusOnError="True"></asp:RequiredFieldValidator></li></ul>
				<ul>
			<li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 送货方式：</b></li>
			<li>&nbsp;<asp:DropDownList ID="Delivery" runat="server"  AutoPostBack="true"
                    onselectedindexchanged="Delivery_SelectedIndexChanged1">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Delivery"
                        ErrorMessage="送货方式不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator></li></ul>
           
                        
				<ul>
			<li style="width:150px;text-align:right;"><b><font color="#FF0000">*</font> 运费：</b></li>
			<li>&nbsp;<asp:Label ID="lblYunFei" runat="server" ></asp:Label></li>    
			<li style="width:150px;text-align:right;"></li>
			<li>&nbsp;</li>
                    <asp:HiddenField ID="projiect" runat="server" />
                    <asp:HiddenField ID="prodectid" runat="server" />
                    <asp:HiddenField ID="projectjiage" runat="server" />
                    <asp:HiddenField ID="jifen" runat="server" />
                </ul>
		<div class="cleardiv"></div>
		&nbsp;
		<div class="cleardiv"></div>
		<ul>
			<li style="width:150px;text-align:right;">&nbsp;</li>
			<li>
                <asp:Button ID="Button1" runat="server" Text="提交订单" OnClick="Button1_Click" />&nbsp;</li></ul>
		<div class="cleardiv"></div>
	</div>
</div>
<div class="cleardiv"></div>

</form>
</body>
</html>
