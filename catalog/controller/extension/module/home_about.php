<?php
class ControllerExtensionModuleHomeAbout extends Controller {
	public function index() {
    $this->load->library('modulehelper');
    $Modulehelper = Modulehelper::get_instance($this->registry);
    $oc = $this;
    $language_id = $this->config->get('config_language_id');
    $modulename  = 'home_about';

    $data['sec_title'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'sec_title');
    $data['about_upload'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'about_upload');
    $data['btn_name'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'btn_name');
    $data['btn_link'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'btn_link');

		return $this->load->view('extension/module/home_about', $data);
  }
}
