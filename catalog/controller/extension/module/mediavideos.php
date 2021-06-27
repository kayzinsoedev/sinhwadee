<?php
class ControllerExtensionModuleMediaVideos extends Controller {
	public function index() {
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'mediavideos';

        $videos = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'videos');

        $data['videos'] = array();
        if(!empty($videos)) {
            //usort($videos, array($this,"sortSlogans"));
            $data['videos'] = $videos;
        }

		return $this->load->view('extension/module/mediavideos', $data);
    }

}
