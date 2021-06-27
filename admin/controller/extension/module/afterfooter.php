<?php
class ControllerExtensionModuleAfterFooter extends Controller {
	public function index() {
        $array = array(
            'oc' => $this,
            'heading_title' => 'After Footer',
            'modulename' => 'afterfooter',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
                array('type' => 'repeater', 'label' => 'After Footer', 'name' => 'footers',
                    'fields' => array(
                        array('type' => 'image', 'label' => 'After Footer Images', 'name' => 'top_image'),
                    )
                ),
            ),
        );
        $this->modulehelper->init($array);
	}
}
