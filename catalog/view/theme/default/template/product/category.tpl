<?php echo $header; ?>

<div class="shop-page-banner">
  <div id="shop_page_banner_slick">
    <?php foreach($shop_page_banners as $shop_page_banner){ ?>
          <img src="image/<?=$shop_page_banner['image'];?>" alt="shop-page-banner">
    <?php  } ?>
  </div>
</div>

<div class="container-fluid">
  <?php echo $content_top; ?>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <?php if($module_status =="1"){ ?>
      <div class="shop-location">
          <span class="shop-location-txt">Shop Us Here</span>
          <span class="shop-location-img">
          <?php foreach($shop_locations as $shop_location){ ?>
              <a href="<?=$shop_location['link'];?>"><img src="image/<?=$shop_location['image'];?>"></a>
          <?php } ?>
          </span>
      </div>
  <?php } ?>


  <div class="row">
    <br>
    <h2 class="hidden"><?php echo $heading_title; ?></h2>
    <br><br>

    <div class="shop-us-section">

    </div>

    <?php echo $column_left; ?>

    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>


    <div id="content" class="<?php echo $class; ?>">

      <div id="product-filter-replace">
        <div id="product-filter-loading-overlay"></div>

          <?php if ($products) { ?>

            <?php include_once('sort_order.tpl'); ?>

            <div id="product-filter-detect">

              <div class="row row-special">
                <div class="product-view">
                  <?php foreach ($products as $product) { ?>
                    <?php echo $product; ?>
                  <?php } ?>
                </div>
              </div>

              <div class="row">
                <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
              </div>

            </div> <!-- product-filter-detect -->

          <?php } ?>

          <?php if (!$products) { ?>

            <p><?php echo $text_empty; ?></p>
            <div class="buttons hidden">
              <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>

          <?php } ?>
      </div> <!-- product-filter-replace -->
    </div> <!-- #content -->
    <?php echo $column_right; ?></div>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>


<script type="text/javascript">

  $(window).load(function(){
    setTimeout(function () {
      shop_page_banner_slick();
      AOS.init();
    }, 250);
  });

  function shop_page_banner_slick(){
    $("#shop_page_banner_slick").on('init', function (event, slick) {
      $('#shop_page_banner_slick').parent().removeAttr('style');
    });

    $("#shop_page_banner_slick").slick({
      // dots: true,
      infinite: false,
      speed: 300,

      prevArrow: "<div class='pointer slick-nav left prev absolute'><div class='absolute position-center-center'><img src='image/catalog/project/general/prev-active.png' alt='previous'/></div></div>",
      nextArrow: "<div class='pointer slick-nav right next absolute'><div class='absolute position-center-center'><img src='image/catalog/project/general/next-active.png' alt='previous'/></div></div>",
    });


  }
</script>
