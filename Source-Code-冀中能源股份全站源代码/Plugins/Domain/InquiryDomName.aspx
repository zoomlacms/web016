<%@ page language="C#" autoeventwireup="true" inherits="Plugins_Domain_InquiryDomName, App_Web_fxv1p0b4" masterpagefile="~/Manage/Site/SiteMaster2.master" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="../../dist/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/Common.js"></script>
    <script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../dist/js/bootstrap.min.js"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="pageContent">
    <div style="width:50%;margin-left:20%;margin-top:15px;">
        <div class="panel panel-primary">
                <div class="panel-heading">
                  <h3 class="panel-title">点点鼠标,你就能拥有一个逐浪内核的网站.</h3></div>
                <div class="panel-body">
                <div class="col-lg-6">
                  <div class="input-group" style="line-height:32px; width:320px;">
                    <asp:TextBox runat="server" ID="domNameT" type="text" class="form-control" onkeypress="GetEnterCode('click','checkBtn');" placeholder="二级域名"/>
                     <span class="input-group-btn">
                          <asp:Button runat="server" UseSubmitBehavior="false" ID="checkBtn" OnClick="checkBtn_Click" class="btn btn-default" Text="Go!" ClientIDMode="Static"/>
                    </span><%=GetTDomName() %>
                  </div>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="domNameT" ForeColor="Red" ErrorMessage="请输入子域名!!" Display="Dynamic" SetFocusOnError="true"/>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="domNameT" Display="Dynamic" ForeColor="Red" ErrorMessage="格式错误,最少六位,最多十位" ValidationExpression="^([a-zA-Z]([a-zA-Z0-9]){4,9}$)" />
                </div>
                </div>
              </div>
    </div>
    <div class="modal" runat="server" visible="false" id="regDiv" style="display:block;margin:100px auto;">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close"  aria-hidden="true" data-dismiss="modal" onclick="closeDiv('<%=regDiv.ClientID %>');">×</button><!--data-dismiss="modal"-->
              <h4 class="modal-title">公喜!<asp:Label runat="server" ID="domNameL" />可使用,免费注册帐号,三步完成建站!!!</h4>
            </div>
            <div class="modal-body" id="Div1">
              <p><asp:TextBox runat="server" ID="userNameT" class="form-control" placeholder="用户名" onkeypress="return GetEnterCode('focus','userPwdT');"/></p>
              <p><asp:TextBox runat="server" ID="userPwdT" class="form-control" TextMode="Password" placeholder="密码" autocomplete="off"  onkeypress="GetEnterCode('focus','userPwdT2');"/></p>
              <p><asp:TextBox runat="server" ID="userPwdT2" class="form-control" TextMode="Password" placeholder="确认密码" autocomplete="off" onkeypress="GetEnterCode('click','userRegBtn');"/></p>
            </div>
              <div class="modal-body" id="Div2" style="display:none;">
              <p><asp:TextBox runat="server" ID="TextBox1" class="form-control" placeholder="用户名" onkeypress="GetEnterCode('focus','TextBox2');"/></p>
              <p><asp:TextBox runat="server" ID="TextBox2" class="form-control" TextMode="Password" placeholder="密码" autocomplete="off" onkeypress="GetEnterCode('click','loginBtn');"/></p>
            </div>
            <div class="modal-footer" style="text-align:left;">
                <span id="span1">
                <asp:Button runat="server" ID="userRegBtn" Text="注册" class="btn btn-primary" OnClick="userRegBtn_Click" ClientIDMode="Static" UseSubmitBehavior="false"/>
                <input type="button" value="已有帐号，点击登录" class="btn btn-primary" onclick="disLogin();"/>
                </span>
                <span id="span2" style="display:none;">
                <asp:Button runat="server" ID="loginBtn" Text="登录" class="btn btn-primary" OnClick="loginBtn_Click" ClientIDMode="Static" UseSubmitBehavior="false"/>
                <input id="returnBtn" type="button" value="返回注册页面" class="btn btn-primary" onclick="disReg();"/>
                    </span>
                <span class="alert alert-danger" runat="server" visible="false" id="remindSpan" style="padding:9px;"></span>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
      </div>
    </div>
    <asp:HiddenField runat="server" ID="dataField" ClientIDMode="Static" />
    <script type="text/javascript">
        function closeDiv(id)
        {
            $("#" + id).hide();
        }
        function disLogin()
        {
            $("#Div1").hide();
            $("#span1").hide();
            $("#Div2").show();
            $("#span2").show();
            $("#<%=remindSpan.ClientID%>").text();

        }
        function disReg()
        {
            $("#Div1").show();
            $("#span1").show();
            $("#Div2").hide();
            $("#span2").hide();
            $("#<%=remindSpan.ClientID%>").text();
        }
    </script>
</asp:Content>