<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.indexSearch, App_Web_4bqp0dis" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html runat="server">
<head id="Head1">
<title>搜索结果</title>
<link href="../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<script language="javascript">
    function setEmpty(obj) {
        if (obj.value == "search") {
            obj.value = "";
        }
    }
    function settxt(obj) {
        if (obj.value == "") {
            obj.value = "search";
        }
    }
</script>
<style>#TxtKeyword{ background:url(../Template/Party/style/images/about/search1.jpg) no-repeat; border:none; height:20px; line-height:20px; float:left;}
#btnSearch{ border:none; background:url(../Template/Party/style/images/about/search2.jpg) no-repeat; height:21px;}</style>
</head>
<body runat="server" style="background:#4a4a4a">
<form runat="server" id="myform">
<div id="Div1" runat="server" style="float: left;">
       
      <span style="display:none">  <asp:DropDownList ID="DDLNode" runat="server" Width="100px">
        </asp:DropDownList></span>
        <asp:TextBox ID="TxtKeyword" runat="server" width="82px" onclick="setEmpty(this)" onblur="settxt(this)"
            Text="search"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="" Width="30px" OnClick="btnSearch_Click" />
    </div>
</form>
</body>
</html>