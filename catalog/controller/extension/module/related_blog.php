<?php
class ControllerExtensionModuleRelatedBlog extends Controller {

	public function index($product_id) {


    $this->load->model('catalog/product');
    $blog_products = $this->model_catalog_product->getBlogRelated($this->request->get['product_id']);


    $this->load->model('catalog/news');
		$this->language->load('news/ncategory');
		$this->load->model('catalog/ncategory');

		$this->document->addStyle('catalog/view/theme/default/stylesheet/blog-news.css');


		if(!empty($blog_products)){
				foreach ($blog_products as $news_id) {

					$related_blog = $this->model_catalog_news->getRelatedNews($news_id);
					$main_category = $this->model_catalog_news->getRelatedMainCategory($news_id);
					// debug($main_category);
					if(isset($main_category)){
								$main_category_id = $main_category[0]['ncategory_id'];
								if ($related_blog) {
									$data['blog_relateds'][] = array(
										'news_id' => $related_blog[0]['news_id'],
										'image' => 	$related_blog[0]['image2'],
										'title' => 	$related_blog[0]['title'],
										'date_added' => date("M d,Y", strtotime($related_blog[0]['date_added'])),
										'description' => 	$related_blog[0]['description2'],
										'href'  => $this->url->link('news/article&ncat='.$main_category_id,'news_id=' . $news_id)
									);
								}
					}

				}

				// debug($data['blog_relateds']);
				return $this->load->view('extension/module/related_blog', $data);

		}



  	}
}
?>
