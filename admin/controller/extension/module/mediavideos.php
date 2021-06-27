<?php
class ControllerExtensionModuleMediaVideos extends Controller {
	public function index() {
        $array = array(
            'oc' => $this,
            'heading_title' => 'Media Videos',
            'modulename' => 'mediavideos',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
                array('type' => 'repeater', 'label' => 'Media Videos', 'name' => 'videos',
                    'fields' => array(
                        array('type' => 'image', 'label' => 'Image', 'name' => 'download_image'),
                        array('type' => 'text', 'label' => 'Embedded Link', 'name' => 'video_link'),
                        array('type' => 'text', 'label' => 'Title', 'name' => 'title'),
                    )
                ),
            ),
        );
        $this->modulehelper->init($array);
	}
}
