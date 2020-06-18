<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_Default, App_Web_tyznpc3g" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="CSS/ZLOA.css" rel="stylesheet" type="text/css" />
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    var months = new Array("一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二");
    var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    var days = new Array("日", "一", "二", "三", "四", "五", "六");
    var classTemp;
    var today = new getToday();
    var year = today.year;
    var month = today.month;
    var newCal;
    function getDays(month, year) {
        if (1 == month) return ((0 == year % 4) && (0 != (year % 100))) || (0 == year % 400) ? 29 : 28;
        else return daysInMonth[month];
    }
    function getToday() {
        this.now = new Date();
        this.year = this.now.getFullYear();
        this.month = this.now.getMonth();
        this.day = this.now.getDate();
    }
    function Calendar() {
        newCal = new Date(year, month, 1);
        today = new getToday();
        var day = -1;
        var startDay = newCal.getDay();
        var endDay = getDays(newCal.getMonth(), newCal.getFullYear());

        var daily = 0;
        if ((today.year == newCal.getFullYear()) && (today.month == newCal.getMonth())) {
            day = today.day;
        }
        var caltable = window.document.getElementById("calendar");

        var intDaysInMonth = getDays(newCal.getMonth(), newCal.getFullYear());

        for (var intWeek = 0; intWeek < caltable.rows.length; intWeek++)

            for (var intDay = 0; intDay < caltable.rows[intWeek].cells.length; intDay++) {
                var cell = caltable.rows[intWeek].cells[intDay];
                var montemp = (newCal.getMonth() + 1) < 10 ? ("0" + (newCal.getMonth() + 1)) : (newCal.getMonth() + 1);
                if ((intDay == startDay) && (0 == daily)) { daily = 1; }
                var daytemp = daily < 10 ? ("0" + daily) : (daily);
                var d = "<" + newCal.getFullYear() + "-" + montemp + "-" + daytemp + ">";
                if (day == daily) cell.className = "DayNow";
                else if (intDay == 6) cell.className = "DaySat";
                else if (intDay == 0) cell.className = "DaySun";
                else cell.className = "Day";
                if ((daily > 0) && (daily <= intDaysInMonth)) {
                    cell.innerHTML = daily;
                    daily++;
                } else {
                    cell.className = "CalendarTD";
                    cell.innerHTML = "";
                }
            }
        document.getElementById("year").value = year;
        document.getElementById("month").value = month + 1;
    }
    function subMonth() {
        if ((month - 1) < 0) {
            month = 11;
            year = year - 1;
        } else {
            month = month - 1;
        }
        Calendar();
    }
    function addMonth() {
        if ((month + 1) > 11) {
            month = 0;
            year = year + 1;
        } else {
            month = month + 1;
        }
        Calendar();
    }
    function setDate() {
        if (document.getElementById("month").value < 1 || document.getElementById("month").value > 12) {
            alert("月的有效范围在1-12之间!");
            return;
        }
        year = Math.ceil(document.getElementById("year").value);
        month = Math.ceil(document.getElementById("month").value - 1);
        Calendar();
    }
    window.onload = function () { document.getElementById("times").innerHTML = (new Date().getHours() < 10 ? "0" + new Date().getHours().toString() : new Date().getHours().toString()) + ":" + (new Date().getMinutes() < 10 ? "0" + new Date().getMinutes().toString() : new Date().getMinutes().toString()) + ":" + (new Date().getSeconds() < 10 ? "0" + new Date().getSeconds() : new Date().getSeconds().toString()); }
    setInterval(function () { document.getElementById("times").innerHTML = (new Date().getHours() < 10 ? "0" + new Date().getHours().toString() : new Date().getHours().toString()) + ":" + (new Date().getMinutes() < 10 ? "0" + new Date().getMinutes().toString() : new Date().getMinutes().toString()) + ":" + (new Date().getSeconds() < 10 ? "0" + new Date().getSeconds() : new Date().getSeconds().toString()); }, 1000);
</script>
<style>
.Calendar { font-family: verdana; text-decoration: none; width: 100%; background-color: #C0D0E8; font-size: 9pt; border: 0px dotted #1C6FA5; }
.CalendarTD { font-family: verdana; font-size: 7pt; color: #000000; background-color: #f6f6f6; height: 20px; width: 11%; text-align: center; }
.Title { font-family: verdana; font-size: 11pt; font-weight: normal; height: 24px; text-align: center; color: #333333; text-decoration: none; background-color: #A4B9D7; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: 1px; border-top-color: #999999; border-right-color: #999999; border-bottom-color: #999999; border-left-color: #999999; }
.Day { font-family: verdana; font-size: 8pt; color: #243F65; background-color: #E5E9F2; height: 20px; width: 11%; text-align: center; }
.DaySat { font-family: verdana; font-size: 8pt; color: #FF0000; text-decoration: none; background-color: #E5E9F2; text-align: center; height: 18px; width: 12%; }
.DaySun { font-family: verdana; font-size: 8pt; color: #FF0000; text-decoration: none; background-color: #E5E9F2; text-align: center; height: 18px; width: 12%; }
.DayNow { font-family: verdana; font-size: 8pt; font-weight: bold; color: #000000; background-color: #FFFFFF; height: 20px; text-align: center; }
.DayTitle { font-family: verdana; font-size: 9pt; color: #000000; background-color: #C0D0E8; height: 20px; width: 11%; text-align: center; }
.DaySatTitle { font-family: verdana; font-size: 9pt; color: #FF0000; text-decoration: none; background-color: #C0D0E8; text-align: center; height: 20px; width: 12%; }
.DaySunTitle { font-family: verdana; font-size: 9pt; color: #FF0000; text-decoration: none; background-color: #C0D0E8; text-align: center; height: 20px; width: 12%; }
.DayButton { font-size: 9pt; font-weight: bold; color: #243F65; cursor: hand; text-decoration: none; }
.r_navigation{ margin-bottom:3px;line-height: 24px;border: 1px solid #4197E2;background: url(../../App_Themes/AdminDefaultTheme/images/localGIF.gif) 10px center #C7E0F6 no-repeat; padding-left:25px;clear: both; }
.r_navdv{ width:100%; font-size:12px;}
.select{ border-top-left-radius:0;border-bottom-left-radius:0;}
</style>
<title>OA办公首页</title>
</head>
<body>
<form id="form1" runat="server">
<div class="oatop">
    <div id="logo" class="pull-left"><a href="/MIS/ZLOA/"><img src="images/logo.png" alt="南昌大学第二附属医院"/></a></div>
    <div class="system pull-left"><span>OA办事系统</span></div>
    <div class="informtion pull-left"><p>耳鼻咽喉-头颈外科|李小明   2014年2月23日   星期日  23:18:38 今日值班：胡大宝</p></div>
    <div class="set pull-right">
        <ul>
            <li class="setli"><a href="#">个人设置</a></li>
            <li class="useli"><a href="#">使用反馈</a></li>
            <li class="helpli"><a href="#">使用帮助</a></li>
            <li class="logout"><a href="#">退出系统</a></li>
        </ul>
    </div>
    <div >
        <div class="input-group pull-right" style="width:300px; margin-top:10px;">
            <asp:TextBox ID="TextBox1" CssClass="form-control pull-left" runat="server" Width="150"></asp:TextBox>
            <span class="input-group-btn" style="width:150px;">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control pull-left select" data-container="body" Width="100">
                    <asp:ListItem Value="1">员工姓名</asp:ListItem>
                    <asp:ListItem Value="2">员工ID</asp:ListItem>
                </asp:DropDownList>
                <button class="btn btn-primary pull-left" type="button"><span class="glyphicon glyphicon-search"></span></button>
            </span>
        </div><!-- /input-group -->
    </div>
    <div class="clearfix"></div>
</div>
<div class="oanav">
    <div>
        <ul>
            <li class="navhome"><a href="#">首页</a></li>
            <li class="navtong"><a href="#">沟通</a></li>
            <li class="navhui"><a href="#">会议</a></li>
            <li class="navgong"><a href="#">工作台</a></li>
            <li class="navuser"><a href="#">会员</a></li>
            <li class="navnus"><a href="#">护理</a></li>
            <li class="navtask"><a href="#">任务管理器</a></li>
            <li class="navsign"><a href="#">签到管理</a></li>
        </ul>
    </div>
</div>
<div class="oamain">
    <table width="100%" cellPadding="0" cellSpacing="0">
        <tr>
            <td style="width: 195px; background-image: none; background-attachment: scroll; background-repeat: repeat; background-position-x: 0%; background-position-y: 0%; background-size: auto; background-origin: padding-box; background-clip: border-box; background-color: rgb(207, 232, 254);"><div class="oamain_left pull-left">
        <div class="left_user">
            <div class="userimg pull-left"><img src="images/userimg.jpg" alt="" /></div>
            <div class="userinfo pull-right">
                <strong>张学武</strong><br />
                <span>集团账号：95165418418</span><br />
                <span>成员编号：601</span>
            </div>
            <table style="width:100%;" class="border">
                <tr align="left">
                    <td colspan="2" class="spacingtitle"><asp:Label ID="LblTitle" runat="server" Text="日历" Font-Bold="True"></asp:Label><a href="../../Common/SelectChinaDay.html">[<%=lang.Get("m_Worktables_calendar")%>]</a></td>
                </tr>
                <tr class="tdbg">
                    <td class="tdbgleft" colspan="2" align="left">
                        <script language="javascript" type="text/javascript">
                            function getEvent() {
                                if (document.all) {
                                    return window.event; //如果是ie
                                }
                                func = getEvent.caller;
                                while (func != null) {
                                    var arg0 = func.arguments[0];
                                    if (arg0) {
                                        if ((arg0.constructor == Event || arg0.constructor == MouseEvent) || (typeof (arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
                                            return arg0;
                                        }
                                    }
                                    func = func.caller;
                                }
                                return null;
                            }
                            function buttonOver() {
                                var evt = getEvent();
                                var obj = evt.srcElement || evt.target;
                                //obj.runtimeStyle.cssText = "background-color:#FFFFFF";
                            }

                            function buttonOut() {
                                var obj = window.event.srcElement;
                                //window.setTimeout(function() { obj.runtimeStyle.cssText = ""; }, 300);
                            }
                        </script>
                        <table border="0" cellpadding="0" cellspacing="1" class="Calendar" id="caltable" name="caltable">
                        <thead>
                            <tr align="center" valign="middle">
                            <td colspan="7" class="title"><a href="javaScript:subMonth();" title="上一月" class="DayButton"><%=lang.Get("m_Worktables_last")%></a>
                                <input name="year" id="year" type="text" size="4" maxlength="4" onkeydown="if (event.keyCode==13){setDate()}"  onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onpaste="this.value=this.value.replace(/[^0-9]/g,'')" />
                                <%=lang.Get("m_Worktables_year")%>
                                <input name="month" id="month" type="text" size="1" maxlength="2" onkeydown="if (event.keyCode==13){setDate()}"  onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onpaste="this.value=this.value.replace(/[^0-9]/g,'')" />
                                <%=lang.Get("m_Worktables_month")%> <a href="JavaScript:addMonth();" title="下一月" class="DayButton"><%=lang.Get("m_Worktables_next")%></a></td>
                        </tr>
                            <tr align="center" valign="middle"> 
            <script language="JavaScript">
                document.write("<TD class=\"DaySunTitle\" id=\"diary\" name=\"diary\" >" + days[0] + "</TD>");
                for (var intLoop = 1; intLoop < days.length - 1; intLoop++) {
                    document.write("<TD class=\"DayTitle\" id=\"diary\" name=\"diary\">" + days[intLoop] + "</TD>");
                }
                document.write("<TD class=\"DaySatTitle\" id=\"diary\" name=\"diary\" >" + days[intLoop] + "</TD>");
            </script> 
                        </tr>
                        </thead>
                        <tbody style="border: 1;" id="calendar" name="calendar" align="CENTER" onclick="getDiary()">
            <script language="JavaScript">
                for (var intWeeks = 0; intWeeks < 6; intWeeks++) {
                    document.write("<TR style=\"cursor: hand\">");
                    for (var intDays = 0; intDays < days.length; intDays++) document.write("<TD class=\"CalendarTD\" onMouseover=\"buttonOver();\" onMouseOut=\"buttonOut();\"></TD>");
                    document.write("</TR>");
                }
                </script>
                        </tbody>
                    </table>
                        <script type="text/javascript">
                            Calendar();
                        </script>
                    </td>
                </tr>
            </table>
            <div class="clearfix"></div>
            <div class="duty">
                <div class="duty_t">
                    <div class="duty_tp"><span class="fork pull-right"></span><span class="oaarrow pull-right"></span><strong>医院值班</strong></div>
                </div>
                <div class="duty_c">
                    <p>今日：2014年2月28日  /  星期五</p>
                    <span>院领导：[领导名字]</span><br />
                    <span>总值班：张锦鹏</span><br />
                    <span>夜查房：胡小明  李小风 张小宇</span>
                </div><div class="clearfix"></div>
            </div>
        </div>
        <div class="commonuser">
            <div class="common_t">
                <div class="duty_tp"><span class="fork pull-right"></span><span class="oaarrow pull-right"></span><strong>常用联系人</strong></div>
            </div>
            <div class="common_c">
                <ul style="margin-bottom:0;">
                    <li><img src="images/cuser.jpg" alt="" /><a href="#">暴风杨立东</a></li>
                    <li><img src="images/cuser.jpg" alt="" /><a href="#">暴风杨立东</a></li>
                    <li><img src="images/cuser.jpg" alt="" /><a href="#">暴风杨立东</a></li>
                    <li><img src="images/cuser.jpg" alt="" /><a href="#">暴风杨立东</a></li>
                </ul>
            </div>
        </div>
        <div class="ask">
            <ul style="margin-bottom:0;">
                <li style="border-bottom:1px solid #35358A;"><a href="#" >职工问卷</a></li>
                <li><a href="#" >医院网站</a></li>
            </ul>
        </div>
        <div class="commonuser">
            <div class="history_t">
                <div class="duty_tp"><span class="fork pull-right"></span><span class="oaarrow pull-right"></span><strong>最近访问记录</strong></div>
            </div>
            <div class="history_c">
                <ul style="margin-bottom:0;">
                    <li><a href="#">合同</a></li>
                    <li><a href="#">申请</a></li>
                    <li><a href="#">日程安排</a></li>
                    <li><a href="#">报告管理</a></li>
                    <li><a href="#">客户信息</a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div></td>
            <td>
                <div id="main_right_frame" class="oamain_right pull-right">
        <iframe id="main_right" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden;width: 100%;" height="100%" name="main_right" src="/" frameborder="0" onload="SetTabTitle(this)" tabid="1"></iframe>
    </div>
            </td>
        </tr>
    </table>
    
    
</div>
</form>
<script>
document.getElementById("main_right_frame").style.width = document.documentElement.clientWidth - 205;
</script>
</body>
</html>
