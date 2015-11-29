<?php if (count($currencies) > 1) { ?>
	<div class="currency-wrapper"> 
		<?php /* <span><?php echo $text_currency; ?> : </span>  */?>
		<div class="btn-group">
			<button type="button" class="dropdown-toggle hidden-sm hidden-xs" data-toggle="dropdown">
				<span>			
					<?php foreach ($currencies as $currency) { ?>
					<?php if ($currency['code'] == $currency_code) { ?>
					<?php if ($currency['symbol_left']) { ?>
							
						<?php echo $currency['symbol_left']; ?>
						<?php //echo $currency['title']; ?>	
						
					<?php } else { ?>
					
						<?php echo $currency['symbol_right']; ?>
						<?php //echo $currency['title']; ?>
					
					<?php } break; }  }?>
				</span>			
				<span class="fa fa-sort-asc"></span>
			</button>
			<button type="button" class="dropdown-toggle hidden-lg hidden-md button" data-toggle="dropdown">
				<span>			
					<?php foreach ($currencies as $currency) { ?>
					<?php if ($currency['code'] == $currency_code) { ?>
					<?php if ($currency['symbol_left']) { ?>
							
						<?php echo $currency['symbol_left']; ?>
						<?php echo $currency['title']; ?>	
						
					<?php } else { ?>
					
						<?php echo $currency['symbol_right']; ?>
						<?php echo $currency['title']; ?>
					
					<?php } break; }  }?>
				</span>			
				<span class="fa fa-sort-asc"></span>
			</button>
			<div class="dropdown-menu dropdown">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
  <div class="currency-item"><?php //echo $text_currency; ?>
    <?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['code'] == $currency_code) { ?>
    <?php if ($currency['symbol_left']) { ?>
     <a class="list-item" title="<?php echo $currency['title']; ?>"><b><?php echo $currency['symbol_left']; ?><?php echo $currency['title']; ?></b></a>
    <?php } else { ?>
    
     	<a class="list-item" title="<?php echo $currency['title']; ?>"><b><?php echo $currency['symbol_right']; ?><?php echo $currency['title']; ?></b></a>
    <?php } ?>
    <?php } else { ?>
    <?php if ($currency['symbol_left']) { ?>
    <a class="list-item" title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();"><?php echo $currency['symbol_left']; ?> <?php echo $currency['title']; ?></a>
    <?php } else { ?>
     <a class="list-item" title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();"><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></a>
    <?php } ?>
    <?php } ?>
    <?php } ?>
    <input type="hidden" name="currency_code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </div>
</form>
	</div>
		</div>
	</div>
<?php } ?>
