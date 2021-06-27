<?php
class ControllerExtensionModuleMediaDownload extends Controller {
	public function index() {
        $array = array(
            'oc' => $this,
            'heading_title' => 'Media Download',
            'modulename' => 'mediadownload',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
                array('type' => 'repeater', 'label' => 'Media Downlaod', 'name' => 'downloads',
                    'fields' => array(
                        array('type' => 'image', 'label' => 'Image', 'name' => 'download_image'),
                        array('type' => 'upload', 'label' => 'Upload', 'name' => 'download_file'),
                    )
                ),
            ),
        );
        $this->modulehelper->init($array);
	}
}
