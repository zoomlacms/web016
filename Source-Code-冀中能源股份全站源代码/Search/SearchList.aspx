<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.SearchList, App_Web_mywf2rm4" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head id="Head1" runat="server">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>搜索结果</title>
<link href="../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../App_Themes/AdminDefaultTheme/V3.css" rel="stylesheet" />
<link href="/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/dist/css/bootstrap-select.css">
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script src="../JS/jquery-1.9.1.min.js"></script>
<script src="../dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(window).on('load', function () {

        $('.selectpicker').selectpicker({
            'selectedText': 'cat'
        });

        // $('.selectpicker').selectpicker('hide');
    });
</script>
<script language="javascript">
    function setEmpty(obj) {
        if (obj.value == "请输入关键字") {
            obj.value = "";
        }
    }
    function settxt(obj) {
        if (obj.value == "") {
            obj.value = "请输入关键字";
        }
    }
</script>
</head>
<body id="Body1" runat="server">
    <form runat="server" id="myform">
     <div id="s_nav"><a href="../">网站首页</a><a href="/guest/">留言咨询</a></div>
    <div id="s_top" runat="server">
        <a href="<%Call.Label("{$SiteURL/}"); %>" target="_blank"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a>
        <div id="Div1" runat="server" style="float: left; width: 500px; margin-top: 40px;">
            <div class="pull-left">
                <span class="pull-left searchtxt">
                    站内搜索
                </span>
                <asp:DropDownList ID="DDLNode" runat="server" Width="230" CssClass="form-control pull-right"></asp:DropDownList>
            </div>
            <div class="input-group pull-right" style="width:200px;">
                <asp:TextBox ID="TxtKeyword" runat="server" Width="150" Text="请输入关键字" CssClass="form-control"></asp:TextBox>
                <span class="input-group-btn">
                    <asp:Button ID="Button1" runat="server" Text="搜  索" OnClick="Button1_Click"  CssClass="btn btn-default"/>
                </span>
            </div>
        </div>
    </div>
    
    <div id="s_title">
	<%--<span>一共为您找到标题为[<%=GetKeyWord() %>]关键词的信息共<%=GetCommModelCount() %>篇</span> --%>
    <%--<span>一共为您找到标题为<label runat="server" id="lbr"></label>的信息<%=GetCommModelCount() %>篇</span> --%>
    <span>一共为您找到标题为<%=getkeys() %>的信息<%=GetCommModelCount() %>篇</span> 
您的位置：<a href="/"><asp:Literal ID="sitename" runat="server"></asp:Literal></a>>><a  href="../../Search/indexsearch.aspx">信息搜索</a>
    </div>

    <div id="s_main">
        <div id="s_main_l">
            <ul>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                <li><strong> <a href="<%# GetUrl(Eval("GeneralID","{0}")) %>" style=" font-size:18px;" target="_blank" alt="<%#toRed(Eval("Title").ToString()) %>"><%#toRed(Eval("Title").ToString()) %></a></strong>
                    <%--<p><%#Eval("TagKey") %></p>--%>
                    <p><%#toRed(Eval("TagKey").ToString())%></p>
                    <span>发表时间：<%#Eval("CreateTime") %>
                    <a href="<%# GetUrl(Eval("GeneralID","{0}")) %>" target="_blank">访问详情>></a></span>
                </li>
					</ItemTemplate>
                </asp:Repeater>
            </ul>

        <div id="PShow" runat="server" visible="false">
            <pre><%--<span style="color:Blue"><%=key%></span>--%>
             抱歉，没有找到与<%=getkeys() %>相关的内容，
             搜索建议您： 看看输入的文字是否有误! 
             去掉可能不必要的字词:如"的","什么"等
            </pre>
        </div>
        <div id="nonemsg" runat="server" visible="false" style=" text-align:center">
            <h3>没有输入查询关键字</h3>
        </div>

        </div>

        <div id="s_main_r">
            <span>按栏目搜索:</span>

            <script language="javascript">
                function searchList(nodeid) {
                    var keyWord = document.getElementsByName("TxtKeyword").item(0).value;
                    if (keyWord == "请输入关键字") {
                        keyWord = "";
                    }
                    parent.location = "SearchList.aspx?node=" + nodeid + "&keyWord=" + keyWord;
                }
            </script>

            <asp:Repeater ID="nodeList" runat="server">
                <ItemTemplate>
                    <ul>
                        <li><a href="javascript:searchList(<%#Eval("nodeid") %>)">
                            <%#Eval("NodeName") %>
                        </a></li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="cleardiv"></div>
    </div>
    
    
    <div id="Pager1" runat="server"></div>
    
    <div id="s_bottom" style=" clear:both; text-align:center; width:100%;">
        
    </div>
    
    <div id="s_copyrigt" style=" margin:auto">
        &copy;<script type="text/javascript" language="JavaScript">
<!--
            var year = ""; mydate = new Date(); myyear = mydate.getYear(); year = (myyear > 200) ? myyear : 1900 + myyear; document.write(year);
--> 
        </script>
        <a href="<%Call.Label("{$SiteURL/}"); %>" target="_blank"><%Call.Label("{$SiteName/}"); %></a>
    </div>
</form>
</body>
</html>