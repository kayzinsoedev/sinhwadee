<?php
class ControllerExtensionModuleContentGallery extends Controller {
	public function index() {
        
        $align_list = array(
            array(
                'value'   => 0,
                'label'   => 'Right'
            ),
            array(
                'value'   => 1,
                'label'   => 'Left'
            ),
        );
        $array = array(
            'oc' => $this,
            'heading_title' => 'Content Gallery',
            'modulename' => 'contentgallery',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
                array('type' => 'repeater', 'label' => 'Content Gallery', 'name' => 'contents',
                    'fields' => array(
                        array('type' => 'image', 'label' => 'Big Image', 'name' => 'top_image'),
                        array('type' => 'textarea', 'label' => 'Big Image Description', 'name' => 'top_image_desc'),
                        array('type' => 'text', 'label' => 'Big Image Link', 'name' => 'top_image_link'),
                        array('type' => 'dropdown', 'label' => 'Alignment of Big Image', 'name' => 'alignment', 'choices' => $align_list),
                        array('type' => 'text', 'label' => 'Big Section Background Color', 'name' => 'big_bg'),
                        array('type' => 'image', 'label' => 'Small Image 1', 'name' => 'small_image1'),
                        array('type' => 'textarea', 'label' => 'Small Image 1 Description', 'name' => 'small_desc1'),
                        array('type' => 'text', 'label' => 'Small Image 1 Link', 'name' => 'small_image_link'),
                        array('type' => 'dropdown', 'label' => 'Small Image 1 Alignment', 'name' => 'small_alignment', 'choices' => $align_list),
                        array('type' => 'image', 'label' => 'Small Image 2', 'name' => 'small_image2'),
                        array('type' => 'textarea', 'label' => 'Small Image 2 Description', 'name' => 'small_desc2'),
                        array('type' => 'text', 'label' => 'Small Image 2 Link', 'name' => 'small_image_link2'),
                        array('type' => 'text', 'label' => 'Small Section Background Color', 'name' => 'small_bg'),
                    )
                ),
            ),
        );
        $this->modulehelper->init($array);
	}
}
