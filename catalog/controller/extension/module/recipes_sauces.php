<?php
class ControllerExtensionModuleRecipesSauces extends Controller {
	public function index() {
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'recipes_sauces';

        $recipes_sauces = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'recipes_sauces');

        $data['$recipes_sauces'] = array();
        if(!empty($recipes_sauces)) {
            $data['slogans'] = $slogans;
        }


    }

}
