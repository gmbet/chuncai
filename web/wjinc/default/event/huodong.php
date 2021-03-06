<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php $this->display('inc_skin.php', 0 , '优惠活动－活动中心'); ?>
</head>
<?php
$data = array();
if($this->settings['huoDongRegister']){
    $data[] = 'huoDongRegister';
}
if($this->settings['rechargeCommissionAmount']){
    $data[] = 'rechargeCommissionAmount';
}
if($this->settings['conCommissionBase']){
    $data[] ='conCommissionBase';
}
//首冲充值活动
$rdata = $this->getRows("select * from {$this->prename}events where enable=1 and isdelete=0 and state=0");
if($rdata){
    //活动是否过期
    foreach($rdata as $k=>$val)
    {
        if($val['end_time'] && $val['end_time'] < $this->time){
            $this->update("update {$this->prename}events set `state`=1,`enabled`=0 where id={$val['id']}");
            unset($rdata[$k]);
        } else{
            $data[] = $rdata[$k];
        }
    }
}
?>
<body>
<?php $this->display('inc_header.php'); ?>
<div id="rightcon">
            <div class="head-box">
                <div class="haed-box-wrapper">
                    <div class="head-box-bg1" id="transform"></div>
                    <div class="head-box-bg2" id="transform"></div>
                    <div class="head-box-bg3"></div>
                </div>
            </div>
            <div class="wrapper bigbox">
<div class="page-wrapper">
    <p id="page-title"><span class="fa fa-bullhorn"></span>优惠活动</p>
    <div class="top_menu">
        <a class="act" href="<?=$this->basePath('Event-huodong') ?>">优惠活动</a>
        <a href="<?= $this->basePath('Deposit-main') ?>">余额宝</a>
         <!--<a href="<?= $this->basePath('ChouJiang-main') ?>">抽奖</a>
        <a href="<?= $this->basePath('Event-shuiguoji') ?>">水果机</a>-->
    </div>
    <div class="page-info">
	  <div class="page_list">
	   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <?php if($data){?>
        <?php foreach($data as $k=>$item){?>
        <tr>
            <td class="huodongtitlebg">
                <div>活动&nbsp;<?=$x = $k+1?></div>
            </td>
        </tr>
        <tr>
            <td class="hd1bg">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top" class="padding_left10 lineheight28">
                            <?php if(is_string($item) && $item=='huoDongRegister'){?>
                            <span class="fontgreen">活动时间：永久</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span class="fontbule">活动名称：赠送活动</span><br/>
                            活动说明：<br/>
                            首次注册绑定银行卡（仅限工行）送<?= $this->settings['huoDongRegister'] ?>元 每天签到每次送<?= $this->settings['huoDongSign'] ?>元
                            <?php }elseif(is_string($item) && $item=='rechargeCommissionAmount'){?>
                            <span class="fontgreen">活动时间：永久</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span class="fontbule">活动名称：充值佣金活动</span><br/>
                            活动说明：<br/>
                            每天首次充值金额<?=$this->settings['rechargeCommissionAmount']?>元以上，上家送<?=$this->settings['rechargeCommission']?>元佣金，上上家送<?=$this->settings['rechargeCommission2']?>元佣金
                            <?php }elseif(is_string($item) && $item=='conCommissionBase'){?>
                            <span class="fontgreen">活动时间：永久</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span class="fontbule">活动名称：消费佣金活动</span><br/>
                            活动说明：<br/>
                            每天消费达<?=$this->settings['conCommissionBase']?>元时，上家送<?=$this->settings['conCommissionParentAmount']?>元佣金，上上家送<?=$this->settings['conCommissionParentAmount2']?>元佣金
                            <?php }elseif(is_array($item)){?>
                            <?php
                                $today = date('Y-m-d',$this->time);
                                $start = strtotime($today);
                                $end = $start+3600*12*2;
                                $ret = $this->getRow("select * from {$this->prename}event_sign where `uid`={$this->user['uid']} and `goodId`={$item['id']} and `state` IN (0,1) and `isdelete`=0 and `c_time` between {$start} and {$end} order by c_time desc");
                            ?>
                            <span class="fontgreen">活动时间：<?=$item['end_time'] ? date('Y-m-d',$item['start_time']).'~'.date('Y-m-d',$item['end_time']) : '每天'?></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span class="fontbule">活动名称：<?=$item['title']?></span><br/>
                            活动说明：<br/>
                                <?php
                                $condition = explode("|",$item['condition']);
                                $rate = explode("|",$item['rate']);
                                $tplMain = <<<TPL
            每日首次充值 %s 元以上（最高可以领取 %s ）<br/>
                    %s

TPL;
                                $tplTip = <<<TIP
       %s %s：%s 倍流水可领取首次充值金额 %s ％的活动礼金;<br/>
TIP;
                                $radio = "<input type='radio' name='chose_".$item['id']."' %s value='%s'/>";
                                $html ="";
                                for($i=0;$i<count($condition);$i++)
                                {
                                    $checked = ($ret['rate_value']) ==$i ? "checked" : "";

                                    $input =sprintf($radio, $checked, $i);
                                    $html .= sprintf($tplTip, $input, $i+1, $condition[$i],$rate[$i]);
                                }
                                $html = sprintf($tplMain, $item['coin'], $item['max_rebate'], $html);

                                if(!$ret){?>
                                <?=$html?>
                                <button onclick="hdSign(<?=$item['id']?>,<?=$this->user['uid']?>,'chose_<?=$item["id"]?>')" style="width:95px; height:28px;  border:0; background:url('/images/common/hd_sign.png') no-repeat left top; margin-top:10px">&nbsp;</button>
                                <?php }else{?>
                                    <?=$html?>
                                <button onclick="hdGet(<?=$item['id']?>,<?=$this->user['uid']?>,'chose_<?=$item["id"]?>')" style="width:95px; height:28px;  border:0; background:url('/images/common/hd_get.png') no-repeat left top; margin-top:10px">&nbsp;</button>
                                <?php }?>
                            <?php }?>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <?php } ?>
        <?php } ?>
        <?php 
        $adata = $this->getRows("select * from {$this->prename}activity where enable=1 and isdelete=0 order by id");
        if($adata){?>
        <?php foreach($adata as $key=>$var){?>
        <tr>
            <td class="huodongtitlebg">
                <div>活动&nbsp;<?=$x = $x+1?></div>
            </td>
        </tr>
        <tr>
            <td class="hd1bg">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top" class="padding_left10 lineheight28">
                            <span class="fontgreen">活动时间：<?=$this->iff($var['stop'], (date('Y-m-d',$var['start']).' -- '.date('Y-m-d',$var['stop'])), "永久") ?></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span class="fontbule">活动名称：<?=$var['name'] ?></span><br/>
                            活动说明：<br/>
        <?=$var['des'] ?>
 
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <?php } ?>
        <?php } ?>
    </table>
	  </div>
    </div>
</div>
</div>
</div><?php $this->display('inc_footer.php'); ?>
</body>
</html>
  
   
 