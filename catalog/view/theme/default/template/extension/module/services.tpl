<div class="container-fluid services-section">

  <div class="col-md-3 about-sidebar">
    <?php foreach ($main_categories as $key=> $main_category){ ?>
        <div class="category-div">
            <a href="index.php?route=information/information&information_id=7#<?=$main_category['main_category_name'];?>""><p class="sidebar-about-main-cat"><?=$main_category['main_category_name']; ?></p></a>

            <?php foreach ($services as $key=> $service) { ?>
                  <?php if($main_category['id'] == $service['main_categories'] ){ ?>
                        <a href="index.php?route=information/information&information_id=7#about-sub-title<?=$key;?>"><p class="sidebar-aboutsub_title"><?= $service['title']; ?></p></a>
                  <?php } ?>
            <?php }?>
        </div>
    <?php } ?>
  </div>

    <div class="col-md-9 about-main-div">
      <div class="">
      <?php foreach ($main_categories as $key=> $main_category){ ?>
        <div id="<?=$main_category['main_category_name'];?>" class="category-div">

      <?php foreach ($services as $key=> $service) { ?>

        <?php if($main_category['id'] == $service['main_categories'] ){ ?>
          <?php if($service['module_status'] == "1"){ ?>
          <?php if ($service['alignment'] == '0') { ?>
              <div id="about-sub-title<?=$key;?>" class="flex about-container reverse-container">
                  <!-- <div class="section2-desc desc-left service-content"> -->
                  <div class="section2-desc desc-left col-sm-7">
                      <div class="infor-desc desc-container desc-read-more-section1">
                          <h3><?= $service['title']; ?></h3>
                          <div class="desc-container">
                              <span class="abt-desc"><?php echo html($service['description']); ?></span>
                          </div><br>
                      </div><br>
                  </div>
                  <!-- <div class="service-img rightimage col-sm-5"> -->
                  <div class="col-sm-5 rightimage">
                      <img src="<?= $service['top_image']; ?>" class="img-responsive" alt="aboutus_image"/>
                  </div>
              </div>
          <?php } elseif($service['alignment'] == '1') { ?>

              <div id="about-sub-title<?=$key;?>" class="flex about-container">
                  <!-- <div class="service-img col-sm-5"> -->
                  <div class="col-sm-5">
                      <img src="<?= $service['top_image']; ?>" class="img-responsive" alt="aboutus_image"/>
                  </div>
                  <!-- <div class="desc-right w-100 service-content"> -->
                  <div class="section2-desc col-sm-7">
                      <div class="infor-desc desc-container desc-read-more-section1">
                          <h3><?= $service['title']; ?></h3>
                          <div class="desc-container">
                              <span class="abt-desc"><?php echo html($service['description']); ?></span>
                          </div><br>
                      </div><br>
                  </div>

              </div>

          <?php }else{ ?>
              <div id="about-sub-title<?=$key;?>" class="flex about-container">
                  <div class="section3-desc desc-right col-sm-12">
                      <div class="desc-container desc-read-more-section3">
                          <p class="aboutsub_title"><?= $service['title']; ?></p>
                          <span class="abt-desc"><?php echo html($service['description']); ?></span>
                      </div><br>
                  </div>
              </div>
          <?php } ?>

          <?php } ?>

          <?php } ?>

      <?php } ?>

      <?php } ?>
      <!-- main category -->

  </div>

  </div>



</div>



<script src="catalog/view/javascript/readMoreJS.min.js" type="text/javascript"></script>
<script>

$readMoreJS.init({
   target: '.desc-container .abt-desc',           // Selector of the element the plugin applies to (any CSS selector, eg: '#', '.'). Default: ''
   numOfWords: 50,               // Number of words to initially display (any number). Default: 50
   toggle: true,                 // If true, user can toggle between 'read more' and 'read less'. Default: true
   moreLink: 'read more',    // The text of 'Read more' link. Default: 'read more ...'
   lessLink: 'read less'         // The text of 'Read less' link. Default: 'read less'
});

</script>
