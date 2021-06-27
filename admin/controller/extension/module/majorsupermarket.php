<?php
class ControllerExtensionModuleMajorsupermarket extends Controller {
	public function index() {
        $array = array(
            'oc' => $this,
            'heading_title' => 'Major Supermarket',
            'modulename' => 'majorsupermarket',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
                array('type' => 'text', 'label' => 'Section Title', 'name' => 'sec_title'),
                array('type' => 'repeater', 'label' => 'Client Logo', 'name' => 'client_logo',
                    'fields' => array(
                        array('type' => 'image', 'label' => 'Logo', 'name' => 'logo'),
                        array('type' => 'text', 'label' => 'Link', 'name' => 'link'),
                        array('type' => 'text', 'label' => 'Sort', 'name' => 'sort')
                    )
                ),
            ),
        );
        $this->modulehelper->init($array);
	}
}
