function movePage(select)
{
	if(select)
	{
		document.location.replace("?bo_table=" + g4_bo_table + "&select=" + select);
	}
	else
	{
		window.alert("�̿��� �� ���� �������ڸ� �����Ͽ����ϴ�.");
	}
	return;
}

function all_checked(sw)
{
	var f = document.fboardlist;
	for(var i = 0; i < f.length; i++)
	{
		if(f.elements[i].name == "chk_wr_id[]") f.elements[i].checked = sw;
	}
	return;
}

function check_confirm(str)
{
	var f = document.fboardlist;
	var chk_count = 0;
	for(var i = 0; i < f.length; i++)
	{
		if(f.elements[i].name == "chk_wr_id[]" && f.elements[i].checked) chk_count++;
	}
	if(!chk_count)
	{
		alert(str + "�� ���೻���� �����ϼ���.");
		return false;
	}
	return true;
}

function select_delete()
{
	var f = document.fboardlist;
	str = "���";
	if(!check_confirm(str)) return;
	if(!confirm("������ ���೻���� ������ "+str+"�Ͻðڽ��ϱ�?")) return;
	f.action = "./delete_all.php";
	f.submit();
}

function select_copy(sw)
{
	var f = document.fboardlist;
	if(sw == "copy") str = "����";
	else str = "�̵�";
	if(!check_confirm(str)) return;
	var sub_win = window.open("", "move", "left=50, top=50, width=500, height=550, scrollbars=1");
	f.sw.value = sw;
	f.target = "move";
	f.action = "./move.php";
	f.submit();
}

function selectFinish()
{
	var f = document.fboardlist;
	var str = "�Ϸ�";
	if(!check_confirm(str)) return;
	if(!confirm("������ ������ ������ ����Ϸ�� ó���Ͻðڽ��ϱ�?")) return;
	f.sw.value = "true";
	f.action = g4_bbs_skin_path + "/finish.control.php";
	f.submit();
}

function checkFinish(type, page)
{
	if(type == "T")
	{
		window.alert("�ش系���� �̹� ����Ϸ�� ó���Ǿ����ϴ�.");
	}
	else
	{
		if(window.confirm("�ش系���� ����Ϸ�� ó���Ͻðڽ��ϱ�?") == true)
		{
			document.location.replace(page);
		}
	}
	return;
}

function checkPrice(wr_id)
{
	var select = document.forms["write"]["select"].value;
	var use = document.forms["write"]["use[" + wr_id + "]"].value;
	var stay = document.forms["write"]["stay[" + wr_id + "]"].value;
	var person = document.forms["write"]["person[" + wr_id + "]"].value;

	if(use)
	{
		window.alert("�����Ͻ� ������ ������ �Ұ����մϴ�.");
		return false;
	}

	var request = create_request();
	request.onreadystatechange = function()
	{
		if(request.readyState == 4)
		{
			if(request.status == 200)
			{
				document.getElementById("price[" + wr_id + "]").innerHTML = request.responseText;
				checkTotal();
			}
			else
			{
				window.alert("���α׷� ������ �߻��Ͽ����ϴ�.");
			}
		}
	}

	request.open("post", g4_bbs_skin_path + "/check.ajax.php", true);
	request.setRequestHeader("content-type", "application/x-www-form-urlencoded");
	request.send("bo_table=" + g4_bo_table + "&wr_id=" + wr_id + "&select=" + select + "&stay=" + stay + "&person=" + person);
	return;
}

function checkTotal()
{
	var total = 0;
	var result = 0;
	var form = document.getElementById("write");
	var max = form.length;
	for(var i = 0; i < max; i++)
	{
		if(form.elements[i].name == "room[]" && form.elements[i].checked == true)
		{
			var wr_id = form.elements[i].value;
			var price = document.getElementById("price[" + wr_id + "]").innerHTML.replace(/,/g, "");
			total += parseInt(price);
			result++;
		}
	}
	document.getElementById("total").innerHTML = getComma(total);
	return result;
}

function checkWrite()
{
	if(checkTotal() == 0)
	{
		window.alert("������ ������ �ϳ� �̻� �������ּ���.");
		return false;
	}

	var phone = document.forms["write"]["wr_homepage"].value.split("-");
	var pattern = /^[0-9]{3,4}-[0-9]{4}$/;
	var array = new Array("02", "031", "032", "033", "041", "042", "043", "051", "052", "053", "054", "055", "061", "062", "063", "064", "010", "011", "016", "017", "018", "019");
	var max = array.length;
	for(var i = 0; i < max; i++)
	{
		if(array[i] == phone["0"])
		{
			break;
		}
	}
	if(max == i || pattern.test(phone["1"] + "-" + phone["2"]) == false)
	{
		window.alert("����ó�� �ùٸ� ������ �ƴմϴ�.");
		document.forms["write"]["wr_homepage"].focus();
		return false;
	}

	if(window.confirm("���� ���������� ������ �����Ͻðڽ��ϱ�? ") == false)
	{
		return false;
	}
	return;
}

function getComma(string)
{
	var result = string.toString();
	var pattern = new RegExp("(-?[0-9]+)([0-9]{3})");
	for(var i = 0; i < 9; i++)
	{
		if(pattern.test(result))
		{
			result = result.replace(RegExp.$1, RegExp.$1 + ",");
		}
	}
	return result;
}
