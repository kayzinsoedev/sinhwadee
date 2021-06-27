<div class="container-fluid">
    <div class="category_row">
        <?php foreach ($categories as $category){?>
            <div class="category_btn"> 
                <a href= "<?=$category['btnlink_'];?>" class="btn btns-primary">
                    <?= $category['btn_name']?>                 
                </a> 
            </div>
        <?php } ?>
    </div>
</div>