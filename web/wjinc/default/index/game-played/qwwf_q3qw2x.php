<input type="hidden" name="playedGroup" value="<?=$this->groupId?>" />
<input type="hidden" name="playedId" value="<?=$this->played?>" />
<input type="hidden" name="type" value="<?=$this->type?>" />
<div class="unique">
    <div class="pp pp11" action="qwwf" length="3">
        <div class="title"><?=$var?>万位</div>
		&nbsp;
		<input type="button" value="小" class="code reset2" style="width:188px"/>
	    <input type="button" value="大" class="code reset2" style="width:188px"/>
    </div>

	<div class="pp pp11">
        <div class="title"><?=$var?>千位</div>
        &nbsp;
		<input type="button" value="0" class="code s min" />
        <input type="button" value="1" class="code d min" />
        <input type="button" value="2" class="code s min" />
        <input type="button" value="3" class="code d min" />
        <input type="button" value="4" class="code s min" />
        <input type="button" value="5" class="code d min" />
        <input type="button" value="6" class="code s max" />
        <input type="button" value="7" class="code d max" />
        <input type="button" value="8" class="code s max" />
        <input type="button" value="9" class="code d max" />
    
        &nbsp;&nbsp;
        
        <input type="button" value="清"  class="action none" />
        <input type="button" value="双"  class="action even" />
        <input type="button" value="单"  class="action odd" />
        <input type="button" value="小"  class="action small" />
        <input type="button" value="大"  class="action large" />
        <input type="button" value="全"  class="action all" />
    </div>

	<div class="pp pp11">
        <div class="title"><?=$var?>百位</div>
        &nbsp;
		<input type="button" value="0" class="code s min" />
        <input type="button" value="1" class="code d min" />
        <input type="button" value="2" class="code s min" />
        <input type="button" value="3" class="code d min" />
        <input type="button" value="4" class="code s min" />
        <input type="button" value="5" class="code d min" />
        <input type="button" value="6" class="code s max" />
        <input type="button" value="7" class="code d max" />
        <input type="button" value="8" class="code s max" />
        <input type="button" value="9" class="code d max" />
    
        &nbsp;&nbsp;
        
        <input type="button" value="清"  class="action none" />
        <input type="button" value="双"  class="action even" />
        <input type="button" value="单"  class="action odd" />
        <input type="button" value="小"  class="action small" />
        <input type="button" value="大"  class="action large" />
        <input type="button" value="全"  class="action all" />
    </div>
<?php
	$maxPl=$this->getPl($this->type, $this->played);
?>
</div>

<script type="text/javascript">
$(function(){
	gameSetPl(<?=json_encode($maxPl)?>);
})
</script>

