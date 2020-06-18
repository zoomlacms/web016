// CheckBox,Radio,Select等JS文件,以后相关的方法放这

function CheckExcBox(box)    
{
   for (var i=0;i<document.form1.elements.length;i++)
   {
      var e = document.form1.elements[i];
      if ( (e.type=='checkbox') )
        {                    
           var o=e.name.lastIndexOf('ChkSelect');
                   
           if(o!=-1)
           {
			    e.checked = box.checked;
           }
         }
    }      
    if(document.form1.checkSel.checked==true)
    {
		ShowA.innerHTML="取消选择";
	}
	else
	{
		ShowA.innerHTML="选择全部";
	}
}
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
//-------------Add By Coffee
function IsSelectByName(n)
{
    return $("input[name='" + n + "']:checked").length > 0;
}
//全选
function selectAllByName(obj, name) {
    var allInput = document.getElementsByName(name);
    var loopTime = allInput.length;
    for (i = 0; i < loopTime; i++) {
        if (allInput[i].type == "checkbox") {
            allInput[i].checked = obj.checked;
        }
    }
}