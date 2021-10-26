<?php
class ControllerExtensionModuleServiceClientele extends Controller {
	public function index() {

        $this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.css');
        $this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'service_clientele';

        $data['sec_title'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'sec_title');
        $client_logo = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'client_logo');

        $data['client_logo'] = array();
        if(!empty($client_logo)) {
            usort($client_logo, array($this,"sortLogos"));
            $data['client_logo'] = $client_logo;
        }
		     return $this->load->view('extension/module/service_clientele', $data);
    }


    function sortLogos($object1, $object2){
        if (is_numeric($object1['sort']) && is_numeric($object2['sort'])) {
          return $object1['sort'] - $object2['sort'];
        }
    }
}
