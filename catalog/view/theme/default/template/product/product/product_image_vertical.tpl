<?php if($images){ ?>
<div class="product-image-column flex vertical">
   <div class="product-image-additional-container related">
    <div class="product-image-additional">
      <?php foreach($additional_images as $image){ ?>
      <img src="<?= $image['thumb']; ?>" alt="<?= $heading_title; ?>" title="<?= $heading_title; ?>" class="pointer" />
      <?php } ?>
    </div>
  </div>
  <div class="product-image-main-container related relative">
    <?php if($sticker && $sticker['name']){ ?>
      <a 
      title="<?= $product_title; ?>" 
      class="sticker absolute <?= isset($sticker['image']) && $sticker['image'] ? 'sticker-image':''; ?>" 
      style="color: <?= $sticker['color']; ?>; background-color: <?= $sticker['background-color']; ?>">
          <?php if(isset($sticker['image']) && $sticker['image']){ ?>
              <img src="<?= $sticker['image'] ?>" />
          <?php } else { 
              echo $sticker['name']; 
          } ?>
      </a>
      <?php } ?>
      <?php if($show_special_sticker){ ?>
      <a 
      title="<?= $product_title; ?>" 
      class="special-sticker absolute" 
      style="top:<?= $sticker ? '30px' : '0px' ?>; color: #fff; background-color: red;">
        <?= $text_sale; ?>
      </a>
    <?php } ?>
    <div class="product-image-main">
      <?php foreach($images as $image){ ?>
          <img src="<?= $image['thumb']; ?>" alt="<?= $heading_title; ?>" title="<?= $heading_title; ?>"
            class="main_images pointer" href="<?= $image['popup']; ?>" title="<?= $heading_title; ?>"
            data-zoom-image="<?= $image['zoom']; ?>"
          />
      <?php } ?>
    </div>
  </div>
</div>
<?php } ?>