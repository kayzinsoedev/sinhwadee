<?php
class ControllerExtensionModuleFooterEmail extends Controller {
	public function index() {
        $array = array(
            'oc' => $this,
            'heading_title' => 'Footer Email',
            'modulename' => 'footer_email',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
				          array('type' => 'textarea', 'label' => 'Footer Email', 'name' => 'footer_email', 'ckeditor'=>true),
            ),
        );
        $this->modulehelper->init($array);
	}
}
