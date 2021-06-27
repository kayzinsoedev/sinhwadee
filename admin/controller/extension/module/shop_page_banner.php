<?php
class ControllerExtensionModuleShopPageBanner extends Controller {
	public function index() {

        $array = array(
            'oc' => $this,
            'heading_title' => 'Shop Page Banner',
            'modulename' => 'shop_page_banner',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
                array('type' => 'repeater', 'label' => 'Shop Page Banner', 'name' => 'shop_page_banners',
                    'fields' => array(
                        array('type' => 'image', 'label' => 'Image', 'name' => 'image'),
                        array('type' => 'text', 'label' => 'Link', 'name' => 'link'),
                    )
                ),

            ),
        );
        $this->modulehelper->init($array);
	}
}
