
<h2><?= $sec_title; ?> </h2>
<div class="clientele-logo vertical-align container-fluid">
        <div class="part-container">
            <div class="home-users-slide-container slideshow">
                <div id="service-clientele" class="relative owl-carousel"  style="opacity: 1; width: 100%;">
                    <?php foreach ($client_logo as $client_logos) { ?>
                    <div class="clientele-users-slide" data-toggle="modal" data-target="#ServiceClientele-<?=$client_logos['id'];?>">
                        <img src="image/<?= $client_logos['logo']; ?>" class="img-responsive" alt="client_logo"/>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
</div>


<?php foreach($client_logo as $client_logos) {?>
<div class="modal fade custom-service" id="ServiceClientele-<?=$client_logos['id'];?>" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-body">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>

							<div id="" class="clientele-popup main pd-b20">
                      <?= html($client_logos['description']); ?>
							</div>
						</div>
					</div>

				</div>
			</div>

<?php } ?>



<script type="text/javascript">
    $('#service-clientele').owlCarousel({
        items: 1,
        <?php if (count($client_logo) > 1) { ?>
            loop: true,
        <?php } ?>
        autoplay: true,
        autoplayTimeout: 5000,
        margin:1,
        smartSpeed: 450,
          responsive: {
            0: {
              items: 1,
              margin: 0,
              nav: false,
              dots: false,
            },
            480: {
              items: 1,
              margin: 0,
              nav: false,
              dots: false,
            },
            540: {
              items: 1,
              margin: 0,
              dots: false,
              nav: false,
            },
            767: {
              items: 2,
              margin: 15,
              dots: false,
            },
            992: {
              items: 5,
              margin: 15,
            },
          },

        nav: true,
        navText: ['<div class="pointer absolute position-top-left h100 slider-nav slider-nav-left hover-show"><div class="absolute position-center-center navs"><img src="image/catalog/project/general/prev-active.png" alt="previous" /></div></div>',
                '<div class="pointer absolute position-top-right h100 slider-nav slider-nav-right hover-show"><div class="absolute position-center-center navs"><img src="image/catalog/project/general/next-active.png" alt="next"/></div></div>'],
        dots: false,
        dotsClass: 'slider-dots slider-custom-dots absolute float-sm-right list-inline text-center',

    });
</script>
