<div class="container-fluid product-list">
  <div class="col-md-12">
    <?php foreach($product_name as $name){ ?>
        <div class="col-md-6">
          <ul class="product-list-section">
             <li class="product-name"><?=$name;?></li>
          </ul>
        </div>
    <?php } ?>
  </div>
</div>
