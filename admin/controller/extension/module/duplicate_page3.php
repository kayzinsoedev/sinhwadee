<?php
class ControllerExtensionModuleDuplicatePage3 extends Controller {
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
						array(
                'value'   => 2,
                'label'   => 'No Image'
            ),
        );


				$this->load->library('modulehelper');
				$Modulehelper = Modulehelper::get_instance($this->registry);
				$oc = $this;
				$language_id = $this->config->get('config_language_id');
				$modulename  = 'duplicate_page3';
				$main_categories = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'main_categories');
				$main_categories_list = array();
				if($main_categories){
						foreach($main_categories as $main_category){
								$main_categories_list[] = array(
										'label'   => $main_category['main_category_name'],
										'value'   => $main_category['id'],
								);
						}
				}



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
						'heading_title' => 'Duplicate Page 3',
						'modulename' => 'duplicate_page3',
						'auto_increment' => true, // for auto increment number
						'fields' => array(
								array('type' => 'repeater', 'label' => 'Main Category', 'name' => 'main_categories',
										'fields' => array(
												array('type' => 'text', 'label' => 'ID', 'name' => 'id', 'readonly' => true), // for auto increment number
												array('type' => 'text', 'label' => 'Main Category Name', 'name' => 'main_category_name'),
												array('type' => 'image', 'label' => 'Main Category Image', 'name' => 'main_category_img'),

										)
								),

								array('type' => 'repeater', 'label' => 'Duplicate Page 1', 'name' => 'duplicate_page2',
                    'fields' => array(
											array('type' => 'text', 'label' => 'ID', 'name' => 'id', 'readonly' => true),
											array('type' => 'dropdown', 'label' => 'Main Category List', 'name' => 'main_categories', 'choices' => $main_categories_list),
                        array('type' => 'image', 'label' => 'Top Image', 'name' => 'top_image'),
                        array('type' => 'dropdown', 'label' => 'Align Image', 'name' => 'alignment', 'choices' => $align_list),
                        array('type' => 'text', 'label' => 'Sub Title', 'name' => 'title'),
                        array('type' => 'textarea', 'label' => 'Description', 'name' => 'description','ckeditor'=>true),
												array('type' => 'dropdown', 'label' => 'Status', 'name' => 'module_status', 'choices' => $status),
                    )
                ),

						),
				);


        $this->modulehelper->init($array);
	}
}
