<%@ page language="C#" autoeventwireup="true" inherits="Plugins_Domain_ViewProduct, App_Web_fxv1p0b4" masterpagefile="~/Manage/Site/OptionMaster.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
 <style type="text/css">
.redStar {color: #ff0000;padding: 0 0 0 3px;}
#site_nav .site10 a {background: url(../../App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat;}
.border_line{ background:url(../../App_Themes/AdminDefaultTheme/images/site/menu_bg.jpg) repeat-x; height:43px;}
.nochoose, .choose{	width: 100px;height: 22px;padding-bottom: 1px;padding-left: 1px;padding-right: 1px;padding-top: 1px;font-weight: normal;cursor: pointer;/*line-height: 120%;*/ font-size:14px;}
.nochoose { color: #ffffff;}
.choose{ background:#03a1f0;color: #ffffff; font-weight:bold;}
</style>
    <script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<title>浏览服务</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
<div id="m_site"><p style="float:left;"> 站群中心 >> 用户中心 >> 浏览服务</p></div>
<div id="site_main" style="margin-top:15px;">
    <div id="tab3">
        <div id="viewDiv" runat="server">
        服务搜索：<asp:TextBox runat="server" CssClass="site_input" ID="keyWord"  />
                     <asp:Button runat="server" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click" CssClass="site_button"/>
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" RowStyle-CssClass="tdbg"  OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand"
             CellPadding="2" CellSpacing="1" Width="100%" OnRowCancelingEdit="EGV_RowCancelingEdit" PageSize="10"
            GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！"  AllowSorting="True" CheckBoxFieldHeaderWidth="3%" EnableModelValidation="True" IsHoldState="false" SerialText="">
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
                <Columns>
                     <asp:BoundField HeaderText="序号" DataField="ID" ReadOnly="true" />
                       <asp:TemplateField HeaderText="品名">
                        <ItemTemplate>
                           <%#Eval("ProName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="单价" DataField="ShiPrice"/>
                    <asp:TemplateField HeaderText="服务期限">
                        <ItemTemplate>
                            <%#GetServerPeriod(Eval("ServerPeriod"),Eval("ServerType"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="简述" DataField="ProInfo"/>
                     <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton runat="Server" CommandArgument='<%#Eval("ID") %>' CommandName="wantPay">购买</asp:LinkButton>
                            <a href="/Shop.aspx?ItemID=<%#Eval("ID") %>" target="_viewDetail">查看详情</a>
                        </ItemTemplate>
                     </asp:TemplateField>
                </Columns>
        </ZL:ExGridView>
        </div>
    <div runat="server" id="payDiv" visible="false">
        <table>
            <tr><td>品名：</td><td> <asp:Label runat="server" ID="proNameL" /><asp:HiddenField runat="server" ID="dataField"></asp:HiddenField></td></tr> 
            <tr><td>单价：</td><td> <asp:Label runat="server" ID="proPrice"></asp:Label></td></tr> 
            <tr><td>简述：</td><td> <asp:Label runat="server" ID="proDetail" Height="150"></asp:Label></td></tr>
            <tr><td>数量：</td><td> <asp:TextBox runat="server" ID="proNum" Text="1" Width="30"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="proNum" ValidationGroup="add" ForeColor="Red" Display="Dynamic" ErrorMessage="不能为空" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="proNum" ValidationGroup="add" ForeColor="Red" Display="Dynamic" ErrorMessage="只能是数字" ValidationExpression="^\d+$" />
                            </td></tr> 
            <tr><td>操作：</td><td> 
                <asp:Button runat="server" ID="sureBtn" Text="确定" OnClick="sureBtn_Click" ValidationGroup="add"/> 
                <input type="button" value="返回" onclick="location = location;" /></td></tr> 
        </table>
    </div>
</div>
</div>
    <script type="text/javascript">
        $().ready(function () {
            $(":text").addClass("site_input");
            $(":submit").addClass("site_button");
            $(":button").addClass("site_button");
        });
    </script>
</asp:Content>