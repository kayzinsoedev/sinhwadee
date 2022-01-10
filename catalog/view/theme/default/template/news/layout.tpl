
<?php echo $header; ?>
<div class="container-fluid">
  <?php echo $content_top; ?>
  <ul class="breadcrumb hidden">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <br><br><br>
  <h2 class="hidden"><?php echo $heading_title; ?></h2>
  <!-- <?php debug($route);?> -->

  <?php if($cat_id == "59"){ ?>
      <?php if(isset($route)){ ?>
      <?php if($route != "news/article" ){ ?>
      <div class="container-fluid">
            <!--<form action="<?=$action;?>" method="get">-->
                  <div class="row filter-section">
                      <div class="keyword-filter-option">
                          <div class="form-group">
                              <label for="recipes_sauce" class="recipes-filter"><?php echo $keyword;?></label>
                              <input type="text" class="form-control" placeholder="" name="keyword" value="<?=$input_keyword;?>">
                          </div>
                      </div>
                  </div>
                  <div class="row filter-section">
           						 <div class="filter-option">
           								 <div class="form-group">
           										<label for="recipes_sauce" class="recipes-filter"><?php echo $sauces;?></label>
           											<select name="recipes_sauce" class="form-control">
                                  <option value="all"><?php echo $all_sauces;?></option>
           												<?php foreach($recipes_sauces as $key=> $recipes_sauce){ ?>
                                        <?php if($recipes_sauce['id'] === $recipes_filter_sauce){ ?>
                                            <?php $selected ="selected"; ?>
                                        <?php }else{ ?>
                                            <?php $selected= ""; ?>
                                        <?php } ?>

           															<option value="<?=$recipes_sauce['id'];?>" <?=$selected;?> ><?=$recipes_sauce['title'];?></option>
           												<?php } ?>
           										 </select>
           								 </div>
           							</div>
           						 <div class="filter-option">
           								 <div class="form-group">
           											<label for="recipes_sauce" class="recipes-filter"><?php echo $cooking_method;?></label>
           												<select name="recipes_cooking_method" class="form-control">
                                         <option value="all"><?php echo $all_cooking_method;?></option>
           												 <?php foreach($recipes_cooking_methods as $key=> $recipes_cooking_method){ ?>

                                         <?php if($recipes_cooking_method['id'] === $recipes_filter_cooking_method){ ?>
                                             <?php $selected ="selected"; ?>
                                         <?php }else{ ?>
                                             <?php $selected= ""; ?>
                                         <?php } ?>


           															 <option value="<?=$recipes_cooking_method['id'];?>" <?=$selected;?> ><?=$recipes_cooking_method['title'];?></option>
           												 <?php } ?>
           											</select>
           								 </div>
           						 </div>
           						 <div class="filter-option">
           								<div class="form-group">
           										 <label for="recipes_sauce" class="recipes-filter"><?php echo $ingredient;?></label>
           											 <select name="recipes_main_ingredient" class="form-control">
                                        <option value="all"><?php echo $all_ingredient;?></option>
           												 <?php foreach($recipes_main_ingredients as $key=> $recipes_main_ingredient){ ?>
                                       <?php if($recipes_main_ingredient['id'] === $recipes_filter_main_ingredient){ ?>
                                           <?php $selected ="selected"; ?>
                                       <?php }else{ ?>
                                           <?php $selected= ""; ?>
                                       <?php } ?>


           															 <option value="<?=$recipes_main_ingredient['id'];?>" <?=$selected;?> ><?=$recipes_main_ingredient['title'];?></option>
           												 <?php } ?>
           											</select>
           								</div>
           						 </div>
           			 </div>

               <div class="row filter-btn">
                   <a href="index.php?route=news/ncategory&ncat=59" class="recipes-clear-bn">Clear</a>
                   <button class="recipes-filter-btn">Search</button>
               </div>
            <!--</form>-->
        </div>
        <?php } ?>
        <?php } ?>

  <?php } ?>


  <br>


  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <?php echo $description; ?>
    </div>
    <?php echo $column_right; ?>
  </div>


    <?php include_once('filter_recipes_list.tpl'); ?>


    <?php echo $content_bottom; ?>
</div>
<script>
    $('.recipes-filter-btn').on('click',function(){
     var url = '<?= $action; ?>';

     if($("input[name='keyword']").val()){
         url += '&keyword='+$("input[name='keyword']").val();
     }

     if($("select[name='recipes_sauce']").val()){
         url += '&recipes_sauce='+$("select[name='recipes_sauce']").val();
     }
     if($("select[name='recipes_cooking_method']").val()){
         url += '&recipes_cooking_method='+$("select[name='recipes_cooking_method']").val();
     }
     if($("select[name='recipes_main_ingredient']").val()){
         url += '&recipes_main_ingredient='+$("select[name='recipes_main_ingredient']").val();
     }
     window.location.href=url;
    });
</script>
<?php echo $footer; ?>
