<?php
class ControllerExtensionModuleMediaArchives extends Controller {
	public function index() {
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'mediaarchives';

        $archives = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'archives');
        
        $data['archives'] = array();
        if(!empty($archives)) {
            //usort($downloads, array($this,"sortSlogans"));
            $data['archives'] = $archives;
        }
        
		return $this->load->view('extension/module/mediaarchives', $data);
    }
    
}
