<?php
class ControllerExtensionModuleOem extends Controller {
	public function index() {
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'oem';

        $oem_services = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'oem_services');
				$main_categories = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'main_categories');

        $data['oem_services'] = array();
        if(!empty($oem_services)) {
            //usort($oem_services, array($this,"sortSlogans"));
            $data['oem_services'] = $oem_services;
        }

				$data['main_categories'] = array();
        if(!empty($main_categories)) {
            $data['main_categories'] = $main_categories;
        }

		return $this->load->view('extension/module/oem', $data);
    }

}
