<?php if( $banners ) { ?>
<?php if( isset($widget_name)){
?>
<div class="menu-title"><?php echo $widget_name;?></div>
<?php
}?>
<div class="widget-banner">
	<div class="widget-inner clearfix">
		  <?php foreach ($banners as $banner) { ?>
		  <?php if ($banner['link']) { ?>
		  <div class="w-banner"><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
		  <?php } else { ?>
		  <div><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
		  <?php } ?>
		  <?php } ?>
	</div>
</div>
<?php } ?>