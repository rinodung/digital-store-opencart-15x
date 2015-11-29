<?php  
/******************************************************
 * @package Pav Product Tabs module for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2012 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/

class ControllerModulepavproducts extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		$this->load->model('catalog/product'); 
		$this->load->model('catalog/category'); 
		$this->load->model('tool/image');
		$this->language->load('module/pavproducts');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/pavproducts.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/pavproducts.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/pavproducts.css');
		}

		if( !isset($setting['category_tabs']) ){
			return ;
		}
 
		$default = array(
			'latest' => 1,
			'limit' => $setting['limit']
		);
		$this->data['width'] = $setting['width'];
		$this->data['height'] = $setting['height'];
		$this->data['cols']   = (int)$setting['cols'];
		$this->data['itemsperpage']   = (int)$setting['itemsperpage'];


		$this->data['tabs'] = array();
		

		$data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		foreach( $setting['category_tabs'] as  $key => $categoryID ){
			
			$category = $this->model_catalog_category->getCategory( $categoryID );	
			if( $category ) {
				$data['filter_category_id'] = $categoryID;
				$products =  $this->getProducts( $this->model_catalog_product->getProducts( $data ), $setting );
				$this->data['tabs'][] = array( 'products' 	   => $products, 
											   'class' 		   => $setting['class'][$key],
											   'image'		   => $setting['image'][$key],
											   'category_name' => $category['name'],
											   'category_id'   => $categoryID
	 
				);
			}
		}

		$this->data['module'] = $module++;					
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pavproducts.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/pavproducts.tpl';
		} else {
			$this->template = 'default/template/module/pavproducts.tpl';
		}
		
		$this->render();
	}
	
	private function getProducts( $results, $setting ){
		$products = array();
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
			} else {
				$image = false;
			}
						
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
			 
			$products[] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'special' 	 => $special,
				'rating'     => $rating,
				'description'=> (html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')),
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}
		return $products;
	}
}
?>