<?php
class ControllerExtensionModuleShopUs extends Controller {
	public function index() {

        $status = array(
            array(
                'value'   => 0,
                'label'   => 'Disabled'
            ),
            array(
                'value'   => 1,
                'label'   => 'Enabled'
            ),
        );

        $array = array(
            'oc' => $this,
            'heading_title' => 'Shop Us',
            'modulename' => 'shop_us',
            'auto_increment' => false, // for auto increment number
            'fields' => array(
                array('type' => 'repeater', 'label' => 'Shop Us', 'name' => 'shop_locations',
                    'fields' => array(
                        array('type' => 'image', 'label' => 'Image', 'name' => 'image'),
                        array('type' => 'text', 'label' => 'Link', 'name' => 'link'),
                    )
                ),

                // array('type' => 'select', 'label' => 'Status', 'name' => 'status'),
                array('type' => 'dropdown', 'label' => 'Status', 'name' => 'module_status', 'choices' => $status),

            ),
        );
        $this->modulehelper->init($array);
	}
}
