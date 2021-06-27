<?php
class ControllerExtensionModuleMediaArchives extends Controller {
	public function index() {
        $array = array(
            'oc' => $this,
            'heading_title' => 'Media Archives',
            'modulename' => 'mediaarchives',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
                array('type' => 'repeater', 'label' => 'Media Archives', 'name' => 'archives',
                    'fields' => array(
                        array('type' => 'image', 'label' => 'Image', 'name' => 'download_image'),
                        array('type' => 'image', 'label' => 'Pop-up Image', 'name' => 'pop_image'),
                        array('type' => 'text', 'label' => 'Title', 'name' => 'title'),
                    )
                ),
            ),
        );
        $this->modulehelper->init($array);
	}
}
