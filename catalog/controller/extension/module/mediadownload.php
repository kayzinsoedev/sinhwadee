<?php
class ControllerExtensionModuleMediaDownload extends Controller {
	public function index() {
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'mediadownload';

        $downloads = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'downloads');
        
        $data['downloads'] = array();
        if(!empty($downloads)) {
            //usort($downloads, array($this,"sortSlogans"));
            $data['downloads'] = $downloads;
        }
        
		return $this->load->view('extension/module/mediadownload', $data);
    }
    
}
