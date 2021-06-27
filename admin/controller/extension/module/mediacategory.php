<?php
class ControllerExtensionModuleMediaCategory extends Controller {
	public function index() {
        $array = array(
            'oc' => $this,
            'heading_title' => 'Media Category',
            'modulename' => 'mediacategory',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
                array('type' => 'repeater', 'label' => 'Media Category', 'name' => 'categories',
                    'fields' => array(
                        array('type' => 'text', 'label' => 'Button Name', 'name' => 'btn_name'),
                        array('type' => 'text', 'label' => 'Button Link', 'name' => 'btnlink_'),
                    )
                ),
            ),
        );
        $this->modulehelper->init($array);
	}
}
