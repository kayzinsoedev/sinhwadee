<?php
class ControllerExtensionModuleServices extends Controller {
	public function index() {
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'services';

        $services = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'services');
				$main_categories = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'main_categories');


        $data['services'] = array();
        if(!empty($services)) {

						foreach ($services as $key => $value) {
							// debug($value['top_image']);
							$this->load->model('tool/image');
									$data['services'][] = array(
											'id' => $value['id'],
											'main_categories' => $value['main_categories'],
											'top_image' => $this->model_tool_image->resize($value['top_image'], 613, 414),
											'alignment' => $value['alignment'],
											'title' => $value['title'],
											'description' => $value['description'],
											'module_status' => $value['module_status'],
									);
						}
            // $data['services'] = $services;
        }

				// debug($data['services']);


				$data['main_categories'] = array();
        if(!empty($main_categories)) {
            $data['main_categories'] = $main_categories;
        }


		return $this->load->view('extension/module/services', $data);
    }

}
