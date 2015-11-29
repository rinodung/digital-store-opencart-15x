<?php 
/******************************************************
 * @package Pav Product Tabs module for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2012 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/

	$col = 12/$cols; 
	$active = 'latest';
	$id = rand(1,9)+rand();	
	
	$themeConfig = $this->config->get('themecontrol'); 
	 $categoryConfig = array( 
		'quickview'                          => 0,
		'show_swap_image'                    => 0,
	);
	$categoryConfig  = array_merge($categoryConfig, $themeConfig );
	
	$quickview          = $categoryConfig['quickview'];
	$swapimg            = $categoryConfig['show_swap_image'];

?>
<div class="box pav-categoryproducts no-boxshadown">
<?php if( !empty($module_description) ) { ?>
 <div class="module-desc">
	<?php echo $module_description;?>
 </div>
 <?php } ?>
  

	<div class="box-content">
	
					<div class="tab-nav">
							<ul class="h-tabs" id="producttabs<?php echo $id;?>">
								<?php $width = (100/count($tabs));?>
								<?php foreach( $tabs as $tab => $category ){ 
									if( empty($category) ){ continue;}
									$tab = 'cattabs';
										
									//echo '<pre>'.print_r( $category,1 ); die; 
									$products = $category['products'];
									$icon = $this->model_tool_image->resize( $category['image'], 90, 53 ); 
								?>
									 <li style="width:<?php echo $width;?>%">
									 <a href="#tab-<?php echo $tab.$id.$category['category_id'];?>" data-toggle="tab">
										<?php if ( $icon ) { ?><img class="hidden-sm hidden-xs pull-left" src="<?php echo $icon;?>"/><?php } ?>
										<?php echo $category['category_name'];?>
									 </a>
									 </li>
								<?php } ?>
							</ul>
					  </div>
					<div class="tab-content">  
						<?php foreach( $tabs as $tab => $category ) { 
						if( empty($category) ){ continue;}
						$tab = 'boxcats';

						$products = $category['products'];
						$icon = $this->model_tool_image->resize( $category['image'], 45,45 ); 
						?>
						<div class="tab-pane cat-products-block <?php echo $category['class'];?> clearfix" id="tab-cattabs<?php echo $id.$category['category_id'];?>">	
					<?php if( count($products) > $itemsperpage ) { ?>
							<a class="carousel-control left" href="#<?php echo $tab.$id.$category['category_id'];?>"   data-slide="prev">&lsaquo;</a>
							<a class="carousel-control right" href="#<?php echo $tab.$id.$category['category_id'];?>"  data-slide="next">&rsaquo;</a>
						<?php } ?>
						<div class="box-products  pavproducts<?php echo $id;?> slide" id="<?php echo $tab.$id.$category['category_id'];?>">
						
						<div class="carousel-inner ">		
						 <?php $pages = array_chunk( $products, $itemsperpage);	 ?>	
						  <?php foreach ($pages as  $k => $tproducts ) {   ?>
							<div class="item <?php if($k==0) {?>active<?php } ?> products-block">
								<?php foreach( $tproducts as $i => $product ) { ?>
									<?php if( $i++%$cols == 0 ) { ?>
									<div class="row products-item">
										<?php } ?>
										 <div class="pavcol-sm-<?php echo $cols;?> col-xs-12 col-sm-6">
											  <div class="product-block clearfix ">
												<div class="product-inner">
												<?php if ($product['thumb']) { ?>
												<div class="image">
													<a class="img" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>																										
													<?php if ($quickview) { ?>
													<a class="pav-colorbox hidden-sm hidden-xs" href="index.php?route=themecontrol/product&product_id=<?php echo $product['product_id']; ?>"><span class='fa fa-eye'></span><?php echo $this->language->get('quick_view'); ?></a>
													<?php } ?>													
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
												</div>
											<?php } ?>

											  <div class="description"><?php echo utf8_substr( strip_tags($product['description']),0,135);?>...</div>
											  
											  <?php if ($product['rating']) { ?>
											  <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
											  <?php } ?>
												<div class="cart pull-left">
													<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
											  </div>
												<div class="wishlist-compare pull-left">
												 
												  <span class="wishlist"><a class="fa fa-heart" onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_wishlist"); ?>" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $this->language->get("button_wishlist"); ?>"><span><?php echo $this->language->get("button_wishlist"); ?></span></a></span>
												  <span class="compare"><a class="fa fa-retweet" onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_compare"); ?>" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $this->language->get("button_compare"); ?>"><span><?php echo $this->language->get("button_compare"); ?></span></a></span>
												</div>

											   
											</div>

											</div>
											</div>
										</div>
									  
									  <?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
									</div>
									<?php } ?>
								<?php } //endforeach; ?>
							</div>
						  <?php } ?>
						</div>  
						</div>
						</div>		
						<?php } // endforeach of tabs ?>	
					</div>

	</div>
</div>


<script type="text/javascript">
$(function () {
	$('.pavproducts<?php echo $id;?>').carousel({interval:99999999999999,auto:false,pause:'hover'});
	$('#producttabs<?php echo $id;?> a:first').tab('show');
});
</script>
<script type="text/javascript">
$(document).ready(function() {
	$('.pav-colorbox').colorbox({
        width: '890px', 
        height: '750px',
        overlayClose: true,
        opacity: 0.5,
        iframe: true, 
    });
});
</script>
