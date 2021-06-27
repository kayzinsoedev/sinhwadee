<?php
class ControllerExtensionModuleHomeAbout extends Controller {
	public function index() {
        $array = array(
            'oc' => $this,
            'heading_title' => 'Home - About',
            'modulename' => 'home_about',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
				array('type' => 'text', 'label' => 'Title', 'name' => 'sec_title'),
                array('type' => 'textarea', 'label' => 'Description', 'name' => 'about_upload','ckeditor'=>true),
                array('type' => 'text', 'label' => 'Button Name', 'name' => 'btn_name'),
				array('type' => 'textarea', 'label' => 'Button Link', 'name' => 'btn_link'),
            ),
        );
        $this->modulehelper->init($array);
	}
}
