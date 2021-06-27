<h3><?= $product_name; ?></h3>
<ul class="list-unstyled">
  <?php if ($manufacturer) { ?>
  <li class="hidden"><?= $text_manufacturer; ?> <a href="<?= $manufacturers; ?>"><?= $manufacturer; ?></a></li>
  <?php } ?>
  <li><span class="hidden"><?= $text_model; ?></span> <?php echo "<font id='product_model'>".$model."</font>"; // <- Related Options / Связанные опции ?></li>
  <?php if ($reward) { ?>
  <li class="hidden"><?= $text_reward; ?> <?= $reward; ?></li>
  <?php } ?>
  <li class="hidden"><?= $text_stock; ?> <?php echo "<font id='product_stock'>".$stock."</font>"; // <- Related Options / Связанные опции  ?></li>
</ul>
<?php /* completecombo */ ?>
<?php if (isset($salescombopgeoffers)) {  
  foreach($salescombopgeoffers as $offer) { 
    echo html_entity_decode($offer['html']); 
  } 
} ?>
<?php /* completecombo */ ?>
<?php if ($price && !$enquiry) { ?>
<ul class="list-unstyled">
  <?php if (!$special) { ?>
  <li>
    <div class="product-price old-prices" ><?= $price; ?></div>
  </li>
  <?php } else { ?>
    <li><span class="product-special-price new-prices"><?= $special; ?></span><span style="text-decoration: line-through; color:#797979;" class="old-prices"><?= $price; ?></span></li>
  <?php } ?>
  <?php if ($tax) { ?>
  <li class="product-tax-price product-tax" ><?= $text_tax; ?> <?= $tax; ?></li>
  <?php } ?>
  <?php if ($points) { ?>
  <li><?= $text_points; ?> <?= $points; ?></li>
  <?php } ?>
  <?php if ($discounts) { ?>
  <li>
    <hr>
  </li>
  <?php foreach ($discounts as $discount) { ?>
  <li><?= $discount['quantity']; ?><?= $text_discount; ?><?= $discount['price']; ?></li>
  <?php } ?>
  <?php } ?>
</ul>
<?php } ?>

<?php if($enquiry){ ?>
<div class="enquiry-block">
  <div class="label label-primary hidden">
    <?= $text_enquiry_item; ?>
  </div>
</div>
<?php } ?>
<div class="product-description">
  <?= $description; ?>
</div>

<?php include_once('product_options.tpl'); ?>

<?= $waiting_module; ?>

<?php if($share_html){ ?>
  <div class="input-group-flex">
    <span><?= $text_share; ?></span>
    <div><?= $share_html; ?></div>
  </div>
<?php } ?>

<?php if ($review_status) { ?>
<div class="rating">
  <p>
    <?php for ($i = 1; $i <= 5; $i++) { ?>
    <?php if ($rating < $i) { ?>
    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
    <?php } else { ?>
    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
    <?php } ?>
    <?php } ?>
    <a href="javascript:;" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?= $reviews; ?></a> / <a href="javascript:;" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?= $text_write; ?></a></p>
</div>
<?php } ?>