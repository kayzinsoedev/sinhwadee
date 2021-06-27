<?php
class ControllerExtensionModuleFeatured extends Controller {
	private static $module_id = 1;

	public function index($setting) {

		$this->load->language('extension/module/featured');

		$data["uqid"] = $setting['module_id'] . '_' . $this->module_id;

		$data['heading_title'] = $this->language->get('heading_title');

		if( isset($setting['title'][(int)$this->config->get('config_language_id')]) ){
			$data['heading_title'] = $setting['title'][(int)$this->config->get('config_language_id')];
		}

		$this->document->addStyle('catalog/view/javascript/slick/slick.min.css');
		$this->document->addScript('catalog/view/javascript/slick/slick-custom.min.js');

		//$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.css');
		//$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
		// << Related Options
		if ( !$this->model_module_related_options ) {
			$this->load->model('module/related_options');
		}
		// >> Related Options

		$data['products'] = array();

		if (!empty($setting['product'])) {
			$products = $setting['product'];

			$width = $this->config->get($this->config->get('config_theme') . '_image_product_width');
			$height = $this->config->get($this->config->get('config_theme') . '_image_product_height');

			foreach ($products as $product_id) {
				$data['products'][] = $this->load->controller('component/product_info', $product_id);
			}
		}


		$data['viewall'] = $this->url->link('product/category');

		if(!$data['products']) return '';

		$this->module_id++;

		return $this->load->view('extension/module/featured_slick', $data);
	}


	public function related_products($setting){

			$data['heading_title'] = "Products Used";
			$data["uqid"] = $setting['module_id'] . '_' . $this->module_id;

			$this->load->model('catalog/product');
	    $blog_products = $this->model_catalog_product->getProductRelatedBlog($setting['news_id']);
			// debug($data["uqid"]);

			$this->load->language('extension/module/featured');
			$this->document->addStyle('catalog/view/javascript/slick/slick.min.css');
			$this->document->addScript('catalog/view/javascript/slick/slick-custom.min.js');


			$this->load->model('catalog/news');
	    foreach ($blog_products as $product_id) {
						$data['products'][] = $this->load->controller('component/product_info', $product_id);
	    }

			$data['viewall'] = $this->url->link('product/category');

			$this->module_id++;

			if(isset($data['products'])){
					return $this->load->view('extension/module/featured_slick', $data);
			}

	}


	public function related_products_list($news_id){
			$blog_products = $this->model_catalog_product->getProductRelatedBlog($news_id);
			$this->load->model('catalog/product');
			if(!empty($blog_products)){
						foreach ($blog_products as $product_id) {
									// $data['products'][] = $this->load->controller('component/product_info', $product_id);
									$data['products'][] = $this->model_catalog_product->getProduct($product_id);
				    }


						foreach ($data['products'] as $key => $value) {
							$data['product_name'][]= $value['name'];
						}

						return $this->load->view('extension/module/related_product_list_for_blog', $data);
			}

	}

}
