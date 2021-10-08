<div class="container-fluid row">
    <div class="col-md-3 about-sidebar">
      <?php foreach ($main_categories as $key=> $main_category){ ?>
          <div class="category-div">
              <a href="index.php?route=information/information&information_id=4#<?=$main_category['main_category_name'];?>""><p class="sidebar-about-main-cat"><?=$main_category['main_category_name']; ?></p></a>
              <?php foreach ($slogans as $key=> $slogan) { ?>
                    <?php if($main_category['id'] == $slogan['main_categories'] ){ ?>
                          <a href="index.php?route=information/information&information_id=4#about-sub-title<?=$key;?>"><p class="sidebar-aboutsub_title"><?= $slogan['sub_title']; ?></p></a>
                    <?php } ?>
              <?php }?>
          </div>
      <?php } ?>
    </div>

    <div class="col-md-9 about-main-div">
        <div class="">
          <?php foreach ($main_categories as $key=> $main_category){ ?>
            <div id="<?=$main_category['main_category_name'];?>" class="category-div">
            <?php foreach ($slogans as $key=> $slogan) { ?>
                <?php if($main_category['id'] == $slogan['main_categories'] ){ ?>
                  <?php if($slogan['module_status'] =="1"){ ?>
                <?php if ($slogan['alignment'] == '0') { ?>
                    <div id="about-sub-title<?=$key;?>" class="flex about-container">
                        <div class="section2-desc desc-left col-sm-7">
                            <div class="desc-container desc-read-more-section1">
                                <?php if ($slogan['main_title']) { ?>
                                    <p class="aboutmain_title"><?= $slogan['main_title']; ?></p>
                                <?php } ?>
                                <p class="aboutsub_title"><?= $slogan['sub_title']; ?></p>
                                <span class="abt-desc"><?php echo html($slogan['desc_title']); ?></span>
                            </div><br>
                        </div>
                        <div class="col-sm-5 rightimage">
                            <?php if(!empty($slogan['top_image'])){ ?>
                                  <img src="<?= $slogan['top_image']; ?>" class="img-responsive" alt="aboutus_image"/>
                            <?php } ?>
                        </div>
                    </div>
                <?php } elseif($slogan['alignment'] == '1') { ?>
                    <div id="about-sub-title<?=$key;?>" class="flex about-container">
                        <div class="col-sm-5">
                            <?php if(!empty($slogan['top_image'])){ ?>
                                  <img src="<?= $slogan['top_image']; ?>" class="img-responsive" alt="aboutus_image"/>
                            <?php } ?>
                        </div>
                        <div class="section2-desc desc-right col-sm-7">
                            <div class="desc-container desc-read-more-section2">
                                <?php if ($slogan['main_title']) { ?>
                                    <p class="aboutmain_title"><?= $slogan['main_title']; ?></p>
                                <?php } ?>
                                <p class="aboutsub_title"><?= $slogan['sub_title']; ?></p>
                                <span class="abt-desc"><?php echo html($slogan['desc_title']); ?></span>
                            </div><br>
                        </div>
                    </div>
                <?php }else{ ?>
                  <div id="about-sub-title<?=$key;?>" class="flex about-container">
                      <div class="section3-desc desc-right col-sm-12">
                          <div class="desc-container desc-read-more-section3">
                              <p class="aboutsub_title"><?= $slogan['sub_title']; ?></p>
                              <span class="abt-desc"><?php echo html($slogan['desc_title']); ?></span>
                          </div><br>
                      </div>
                  </div>
                <?php } ?>

                <?php } ?>

                <?php } ?>

            <?php } ?>
              </div>
            <?php } ?>
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
