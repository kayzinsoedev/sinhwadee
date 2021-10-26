<?php
class ControllerExtensionModuleDuplicatePage2Carousel extends Controller {
	public function index() {
        $array = array(
            'oc' => $this,
            'heading_title' => 'Duplicate Page 2 Carousel',
            'modulename' => 'duplicate_page2_carousel',
            'auto_increment' => true, // for auto increment number
            'fields' => array(
                array('type' => 'text', 'label' => 'Section Title', 'name' => 'sec_title'),
                array('type' => 'repeater', 'label' => 'Client Logo', 'name' => 'client_logo',
                    'fields' => array(
												array('type' => 'text', 'label' => 'ID', 'name' => 'id', 'readonly' => true), // for auto increment number
                        array('type' => 'image', 'label' => 'Logo', 'name' => 'logo'),
                        array('type' => 'textarea', 'label' => 'Description', 'name' => 'description','ckeditor'=>true),
                        array('type' => 'text', 'label' => 'Sort', 'name' => 'sort')
                    )
                ),
            ),
        );
        $this->modulehelper->init($array);
	}
}
