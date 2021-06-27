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
            //usort($icons, array($this,"sortSlogans"));
            $data['slogans'] = $slogans;
        }

				$data['main_categories'] = array();
        if(!empty($main_categories)) {
            $data['main_categories'] = $main_categories;
        }


		return $this->load->view('extension/module/about_content', $data);
    }

}
