<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="icon" href="images/favicon.png">
<title>ASUS Wireless Router <#Web_Title#> - <#menu5_6_1_title#></title>
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">

<script language="JavaScript" type="text/javascript" src="/jquery.js"></script>
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" language="JavaScript" src="/help.js"></script>
<script>
var $j = jQuery.noConflict();

<% login_state_hook(); %>

function initial(){
	show_banner(2);
	
	show_menu(5,8,3);
	
	show_footer();

	if(sw_mode=="1" || sw_mode=="3"){
		$('wl_rt').style.display="";
		$('rt_wo_nat').style.display="none";
	}else if(sw_mode=="4"){
		$('wl_rt').style.display="none";
		$('rt_wo_nat').style.display="";
	}
	
	setScenerion(sw_mode);
}

function saveMode(){
	if(sw_mode == "1"){
		if(document.form.sw_mode[0].checked == true){
			alert("<#op_already_configured#>");
			return false;
		}
	}else if(sw_mode == "4"){
		if(document.form.sw_mode[1].checked == true){
			alert("<#op_already_configured#>");
			return false;
		}
	}else if(sw_mode == "3"){
		if(document.form.sw_mode[2].checked == true){
			alert("<#op_already_configured#>");
			return false;
		}
	}

	showLoading();

	document.form.action_mode.value = " Apply ";
	document.form.current_page.value = "Advanced_OperationMode_Content.asp";
	document.form.next_page.value = "";

	document.form.submit();
}

function done_validating(action){
	refreshpage();
}

function setScenerion(mode){
	if(mode == '1' || mode == '4'){
		$j("#radio2").hide();
		$j("#Internet_span").css("display", "");
		$j("#ap-line").css("display", "none");
		$j(".AP").hide();
		$j("#mode_desc").html("<#OP_GW_desc1#><#OP_GW_desc2#>");
		$j("#nextButton").attr("value","<#CTL_next#>");
	}
	else if(mode == '3'){
		$j("#radio2").css("display", "none");
		$j("#Internet_span").css("display", "");
		$j("#ap-line").css("display", "none");
		$j(".AP").show();
		$j("#mode_desc").html("<#OP_AP_desc1#><#OP_AP_desc2#>");
		$j("#nextButton").attr("value","<#CTL_next#>");
	}
}

</script>

<style>
table {width: 100%;}
table td {text-align: center; }
</style>

</head>

<body onload="initial();" onunLoad="return unload_body();">

<div class="wrapper">
    <div class="container-fluid" style="padding-right: 0px">
        <div class="row-fluid">
            <div class="span3"><center><div id="logo"></div></center></div>
            <div class="span9" >
                <div id="TopBanner"></div>
            </div>
        </div>
    </div>

    <div id="Loading" class="popup_bg"></div>

    <iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>

    <form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">
    <input type="hidden" name="sid_list" value="IPConnection;">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="modified" value="0">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="prev_page" value="">
    <input type="hidden" name="current_page" value="/Advanced_OperationMode_Content.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="flag" value="">
    <input type="hidden" name="lan_ipaddr" value="<% nvram_get_x("", "lan_ipaddr"); %>">

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span3">
                <!--Sidebar content-->
                <!--=====Beginning of Main Menu=====-->
                <div class="well sidebar-nav side_nav" style="padding: 0px;">
                    <ul id="mainMenu" class="clearfix"></ul>
                    <ul class="clearfix">
                        <li>
                            <div id="subMenu" class="accordion"></div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="span9">
                <!--Body content-->
                <div class="row-fluid">
                    <div class="span12">
                        <div class="box well grad_colour_dark_blue">
                            <h2 class="box_head round_top"><#menu5_6#> - <#t2OP#></h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                        <div style="margin-left: 10px; margin-top: 10px;">
                                            <div class="controls">
                                                <label class="radio inline"><div id="wl_rt" style="display:none;"><input type="radio" name="sw_mode" class="input" value="1" onclick="setScenerion(1);" <% nvram_match_x("IPConnection", "sw_mode", "1", "checked"); %>><#OP_GW_item#></div></label>
                                                <label class="radio inline"><div id="rt_wo_nat" style="display:none;"><input type="radio" name="sw_mode" class="input" value="4" onclick="setScenerion(4);" <% nvram_match_x("IPConnection", "sw_mode", "4", "checked"); %>><#OP_GW_item#></div></label>
                                                <label class="radio inline"><div id="wl_ap"><input type="radio" name="sw_mode" class="input" value="3" onclick="setScenerion(3);" <% nvram_match_x("IPConnection", "sw_mode", "3", "checked"); %>><#OP_AP_item#></div></label>
                                            </div>

                                            <div id="mode_desc" style="margin-left: 0px; margin-top: 10px; margin-right: 10px;" class="alert alert-info"><#OP_GW_desc1#></div>
                                        </div>

                                        <div style="margin-top: 10px; margin-right: 10px; margin-left: 10px;">
                                            <center><div id="Senario" class="span12" style="height: 170px;">
                                                <div class="row-fluid">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td><span class="label"><#Wireless_Clients#></span></td>
                                                            <td>&nbsp;</td>
                                                            <td><span class="label label-info"><#Web_Title#></span></td>
                                                            <td class="AP">&nbsp;</td>
                                                            <td class="AP"><span class="label"><#Device_type_02_RT#></span></td>
                                                            <td>&nbsp;</td>
                                                            <td id="Internet_span"><span class="label"><#Internet#></span></td>
                                                        </tr>
                                                        <tr>
                                                            <td><img src="bootstrap/img/wl_device/clients.png"></td>
                                                            <td><img src="bootstrap/img/wl_device/arrow-left.png"></td>
                                                            <td><img src="bootstrap/img/wl_device/n56u.png"></td>
                                                            <td class="AP"><img src="bootstrap/img/wl_device/arrow-left.png"></td>
                                                            <td class="AP"><img src="bootstrap/img/wl_device/server.png"></td>
                                                            <td><img src="bootstrap/img/wl_device/arrow-left.png"></td>
                                                            <td><img src="bootstrap/img/wl_device/globe.png"></td>
                                                        </tr>
                                                    </table>
                                                </div>

                                                <div id="ap-line" style="display: none;position: absolute; margin-left: -10000px"></div>
                                            </div></center>
                                        </div>

                                        <center><input name="button" type="button" class="btn btn-primary" style="width: 219px;" onClick="saveMode();" value="<#CTL_onlysave#>"></center>
                                        <br/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </form>

    <div id="footer"></div>
</div>
</body>
</html>
