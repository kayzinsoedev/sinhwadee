<?php
class ControllerExtensionModuleMediaCategory extends Controller {
	public function index() {
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'mediacategory';

        $categories = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'categories');
        
        $data['categories'] = array();
        if(!empty($categories)) {
            //usort($categories, array($this,"sortSlogans"));
            $data['categories'] = $categories;
        }
        
		return $this->load->view('extension/module/mediacategory', $data);
    }
    
}
