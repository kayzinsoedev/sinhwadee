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
            //usort($services, array($this,"sortSlogans"));
            $data['services'] = $services;
        }

				$data['main_categories'] = array();
        if(!empty($main_categories)) {
            $data['main_categories'] = $main_categories;
        }
	
		return $this->load->view('extension/module/services', $data);
    }

}
