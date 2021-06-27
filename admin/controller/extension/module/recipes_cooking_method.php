<?php
class ControllerExtensionModuleRecipesCookingMethod extends Controller {
	public function index() {

            $array = array(
            'oc' => $this,
            'heading_title' => 'Recipes Cooking Method',
            'auto_increment' => true, // for auto increment number
            'modulename' => 'recipes_cooking_method',
                  'fields' => array(
                      array('type' => 'repeater', 'label' => 'Cooking Method', 'name' => 'recipes_cooking_method',
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
