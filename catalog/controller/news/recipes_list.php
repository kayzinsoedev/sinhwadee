<?php
class ControllerNewsRecipesList extends Controller {
    public function index($article,$post,$page) {
      debug($article);die;
        if(isset($post['receipt_sauce'])
          || isset($post['receipt_cooking_method'])
          || isset($post['receipt_main_ingredient'])
          || isset($post['keyword'])
        ){

          $data['recipes_filter'] = "true";

          foreach($articles as $key=> $value){
              $sauce_ids= $this->model_catalog_ncategory->getSauceNewsById($value['article_id']);
              $ingredients_ids= $this->model_catalog_ncategory->getIngredientsNewsById($value['article_id']);
              $cooking_methods_ids= $this->model_catalog_ncategory->getCookingNewsById($value['article_id']);

              $data['recipes_articles'][] = array(
                'article_id'  => $value['article_id'],
                'name'        => $value['name'],
                'sauces'      => $sauce_ids,
                'ingredients' => $ingredients_ids,
                'cooking_method' => $cooking_methods_ids

              );
           }

            /*filter recipes pagination */

            $recipes_limit = 1;
            $url = '';
            $total_recipes = count($data['recipes_articles']);
            $filter_recipes_pagination = new Pagination();
            $filter_recipes_pagination->total = $total_recipes;
            $filter_recipes_pagination->page = $page;
            $filter_recipes_pagination->limit = $recipes_limit;
            $filter_recipes_pagination->url = $this->url->link('news/ncategory&ncat=59', $url . '&page={page}');

            $data['filter_recipes_pagination'] = $filter_recipes_pagination->render();

            $data['$filter_recipes_pagination'] = sprintf($this->language->get('text_pagination'), ($total_recipes) ? (($page - 1) * $recipes_limit) + 1 : 0, ((($page - 1) * $recipes_limit) > ($total_recipes - $recipes_limit)) ? $total_recipes : ((($page - 1) * $recipes_limit) + $recipes_limit), $total_recipes, ceil($total_recipes / $recipes_limit));
            // debug($data);die;

            return $this->load->view('default/template/news/filter_recipes_list.tpl', $data);
        }

    }


}

?>
