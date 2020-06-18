<%@ page language="C#" autoeventwireup="true" inherits="Manage_Site_DataManage, App_Web_l4ylrmou" masterpagefile="~/Manage/Site/SiteMaster.master" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="/dist/js/bootstrap.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $(":button").addClass("btn btn-primary");
            $(":submit").addClass("btn btn-primary");
            $("#EGV tr:last >td>:text").css("line-height", "normal");
            $("#EGV tr:first >th").css("text-align", "center");
        });
    </script>
    <style type="text/css">
        #EGV tr th {color:black;background:url(""); }
        #nav_site {background:white;}
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site" style="margin-top:15px;"><p style="float: left;">站群中心 >> <a href="DBManage.aspx">数据库管理</a>(仅用于<a href="/Plugins/Domain/InquiryDomName.aspx" target="_blank" style="color:blue;">智能建站</a>生成的数据库)</p></div>
    <div id="site_main" style="margin-top: 5px;">
        <div class="input-group" style=" width:400px;float:left;margin-bottom:10px;">
            <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" CssClass="form-control"/>
            <span class="input-group-btn">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click"/>
            </span>
        </div>
        <div class="tab3">
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="98%" CssClass="table border" EmptyDataText="当前没有信息!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" />
                    <asp:BoundField HeaderText="数据库名" DataField="DBName"/>
                    <asp:BoundField HeaderText="站点名" DataField="SiteName" />
                    <asp:BoundField HeaderText="用户名" DataField="UserName" />
                    <asp:BoundField HeaderText="创建时间" DataField="CreateTime" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">
                                <img src="/App_Themes/AdminDefaultTheme/images/del.png" /></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                   </Columns>
                    <PagerStyle HorizontalAlign="Center"/>
                   <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
    </div>
</asp:Content>