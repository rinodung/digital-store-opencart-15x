<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/product/product_filter.tpl" );  ?>    
 <div class="product-list"> <div class="products-block">
    <?php
	$cols = $MAX_ITEM_ROW ;
	$span = floor(12/$cols);
	$small = floor(12/$MAX_ITEM_ROW_SMALL);
	$mini = floor(12/$MAX_ITEM_ROW_MINI);
	foreach ($products as $i => $product) { ?>
	<?php if( $i++%$cols == 0 ) { ?>
		  <div class="row products-item">
	<?php } ?>
    <div class="col-xs-6 col-lg-<?php echo $span;?> col-sm-<?php echo $small;?> col-xs-<?php echo $mini;?>">
    	<div class="product-block clearfix ">	
	      <?php if ($product['thumb']) { ?>
	      <div class="image"><?php if( $product['special'] ) {   ?>
	    	<span class="product-label-special label"><?php echo $this->language->get( 'text_sale' ); ?></span>
	    	<?php } ?>
	    	<a class="img" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
	      	<?php if( $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
	      	<a href="<?php echo $zimage;?>" class="colorbox product-zoom" rel="colorbox" title="<?php echo $product['name']; ?>"><span class="fa fa-search-plus"></span></a>
	      	<?php } ?>

			<?php //#2 Start fix quickview in fw?>
			<?php if ($quickview) { ?>
			<a class="pav-colorbox hidden-sm hidden-xs" href="index.php?route=themecontrol/product&product_id=<?php echo $product['product_id']; ?>"><span class='fa fa-eye'></span><?php echo $this->language->get('quick_view'); ?></a>
			<?php } ?>
			<?php //#2 End fix quickview in fw?>

			<?php 
  			if( $swapimg ){
      		$product_images = $this->model_catalog_product->getProductImages( $product['product_id'] );
			if(isset($product_images) && !empty($product_images)) {
				$thumb2 = $this->model_tool_image->resize($product_images[0]['image'],  $this->config->get('config_image_product_width'),  $this->config->get('config_image_product_height') );
			?>	
			<span class="hover-image">
				<a class="img" href="<?php echo $product['href']; ?>"><img src="<?php echo $thumb2; ?>" alt="<?php echo $product['name']; ?>"></a>
			</span>
			
			<?php } } ?>

	      </div>
	      <?php } ?>
		<div class="product-meta">
	      <h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
	      		  
	      <?php if ($product['price']) { ?>
	      <div class="price">
	        <?php if (!$product['special']) { ?>
	        <?php echo $product['price']; ?>
	        <?php } else { ?>
	        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
	        <?php } ?>
	        <?php if ($product['tax']) { ?>
	        <br />
	        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
	        <?php } ?>
	      </div>
	      <?php } ?>
	      <div class="description"><?php echo utf8_substr( strip_tags($product['description']),0,100);?>...</div>

	      <?php if ($product['rating']) { ?>
	      <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
	      <?php } ?>
	      <div class="cart pull-left">
	        <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
	      </div>
		<div class="wishlist-compare">
	      <span class="wishlist"><a class="fa fa-heart" onclick="addToWishList('<?php echo $product['product_id']; ?>');"  data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $button_wishlist; ?>"><span><?php echo $button_wishlist; ?></span></a></span>
	      <span class="compare"><a class="fa fa-retweet" onclick="addToCompare('<?php echo $product['product_id']; ?>');"  data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $button_compare; ?>"><span><?php echo $button_compare; ?></span></a></span>
	      </div>
	  </div>
	    </div>
		</div>
	 <?php if( $i%$cols == 0 || $i==count($products) ) { ?>
	 </div>
	 <?php } ?>
				
    <?php } ?>
  </div>
  </div>
 
   <div class="pagination"><?php echo $pagination; ?></div>