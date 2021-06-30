
<?php if(isset($filter_recipes_list)){ ?>
						<div class="col-md-12 filter-recipes-list">
									<div class="row filter-recipes-title">
												<div class="col-md-3 recipes-list-title"><h3>Recipes</h3></div>
												<div class="col-md-3 recipes-list-title"><h3>Sauce</h3></div>
												<div class="col-md-3 recipes-list-title"><h3>Ingredients</h3></div>
												<div class="col-md-3 recipes-list-title"><h3>Method</h3></div>
									</div>
									<?php foreach ($filter_recipes_list as $key=> $recipes_article) { ?>
											<div class="row">
												 <?php $key++; ?>
														<div class="col-md-3 recipes-list"><span><?=$key.". ";?></span><?=$recipes_article['name'];?></div>
														<div class="col-md-3 recipes-list">
															<!-- Sauces -->
															<?php foreach($recipes_article['sauces'] as $sauce){ ?>
																	<?php foreach($recipes_sauces as $recipes_sauce){ ?>
																				<?php if($recipes_sauce['id']==$sauce['sauce_id']){ ?>
																								<span class="recipes-list"><?=$key.". ";?></span><?=$recipes_sauce['title'].",";?>
																				<?php } ?>
																	<?php } ?>
															<?php } ?>
														</div>

														<div class="col-md-3 recipes-list">
															<!-- Ingredients -->
															<?php foreach($recipes_article['ingredients'] as $ingredient){ ?>
																	<?php foreach($recipes_main_ingredients as $recipes_main_ingredient){ ?>
																				<?php if($recipes_main_ingredient['id']==$ingredient['main_ingredients_id']){ ?>
																								<span class="recipes-list"><?=$key.". ";?></span><?=$recipes_main_ingredient['title'].",";?>
																				<?php } ?>
																	<?php } ?>
															<?php } ?>
														</div>

														<div class="col-md-3 recipes-list">
															<!-- Cooking Method -->
															<?php foreach($recipes_article['cooking_method'] as $cooking_method){ ?>
																	<?php foreach($recipes_cooking_methods as $recipes_cooking_method){ ?>
																				<?php if($recipes_cooking_method['id']== $cooking_method['cooking_method_id']){ ?>
																								<span class="recipes-list"><?=$key.". ";?></span><?=$recipes_cooking_method['title'].",";?>
																				<?php } ?>
																	<?php } ?>
															<?php } ?>
														</div>
											</div>

									<?php } ?>
						</div>



		<!-- <div class="text-center pd-b60"><?php echo $pagination; ?></div> -->
<?php } ?>
<?php if(isset($filter_recipes_pagination)){ ?>
		<div class="text-center pd-b60"><?=$filter_recipes_pagination; ?></div>
<?php } ?>
