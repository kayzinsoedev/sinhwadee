<h2>Recipes</h2>
<div class="">

<div id="related_blog">

<?php foreach($blog_relateds as $key=> $blog_related){?>
  <!-- <?php debug($blog_related);?> -->
    <div class="related_blog">
        <div class="related_inner_section">
            <div class="related-container">
                <?php if(isset($blog_related['video'])) { ?>
                  <?= $blog_related['video']; ?>
                <?php } else { ?>
                  <?php if ($blog_related['image']) { ?>
                  <a href="<?=$blog_related['href'];?>">
                    <div class="cover-bg center-bg pd-b80p" style="background-image:url('image/<?php echo $blog_related['image']; ?>');"></div>
                  </a>
                  <?php } ?>
                <?php } ?>

                <div class="to-overlay">
                  <a href="<?=$blog_related['href'];?>" class="block absolute position-all0">
                    <div class="absolute position-center-center colorblack"><i class="fa fa-search fa-2em"></i><p> View More</p></div>
                  </a>
                </div>

            </div>

            <div class="related_content">
              <div class="article-name bold pd-b15"><a href=""><?=$blog_related['title'];?></a></div>
              <div class="pd-b15">
                <img src="image/catalog/project/general/calendar.png" alt="calendar"/>
                <span class="img-calendar"><?=$blog_related['date_added'];?></span>
              </div>
              <div class="article-description pd-b15"><?=html($blog_related['description']);?></div>
          </div>

          <div class="article-button"><a href="<?php echo $blog_related['href']; ?>">Read More</a></div>

      </div>

    </div>

<?php } ?>
</div>
</div>


<script type="text/javascript">

  $(window).load(function(){
    setTimeout(function () {
      related_blog();
      AOS.init();
    }, 250);
  });

  function related_blog(){
    $("#related_blog").on('init', function (event, slick) {
      $('#related_blog').parent().removeAttr('style');
    });

    $("#related_blog").slick({
      dots: false,
      infinite: false,
      speed: 300,
      slidesToShow: 3,
      slidesToScroll: 1,
      responsive: [
        {
          breakpoint: 1201,
          settings: {
            slidesToShow: 4,
          }
        },
        {
          breakpoint: 993,
          settings: {
            slidesToShow: 3,
          }
        },
        {
          breakpoint: 769,
          settings: {
            slidesToShow: 2,
          }
        },
        {
          breakpoint: 541,
          settings: {
            slidesToShow: 2,
            arrows: false,
            autoplay: true,
            autoplaySpeed: 5000
          }
        },
        {
          breakpoint: 415,
          settings: {
            slidesToShow: 2,
            arrows: false,
            autoplay: true,
            autoplaySpeed: 5000
          }
        },
        {
          breakpoint: 376,
          settings: {
            slidesToShow: 1,
            arrows: false,
            autoplay: true,
            autoplaySpeed: 5000
          }
        }
      ],
      prevArrow: "<div class='pointer slick-nav left prev absolute'><div class='absolute position-center-center'><img src='image/catalog/project/general/prev-active.png' alt='previous'/></div></div>",
      nextArrow: "<div class='pointer slick-nav right next absolute'><div class='absolute position-center-center'><img src='image/catalog/project/general/next-active.png' alt='previous'/></div></div>",
    });


  }
</script>
