<div class="<?php echo $prefix; ?> box newsletter_block" id="newsletter_<?php echo $position.$module;?>">
	<div class="box-heading"><span><?php echo $this->language->get("entry_newsletter");?></span></div>
	<div class="description"><?php echo html_entity_decode(utf8_substr( strip_tags($description),0,58));?>...</div>
	<div class="block_content">
			<form id="formNewLestter"method="post" action="<?php echo $action; ?>">
			<p>
				<input type="text" class="inputNew" <?php if(!isset($customer_email)): ?> onblur="javascript:if(this.value=='')this.value='<?php echo $this->language->get("default_input_text");?>';" onfocus="javascript:if(this.value=='<?php echo $this->language->get("default_input_text");?>')this.value='';"<?php endif; ?> value="<?php echo isset($customer_email)?$customer_email:$this->language->get("default_input_text");?>" size="18" name="email">
					<!--<select name="action">
						<option value="1">Subscribe</option>
						<option value="0">Unsubscribe</option>
					</select>-->
					<input type="submit" name="submitNewsletter" class="button_mini btn btn-theme-primary" value="<?php echo $this->language->get("button_ok");?>">
				<input type="hidden" value="1" name="action">
			</p>
		</form>
	</div>
</div>
<script type="text/javascript">

$('#formNewLestter').on('submit', function() {
	var email = $('.inputNew').val();
	if(!isValidEmailAddress(email)) {
		$('.inputNew').before("<div class='error'>Email is not valid!</div>");
		$('.inputNew').focus();
		return false;
	}
});

function isValidEmailAddress(emailAddress) {
	var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
	return pattern.test(emailAddress);
}
</script>