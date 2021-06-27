<div class="container-fluid">
    <div class="category_download">
        <?php foreach ($downloads as $download){?>
            <div class="mediaimg-download col-xs-6">
                <a href= "image/<?=$download['download_file'];?>" class="btn btns-primary" download>
                    <img src="image/<?=$download['download_image'];?>" class="img-responsive" />
                </a>
            </div>
        <?php } ?>
    </div>
</div>
<script>
    $(".category_btn:nth-child(2) a").addClass("active");
</script>
