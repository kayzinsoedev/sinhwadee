

<link href="catalog/view/theme/default/stylesheet/sinhwadee.css" rel="stylesheet">


<div id="footer-area">
<?php
	// Please get license key for this mailchimp extension before use it thanks
	/*if($mailchimp){ ?>
	<div class="newsletter-section text-center">
		<?= $mailchimp; ?>
	</div>
<?php }*/ ?>

<footer>
	<div class="container-fluid-x">
		<div class="footer-upper-contet">

			<div class="footer-contact-info">
				<?php if($footer_admin_icon){ ?>
					<img src="image/<?= $footer_admin_icon; ?>" title="footer-logo" class="footer-logo img-responsive" alt="footer-logo" />
				<?php } ?>

				<h5><?= $store; ?></h5>
				<p class="m0">
					<?= $address; ?><br/>
					<?= $text_telephone; ?>: <a href="tel:<?= $telephone; ?>" ><?= $telephone; ?></a><br/>
					<?php if($fax){ ?>
						<?= $text_fax; ?>: <a href="fax:<?= $fax; ?>" ><?= $fax; ?></a><br/>
					<?php } ?>
					<!-- <?= $text_email; ?>: <a href="mailto:<?= $email; ?>" ><?= $email; ?></a><br/> -->
					<!-- <?php if($config_sales_email){ ?>
						<?= $text_sales_enq; ?>: <a href="mailto:<?= $config_sales_email; ?>" ><?= $config_sales_email; ?></a><br/>
					<?php } ?>
					<?php if($config_brand_email){ ?>
						<?= $text_brand_enq; ?>: <a href="mailto:<?= $config_brand_email; ?>" ><?= $config_brand_email; ?></a><br/>
					<?php } ?>
					<?php if($config_purchase_email){ ?>
						<?= $text_purchase_enq; ?>: <a href="mailto:<?= $config_purchase_email; ?>" ><?= $config_purchase_email; ?></a><br/>
					<?php } ?>
					<?php if($config_career_email){ ?>
						<?= $text_career_enq; ?>: <a href="mailto:<?= $config_career_email; ?>" ><?= $config_career_email; ?></a><br/>
					<?php } ?> -->

					<?=html($footer_email);?>


					<?php if($social_icons){ ?>
					<div class="footer-social-icons">
						<?php foreach($social_icons as $icon){ ?>
						<a href="<?= $icon['link']; ?>" title="<?= $icon['title']; ?>" alt="
									<?= $icon['title']; ?>" target="_blank">
							<img src="<?= $icon['icon']; ?>" title="<?= $icon['title']; ?>" class="img-responsive" alt="<?= $icon['title']; ?>" />
						</a>
						<?php } ?>
					</div>
					<?php } ?>
				</p>
			</div>

			<?php if ($menu) { ?>
				<?php foreach($menu as $menu_count => $links){ ?>
				<div class="footer-contact-links">
					<h5>
						<?php if($links['href'] != '#'){ ?>
						<?= $links['name']; ?>
						<?php }else{ ?>
						<a href="<?= $links['href']; ?>"
							<?php if($links['new_tab']){ ?>
								target="_blank"
							<?php } ?>
							>
							<?= $links['name']; ?></a>
						<?php } ?>
					</h5>
					<?php if($links['child']){ ?>
					<ul class="list-unstyled">
						<?php foreach ($links['child'] as $each) { ?>
						<li><a href="<?= $each['href']; ?>"
							<?php if($each['new_tab']){ ?>
								target="_blank"
							<?php } ?>

							>
								<?= $each['name']; ?></a></li>
						<?php } ?>
					</ul>
					<?php } ?>
					<?php if($menu_count == (count($menu) - 1)){
						echo $mailchimp;
					} ?>
				</div>
				<?php } ?>
			<?php } ?>

		</div>
	</div>

	<div class="footer-bottom">
		<div class="container-fluid-x flex-space">
			<div class="col-xs-12 col-sm-6">
				<p><?= $powered; ?></p>
			</div>
			<div class="col-xs-12 col-sm-6 text-sm-right">
				<p><?= $text_fcs; ?></p>
			</div>
		</div>
	</div>

    <div class="after-footer footer-logos vertical-align container-fluid">
        <div class="part-container">
            <div class="afterfooter-slide-container slideshow">
                <div id="after-footer" class="relative owl-carousel"  style="opacity: 1; width: 100%;">
                    <?php foreach ($footers as $footerss) { ?>
                    <div class="footer-users-slide">
                        <img src="image/<?= $footerss['top_image']; ?>" class="img-responsive" alt="footer_images"/>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
</footer>
</div>
<div id="ToTopHover" ></div>
<div id="whatsapp">
	<a href="http://wa.me/<?= $telephone; ?>" target="_blank">
		<img src="image/catalog/project/general/whatsapp.png" alt="Whatsapp Us">
	</a>
</div>



<?php if(isset($update_price_status) && $update_price_status) { ?>
	<script type="text/javascript">
    $(".product-inputs input[type='checkbox']").click(function() {
      var product_id = $(this).data('product-id');
      changePrice(product_id);
    });
    $(".product-inputs input[type='radio']").click(function() {
      var product_id = $(this).data('product-id');
      changePrice(product_id);
    });
    $(".product-inputs select").change(function() {
      var product_id = $(this).data('product-id');
      changePrice(product_id);
    });
    $(".input-number").blur(function() {
      var product_id = $(this).data('product-id');
      changePrice(product_id);
    });
    $(".input-number").parent(".input-group").find(".btn-number").click(function() {
      var product_id = $(this).data('product-id');
      changePrice(product_id);
    });
    function changePrice(product_id) {
      $.ajax({
        url: 'index.php?route=product/product/updatePrice&product_id=' + product_id,
        type: 'post',
        dataType: 'json',
        data: $('#product-'+ product_id + ' input[name=\'quantity\'], #product-'+ product_id + ' select, #product-'+ product_id + ' input[type=\'checkbox\']:checked, #product-'+ product_id + ' input[type=\'radio\']:checked'),
        success: function(json) {
          $('.alert-success, .alert-danger').remove();
          if(json['new_price_found']) {
            $('.product-price-'+product_id+' .price .price-new').html(json['total_price']);
            $('.product-price-'+product_id+' .price .price-tax').html(json['tax_price']);
          } else {
            $('.product-price-'+product_id+' .price .price-new').html(json['total_price']);
            $('.product-price-'+product_id+' .price .price-tax').html(json['tax_price']);
          }
        }
      });
    }
	</script>
<?php } ?>
<script>AOS.init({
	once: true
});</script>
<script type="text/javascript">
$('#after-footer').owlCarousel({
	items: 1,
	<?php if (count($footers) > 1) { ?>
		loop: false,
	<?php } ?>
	autoplay: true,
	autoplayTimeout: 5000,
	margin:1,
	smartSpeed: 450,
	  responsive: {
		0: {
		  items: 6,
		  margin: 0,
		  nav: false,
		  dots: false,
		},
		480: {
		  items: 6,
		  margin: 0,
		  nav: false,
		  dots: false,
		},
		540: {
		  items: 6,
		  margin: 0,
		  dots: false,
		  nav: false,
		},
		767: {
		  items: 6,
		  margin: 15,
		  dots: false,
		},
		992: {
		  items: 12,
		  margin: 15,
		},
	  },

	nav: true,
	navText: ['<div class="pointer absolute position-top-left h100 slider-nav slider-nav-left hover-show"><div class="absolute position-center-center navs"><img src="image/catalog/project/general/prev-active.png" alt="previous" /></div></div>',
			'<div class="pointer absolute position-top-right h100 slider-nav slider-nav-right hover-show"><div class="absolute position-center-center navs"><img src="image/catalog/project/general/next-active.png" alt="next"/></div></div>'],
	dots: false,
	dotsClass: 'slider-dots slider-custom-dots absolute float-sm-right list-inline text-center',

	//animateOut: 'slideOutDown',
	//animateIn: 'slideInDown',
});
</script>
<?php
/* extension bganycombi - Buy Any Get Any Product Combination Pack */
echo $bganycombi_module;
?>
</body></html>
