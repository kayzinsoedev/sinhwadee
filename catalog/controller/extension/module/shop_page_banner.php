<?php
class ControllerExtensionModuleShopPageBanner extends Controller {
	public function index() {
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'shop_page_banner';

        $shop_page_banners = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'shop_page_banners');

        $data['shop_page_banner'] = array();
        if(!empty($shop_page_banners)) {
            //usort($icons, array($this,"sortSlogans"));
            $data['shop_page_banners'] = $shop_page_banners;
        }

		return $this->load->view('extension/module/shop_page_banner', $data);
    }

}
