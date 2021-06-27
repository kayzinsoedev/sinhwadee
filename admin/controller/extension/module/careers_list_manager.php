<?php
class ControllerExtensionModuleCareerslistManager extends Controller {
	public function index() {
        $array = array(
            'oc' => $this,
            'heading_title' => 'Careers List Manager',
            'modulename' => 'careers_list_manager',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
                array('type' => 'text', 'label' => 'Job Type Title', 'name' => 'job_type_title1'),
                array('type' => 'textarea', 'label' => 'Job Type Description', 'name' => 'job_type_desc1','ckeditor'=>true),
                array('type' => 'text', 'label' => 'Sub Title', 'name' => 'job_type_subtitle'),
                array('type' => 'repeater', 'label' => 'Current Openings', 'name' => 'fulltimes',
                    'fields' => array(
                        array('type' => 'text', 'label' => 'Position Name', 'name' => 'position_name1'),
                        array('type' => 'textarea', 'label' => 'Position Description', 'name' => 'position_desc1','ckeditor'=>true),
                        array('type' => 'text', 'label' => 'Sort', 'name' => 'sort'),
                    )
                ),
            ),
            
        );
        $this->modulehelper->init($array);
	}
}
