<?php $id = rand(); ?>

<?php ?>
<div class="box gallery">
  
  <div class="box-heading"><span><?php echo $heading_title;?></span></div>
    <div class="box-content">
		
		<?php foreach( $banners as $banner ) { ?>
			<a href="<?php echo $banner['image'];?>" class="group<?php echo $id;?>" title="<?php echo $banner['title'];?>">
			<img src="<?php echo $banner['thumb'];?>" title="<?php echo $banner['title'];?>">
			</a>
		<?php } ?>
		
	</div>
</div> 
<script type="text/javascript">
$(".group<?php echo $id;?>").colorbox({rel:'group<?php echo $id;?>', slideshow:true});
</script>