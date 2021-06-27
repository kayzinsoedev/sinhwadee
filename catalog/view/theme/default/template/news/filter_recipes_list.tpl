<?php debug("kk");?>

<?php if(isset($recipes_filter)){ ?>
						<div class="col-md-12">
									<div class="row">
												<div class="col-md-3 recipes-list-title">Recipes</div>
												<div class="col-md-3 recipes-list-title">Sauce</div>
												<div class="col-md-3 recipes-list-title">Ingredients</div>
												<div class="col-md-3 recipes-list-title">Method</div>
									</div>
                  <?php debug($recipes_filter);?>
									<?php foreach ($recipes_articles as $key=> $recipes_article) { ?>
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


		<div class="text-center pd-b60"><?php echo $filter_recipes_pagination; ?></div>
<?php } ?>
