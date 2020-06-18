<%@ page language="C#" autoeventwireup="true" inherits="Plugins_Domain_ViewHave, App_Web_fxv1p0b4" masterpagefile="~/Manage/Site/OptionMaster.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">

</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site"><p style="float:left;"> 站群中心 >> 用户中心 >> 浏览已购服务</p></div>
<div id="site_main" style="margin-top:15px;">
                <span>
            <span style="float:left">
        服务搜索：<asp:TextBox runat="server" CssClass="site_input" ID="keyWord"  />
                     <asp:Button runat="server" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click" CssClass="site_button"/></span>
            <span>
            <asp:RadioButtonList runat="server" ID="disChk" AutoPostBack="true" OnSelectedIndexChanged="disChk_SelectedIndexChanged" RepeatDirection="Horizontal">
                <asp:ListItem Value="0" Selected="True">显示全部(不包含未付款)</asp:ListItem>
                <asp:ListItem Value="1">生效中</asp:ListItem>
                <asp:ListItem Value="2">已过期</asp:ListItem>
                <asp:ListItem Value="3">未付款</asp:ListItem>
            </asp:RadioButtonList> </span></span>
    <div id="tab3">
        <div id="viewDiv" runat="server">

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
                    <asp:BoundField HeaderText="金额" DataField="AllMoney"/>
                    <asp:BoundField HeaderText="绑定主机" DataField="Internalrecords"/>
                    <asp:TemplateField HeaderText="购买日期">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem,"AddTime", "{0:yyyy年M月d日}") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="到期日期">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem,"EndTime", "{0:yyyy年M月d日}")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="/Shop.aspx?ItemID=<%#Eval("ProID") %>" target="_viewDetail">查看详情</a>
                        </ItemTemplate>
                     </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" Visible="false">
                         <ItemTemplate>
                            <a href="/OrderOver.aspx?OrderCode=<%#Eval("OrderNo") %>">完成支付</a>
                            <a href="/Shop.aspx?ItemID=<%#Eval("ProID") %>" target="_viewDetail">查看详情</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
        </ZL:ExGridView> </div>
    </div>
    </div>
</asp:Content>