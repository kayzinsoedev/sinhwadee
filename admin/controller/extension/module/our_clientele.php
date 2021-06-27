<?php
class ControllerExtensionModuleOurClientele extends Controller {
	public function index() {
        $array = array(
            'oc' => $this,
            'heading_title' => 'Our Clientele',
            'modulename' => 'our_clientele',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
                array('type' => 'text', 'label' => 'Section Title', 'name' => 'sec_title'),
                array('type' => 'repeater', 'label' => 'Client Logo', 'name' => 'client_logo',
                    'fields' => array(
                        array('type' => 'image', 'label' => 'Logo', 'name' => 'logo'),
                        array('type' => 'text', 'label' => 'Sort', 'name' => 'sort')
                    )
                ),
            ),
        );
        $this->modulehelper->init($array);
	}
}
