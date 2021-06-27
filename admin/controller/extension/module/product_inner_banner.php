<?php
class ControllerExtensionModuleProductInnerBanner extends Controller {
	public function index() {

        $array = array(
            'oc' => $this,
            'heading_title' => 'Product Inner Banner',
            'modulename' => 'product_inner_banner',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
                array('type' => 'repeater', 'label' => 'Product Inner Banner', 'name' => 'product_inner_banners',
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
