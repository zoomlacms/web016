﻿<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="User_UserShop_Default, App_Web_vzrss5js" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<%@ Register Src="WebUserControlTop2.ascx" TagName="WebUserControlTop2" TagPrefix="uc1" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>店铺主页</title>
<link href="/App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/Common/Common.js"></script>
<script type="text/javascript" src="/js/Common.js"></script>
<script src="/JS/calendar.js" type="text/javascript"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script> 
<script type="text/javascript">
    function CheckAll(spanChk)//CheckBox全选
    {
        var oItem = spanChk.children;
        var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
        xState = theBox.checked;
        elm = theBox.form.elements;
        for (i = 0; i < elm.length; i++)
            if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                if (elm[i].checked != xState)
                    elm[i].click();
            }
    }
</script>
</head>
<body>
<form id="form1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <uc1:WebUserControlTop2 ID="WebUserControlTop2_1" runat="server" />
            <uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
            <div class="us_topinfo" style="margin-top: 10px; width: 98%">
                店铺基本信息
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label></div>
            <ul class="us_topinfo" style="margin-top: 10px; width: 98%;margin-left:20px;">
                <li style="width: 100%; line-height: 30px;text-align:left;"><div style="width:120px; text-align:right;float:left;">商铺名称：</div>
                    <asp:TextBox ID="Nametxt" runat="server" Text='' Width="35%" MaxLength="30"></asp:TextBox>
                    <span><font color="red">*</font></span>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Nametxt">名称必填</asp:RequiredFieldValidator></li>
                <li style="width: 100%; line-height: 30px;text-align:left;"><div style="width:120px; text-align:right; float:left;">商铺信用积分：</div>&nbsp;<asp:Label ID="Label3" runat="server"></asp:Label></li>
                <li style="width: 100%; line-height: 30px;text-align:left;"><div style="width:120px; text-align:right;float:left;">商铺状态：</div>&nbsp;<asp:Label ID="Label4" runat="server"></asp:Label></li>
                <li style="width: 100%; line-height: 30px;text-align:left;"><div style="width:120px; text-align:right;float:left;">商铺类型：</div>&nbsp;<asp:Label ID="Label1" runat="server"></asp:Label></li>
                <li style="width: 100%; line-height: 30px;text-align:left;"><div style="width:120px; text-align:right;float:left;">商铺风格模板：</div>&nbsp;<div style="float:left;">
                    <asp:DropDownList ID="SSTDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SSTDownList_SelectedIndexChanged"></asp:DropDownList>
                    <br />
                     <li style="width: 100%; line-height: 30px;text-align:left;"><div style="width:120px; text-align:right;float:left;">缩略图：</div>&nbsp;<div style="float:left;">
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="150px" /></div>
        
                
            </ul>
             <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
            <div class="clear"></div>

<div style="text-align:center;"><asp:Button ID="EBtnSubmit" Text="信息提交" runat="server" OnClick="EBtnSubmit_Click" />
                    &nbsp;
                    <input id="Button1" type="button" value="返  回" onclick="javascript: history.go(-1)" />
    </div>
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </asp:View>
        <asp:View ID="View2" runat="server">该功能尚未开启！</asp:View>
    </asp:MultiView>
</form>
</body>
</html>