<div class="product-gutter" id="product-<?=$product_id?>"> <?php /* product option in product component :: add product id to div  */ ?>
	<div class="product-block <?= $out_of_stock; ?>">
		<div class="product-image-block relative image-zoom-hover">
			<?php if($sticker && $sticker['name']){ ?>
			<a
			href="<?= $href; ?>"
			title="<?= $name; ?>"
			class="sticker absolute <?= $sticker['image'] ? 'sticker-image':''; ?>"
			style="color: <?= $sticker['color']; ?>; background-color: <?= $sticker['background-color']; ?>;">
				<?php if($sticker['image']){ ?>
				    <img src="<?= $sticker['image'] ?>" />
				<?php } else {
				    echo $sticker['name'];
				} ?>
			</a>
			<?php } ?>
			<?php if($show_special_sticker){ ?>
			<a
			href="<?= $href; ?>"
			title="<?= $name; ?>"
			class="special-sticker absolute"
			style="top:<?= $sticker ? '45px' : '0px' ?>; color: #fff; background-color: #B21117;">
				<?= $text_sale; ?>
			</a>
			<?php } ?>
			<a
				href="<?= $href; ?>"
				title="<?= $name; ?>"
				class="product-image image-container relative" >
				<img
					src="<?= $thumb; ?>"
					alt="<?= $name; ?>"
					title="<?= $name; ?>"
					class="img-responsive img1" />


				<!-- <div id="product-image-main-id-<?=$product_id;?>" class="product-image-main-<?=$product_id;?>">
		      <?php foreach($images as $image){ ?>
		          <img src="<?= $image['thumb']; ?>" alt="<?= $name; ?>" title="<?= $name; ?>"
		            class="main_images pointer" href="<?= $image['popup']; ?>" title="<?= $heading_title; ?>"
		            data-zoom-image="<?= $image['zoom']; ?>"
		          />
		      <?php } ?>
		    </div> -->

				<?php if($thumb2 && $hover_image_change) { ?>
					<!-- <div id="product-image-main-id-<?=$product_id;?>" class="product-image-main-<?=$product_id;?>">
			      <?php foreach($images as $image){ ?>
			          <img src="<?= $image['thumb']; ?>" alt="<?= $name; ?>" title="<?= $name; ?>"
			            class="main_images pointer" href="<?= $image['popup']; ?>" title="<?= $heading_title; ?>"
			            data-zoom-image="<?= $image['zoom']; ?>"
			          />
			      <?php } ?>
			    </div> -->

					<img
						src="<?= $thumb2; ?>"
						alt="<?= $name; ?>"
						title="<?= $name; ?>"
						class="img-responsive img2" style="display: none"/>
				<?php } ?>
				<?php /*if($more_options){ ?>
				<div class="more-options-text absolute position-bottom-center">
					<?= $more_options; ?>
				</div>
				<?php }*/ ?>
			</a>

			<div class="btn-group product-button">

				<div class="overlay" onclick="window.location='<?= $href ?>'">
					<img src="image/catalog/project/general/magnifying.png" class="img-responsive" alt="viewMore" />
					<p>View More</p>
				</div>
				<?php if ($options) { ?>
					<button type="button"
						<?php if($enquiry){ ?>
							class="btn btn-default btn-enquiry btn-enquiry-<?= $product_id; ?> hidden" data-product-id="<?= $product_id; ?>"
						<?php }else{ ?>
							class="btn btn-default btn-cart btn-cart-<?= $product_id; ?> hidden" data-product-id="<?= $product_id; ?>"
						<?php } ?>
						>
						<i class="fa fa-shopping-cart"></i>
					</button>
				<?php } else { ?>
					<button type="button"
						<?php if($enquiry){ ?>
							onclick="enquiry.add('<?= $product_id; ?>', '<?= $minimum; ?>');"
						<?php }else{ ?>
							onclick="cart.add('<?= $product_id; ?>', '<?= $minimum; ?>');"
						<?php } ?>
						class="btn btn-default hidden">
						<i class="fa fa-shopping-cart"></i>
					</button>
				<?php } ?>
				<button type="button" onclick="wishlist.add('<?= $product_id; ?>');" class="hidden btn wishlist-btn btn-default product_wishlist_<?= $product_id; ?>">
					<i class="fa <?= in_array($product_id, $wishlist) ?'fa-heart':'fa-heart-o';?>"></i>
				</button>
				<button type="button" onclick="compare.add('<?= $product_id; ?>');" class="hidden btn btn-default hide">
					<i class="fa fa-exchange"></i>
				</button>
			</div>
		</div>

		<div class="product-image-additional-container related hidden">
			<div class="product-image-additional-<?=$product_id;?>">
				<?php foreach($additional_images as $image){ ?>
				<img src="<?= $image['thumb']; ?>" alt="<?= $name; ?>" title="<?= $name; ?>" class="pointer img-responsive additional-img" />
				<?php } ?>
			</div>
		</div>

		<div class="product-name">
			<a href="<?= $href; ?>"><?= $name; ?></a>
		</div>
		<div class="support-desc">
			<?= $support_description; ?>
		</div>

		<div class="flex product-details product-price-<?=$product_id?>">
			<?php if ($price && !$enquiry) { ?>
				<div class="price">
					<?php if (!$special) { ?>
						<span class="price-new"><?= $price; ?></span>
					<?php } else { ?>
						<span class="price-new"><?= $special; ?></span>
						<span class="price-old"><?= $price; ?></span>
					<?php } ?>
					<?php if ($tax) { ?>
						<span class="price-tax"><?= $text_tax; ?> <?= $tax; ?></span>
					<?php } ?>
				</div>
			<?php } ?>

			<?php if($enquiry){ ?>
			<span class="label label-primary hidden">
				<?= $label_enquiry; ?>
			</span>
			<?php } ?>

			<div class="cart-buttons">
				<input type="hidden" name="product_id" value="<?=$product_id?>">
				<?php if(!$enquiry){ ?>
				<?php if(!$not_avail) { ?>
					<button type="button" data-loading-text="<?= $text_loading; ?>" class="btn btn-primary btn-cart btn-cart-<?= $product_id; ?>" data-product-id="<?= $product_id; ?>">
						<img src="image/catalog/project/general/cart-1.png" alt="cart" class="img-reponsive">
					</button>
				<?php } ?>
				<?php }else{ ?>
				<button type="button" data-loading-text="<?= $text_loading; ?>" class="btn btn-primary btn-enquiry btn-enquiry-<?= $product_id; ?>"  data-product-id="<?= $product_id; ?>"><?= $button_enquiry; ?></button>
				<?php } ?>
		  	</div>
		</div>
		<?php /* product option in product component */ ?>
			<div class="product-inputs">
		    <?php if ($options && count($options) == 1) { ?>
				<div class="product-option">
				    <?php foreach ($options as $option) { ?>
					    <?php if ($option['type'] == 'select') { ?>
					    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
					      <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
					      <select name="option[<?= $option['product_option_id']; ?>]" id="input-option<?= $option['product_option_id']; ?>" class="form-control" data-product-id="<?= $product_id; ?>">
					        <option value=""><?= $text_select; ?></option>
					        <?php foreach ($option['product_option_value'] as $option_value) { ?>
					        <option value="<?= $option_value['product_option_value_id']; ?>"><?= $option_value['name']; ?>
					        <?php if ($option_value['price']) { ?>
					        (<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
					        <?php } ?>
					        </option>
					        <?php } ?>
					      </select>
					    </div>
					    <?php } ?>
					    <?php if ($option['type'] == 'radio') { ?>
					    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
					      <label class="control-label"><?= $option['name']; ?></label>
					      <div id="input-option<?= $option['product_option_id']; ?>">
					        <?php foreach ($option['product_option_value'] as $option_value) { ?>
					        <div class="radio">
					          <label>
					            <input type="radio" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option_value['product_option_value_id']; ?>" data-product-id="<?= $product_id; ?>" />
					            <?php if ($option_value['image']) { ?>
					            <img src="<?= $option_value['image']; ?>" alt="<?= $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
					            <?php } ?>
					            <?= $option_value['name']; ?>
					            <?php if ($option_value['price']) { ?>
					            (<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
					            <?php } ?>
					          </label>
					        </div>
					        <?php } ?>
					      </div>
					    </div>
					    <?php } ?>
					    <?php if ($option['type'] == 'checkbox') { ?>
					    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
					      <label class="control-label"><?= $option['name']; ?></label>
					      <div id="input-option<?= $option['product_option_id']; ?>">
					        <?php foreach ($option['product_option_value'] as $option_value) { ?>
					        <div class="checkbox">
					          <label>
					            <input type="checkbox" name="option[<?= $option['product_option_id']; ?>][]" value="<?= $option_value['product_option_value_id']; ?>" data-product-id="<?= $product_id; ?>" />
					            <?php if ($option_value['image']) { ?>
					            <img src="<?= $option_value['image']; ?>" alt="<?= $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
					            <?php } ?>
					            <?= $option_value['name']; ?>
					            <?php if ($option_value['price']) { ?>
					            (<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
					            <?php } ?>
					          </label>
					        </div>
					        <?php } ?>
					      </div>
					    </div>
					    <?php } ?>
					    <?php if ($option['type'] == 'text') { ?>
					    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
					      <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
					      <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" placeholder="<?= $option['name']; ?>" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
					    </div>
					    <?php } ?>
					    <?php if ($option['type'] == 'textarea') { ?>
					    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
					      <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
					      <textarea name="option[<?= $option['product_option_id']; ?>]" rows="5" placeholder="<?= $option['name']; ?>" id="input-option<?= $option['product_option_id']; ?>" class="form-control"><?= $option['value']; ?></textarea>
					    </div>
					    <?php } ?>
					    <?php if ($option['type'] == 'file') { ?>
					    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
					      <label class="control-label"><?= $option['name']; ?></label>
					      <button type="button" id="button-upload<?= $option['product_option_id']; ?>" data-loading-text="<?= $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?= $button_upload; ?></button>
					      <input type="hidden" name="option[<?= $option['product_option_id']; ?>]" value="" id="input-option<?= $option['product_option_id']; ?>" />
					    </div>
					    <?php } ?>
					    <?php if ($option['type'] == 'date') { ?>
					    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
					      <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
					      <div class="input-group date">
					        <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
					        <span class="input-group-btn">
					        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
					        </span></div>
					    </div>
					    <?php } ?>
					    <?php if ($option['type'] == 'datetime') { ?>
					    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
					      <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
					      <div class="input-group datetime">
					        <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
					        <span class="input-group-btn">
					        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
					        </span></div>
					    </div>
					    <?php } ?>
					    <?php if ($option['type'] == 'time') { ?>
					    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
					      <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
					      <div class="input-group time">
					        <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" data-date-format="HH:mm" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
					        <span class="input-group-btn">
					        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
					        </span></div>
					    </div>
					    <?php } ?>
				    <?php } ?>
				</div>
		    <?php } ?>
	    	<div class="form-group hidden">
	          	<label class="control-label"><?= $entry_qty; ?></label>
		        <div class="input-group">
		          <span class="input-group-btn">
		            <button type="button" class="btn btn-default btn-number" data-type="minus" data-field="qty-<?= $product_id; ?>" data-product-id="<?= $product_id; ?>" onclick="descrement($(this).parent().parent())")>
		              	<span class="glyphicon glyphicon-minus"></span>
		            </button>
		          </span>
		          <input type="text" name="quantity" class="form-control input-number integer text-center" id="input-quantity-<?= $product_id; ?>" value="<?= $minimum; ?>" data-product-id="<?= $product_id; ?>" >
		          <span class="input-group-btn">
		            <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="qty-<?= $product_id; ?>" data-product-id="<?= $product_id; ?>" onclick="increment($(this).parent().parent())">
		              	<span class="glyphicon glyphicon-plus"></span>
		            </button>
		          </span>
		        </div>
	        </div>
		  </div>
		<?php /* product option in product component */ ?>

		<?php if($rating) { ?>
		<div class="rating">
			<?php for ($i = 1; $i <= 5; $i++) { ?>
			<?php if ($rating < $i) { ?>
			<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
			<?php } else { ?>
			<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
			<?php } ?>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
	<script type="text/javascript">
		$(window).load(function(){
			setTimeout(function () {
				product_slick<?=$product_id;?>();
				AOS.init();
			},150);
		});

		function product_slick<?=$product_id;?>(){
			$("#product-image-main-id-<?=$product_id;?>").on('init', function (event, slick) {
				$('#product-image-main-id-<?=$product_id;?>').parent().removeAttr('style');
			});

			// $("#product-image-main-id-<?=$product_id;?>").slick({
			// 		dots: false,
			// 		infinite: false,
			// 		speed: 300,
			// 		slidesToShow: 1,
			// 		slidesToScroll: 1,
			// 		arrows: true,
			// 		prevArrow: "<div class='pointer slick-nav left prev'></div>",
			// 		nextArrow: "<div class='pointer slick-nav right next'></div>",
			// 	});


				// $('.product-image-additional-<?=$product_id;?>').slick({
				// 	slidesToShow: 3,
				// 	slidesToScroll: 1,
				// 	asNavFor: '.product-image-main-<?=$product_id;?>',
				// 	dots: false,
				// 	centerMode: false,
				// 	focusOnSelect: true,
				// 	infinite: false,
				// 	prevArrow: "<div class='pointer slick-nav left prev'></div>",
				// 	nextArrow: "<div class='pointer slick-nav right next'></div>",
				// });

		}

	</script>
</div>
