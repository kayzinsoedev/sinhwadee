<?php
class ControllerExtensionModuleRecipesSauces extends Controller {
	public function index() {

            $array = array(
            'oc' => $this,
            'heading_title' => 'Recipes Sauces',
            'auto_increment' => true, // for auto increment number
            'modulename' => 'recipes_sauces',
                  'fields' => array(
                      array('type' => 'repeater', 'label' => 'Sauces', 'name' => 'sauces',
                          'fields' => array(
                              array('type' => 'text', 'label' => 'ID', 'name' => 'id'),
                              array('type' => 'text', 'label' => 'Title', 'name' => 'title'),
                          )
                      ),

                  ),
            );

        $this->modulehelper->init($array);

	}
}
