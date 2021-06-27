<?php
class ControllerExtensionModuleContentGallery extends Controller {
	public function index() {
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'contentgallery';

        $contents = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'contents');
        
        $data['contents'] = array();
        if(!empty($contents)) {
            //usort($contents, array($this,"sortSlogans"));
            $data['contents'] = $contents;
        }
        
		return $this->load->view('extension/module/contentgallery', $data);
    }
    
}
