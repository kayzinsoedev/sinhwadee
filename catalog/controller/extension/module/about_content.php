<?php
class ControllerExtensionModuleAboutContent extends Controller {
	public function index() {
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'about_content';

        $slogans = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'slogans');
        $main_categories = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'main_categories');


        $data['slogans'] = array();
        if(!empty($slogans)) {
						$this->load->model('tool/image');
            //usort($icons, array($this,"sortSlogans"));
						foreach ($slogans as $key => $value) {
								$data['slogans'][] = array(
										'id' => $value['id'],
										'main_categories' => $value['main_categories'],
										'top_image' => $this->model_tool_image->resize($value['top_image'], 613, 414),
										'alignment' => $value['alignment'],
										'main_title' => $value['main_title'],
										'sub_title' => $value['sub_title'],
										'desc_title' => $value['desc_title'],
										'module_status' => $value['module_status'],
								);
						}

            // $data['slogans'] = $slogans;
        }

				// debug($data['slogans']);

				$data['main_categories'] = array();
        if(!empty($main_categories)) {
            $data['main_categories'] = $main_categories;
        }


		return $this->load->view('extension/module/about_content', $data);
    }

}
