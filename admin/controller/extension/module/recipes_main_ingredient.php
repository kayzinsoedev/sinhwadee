<?php
class ControllerExtensionModuleRecipesMainIngredient extends Controller {
	public function index() {

            $array = array(
            'oc' => $this,
            'heading_title' => 'Recipes Main Ingredient',
            'auto_increment' => true, // for auto increment number
            'modulename' => 'recipes_main_ingredient',
                  'fields' => array(
                      array('type' => 'repeater', 'label' => 'Main Ingredient', 'name' => 'recipes_main_ingredient',
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
