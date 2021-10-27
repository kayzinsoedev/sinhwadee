<div class="container-fluid content-gal">
    <?php foreach ($contents as $content) { ?>
        <?php if ($content['alignment'] == '0') { ?>
            <div class="flex about-container">
                <!-- If Small Image is Right Aligned-->
                <?php if ($content['small_alignment'] == '0') { ?>
                    <div class="smallSecContainer w-83">
                        <div class="flex" style="background:<?=$content['small_bg'];?>">
                            <div class="small-desc desc-left relative w-50">
                                <div class="desc-container">
                                    <?= nl2br($content['small_desc1']); ?><br>
                                    <a href="<?=$content['small_image_link'];?>" class="content-gal-link">Know More</a>
                                </div><br>
                            </div>
                            <!-- <div class="rightimage"  style="background-image:url(image/<?= $content['small_image1']; ?>);"> -->
                            <div class="rightimage gal-img">
                                    <img src="<?=$content['small_image1']; ?>">
                            </div>
                        </div>
                        <div class="flex" style="background:<?=$content['small_bg'];?>">
                            <!-- <div class="rightimage"  style="background-image:url(image/<?= $content['small_image2']; ?>);"> -->
                            <div class="rightimage gal-img">
                                  <img src="<?=$content['small_image2']; ?>">
                            </div>
                            <div class="small-desc desc-left relative w-50">
                                <div class="desc-container">
                                    <?= nl2br($content['small_desc2']); ?><br>
                                    <a href="<?=$content['small_image_link2'];?>" class="content-gal-link">Know More</a>
                                </div><br>
                            </div>
                        </div>
                    </div>
                <?php } else { ?>
                    <div class="smallSecContainer w-83">
                        <div class="flex" style="background:<?=$content['small_bg'];?>">
                            <!-- <div class="rightimage"  style="background-image:url(image/<?= $content['small_image1']; ?>);"> -->
                            <div class="rightimage gal-img">
                                  <img src="<?=$content['small_image1']; ?>">
                            </div>
                            <div class="small-desc desc-left relative w-50">
                                <div class="desc-container">
                                    <?= nl2br($content['small_desc1']); ?><br>
                                    <a href="<?=$content['small_image_link'];?>" class="content-gal-link">Know More</a>
                                </div><br>
                            </div>
                        </div>
                        <div class="flex" style="background:<?=$content['small_bg'];?>">
                            <div class="small-desc desc-left relative w-50">
                                <div class="desc-container">
                                    <?= nl2br($content['small_desc2']); ?><br>
                                    <a href="<?=$content['small_image_link2'];?>" class="content-gal-link">Know More</a>
                                </div><br>
                            </div>
                            <!-- <div class="rightimage"  style="background-image:url(image/<?= $content['small_image2']; ?>);"> -->
                            <div class="rightimage gal-img">
                                    <img src="<?=$content['small_image2']; ?>">
                            </div>
                        </div>
                    </div>
                <?php } ?>
                <div class="bigSecContainer-right flex w-100" style="background:<?=$content['big_bg'];?>">
                    <div class="left-BigImage-desc desc-left relative">
                        <div class="desc-container absolute position-center-center">
                            <?php echo html($content['top_image_desc']); ?><br>
                            <a href="<?=$content['top_image_link'];?>" class="content-gal-link">Know More</a>
                        </div><br>
                    </div>
                    <!-- <div class="right-BigImage" style="background-image:url(image/<?= $content['top_image']; ?>);"> -->
                    <div class="right-BigImage gal-img"><img src="<?=$content['top_image']; ?>">
                    </div>
                </div>
            </div>
        <?php } else { ?>
            <!-- If Big Image is Left Aligned-->
            <div class="flex about-container">
                <div class="bigSecContainer w-100 flex" style="background:<?=$content['big_bg'];?>">
                    <!-- <div class="left-BigImage" style="background-image:url(image/<?= $content['top_image']; ?>);"> -->
                    <div class="left-BigImage gal-img"><img src="<?=$content['top_image']; ?>">
                    </div>
                    <div class="left-BigImage-desc text-center relative">
                        <div class="desc-container">
                            <?= nl2br($content['top_image_desc']); ?><br>
                            <a href="<?=$content['top_image_link'];?>" class="content-gal-link">Know More</a>
                        </div><br>
                    </div>
                </div>
                <!-- If Small Image is Right Aligned-->
                <?php if ($content['small_alignment'] == '0') { ?>
                    <div class="smallSecContainer w-83">
                        <div class="flex" style="background:<?=$content['small_bg'];?>">
                            <div class="small-desc desc-left relative w-50">
                                <div class="desc-container">
                                    <?= nl2br($content['small_desc1']); ?><br>
                                    <a href="<?=$content['small_image_link'];?>" class="content-gal-link">Know More</a>
                                </div><br>
                            </div>
                            <!-- <div class="rightimage" style="background-image:url(image/<?= $content['small_image1']; ?>);"></div> -->
                            <div class="rightimage gal-img">
                                    <img src="<?=$content['small_image1']; ?>">
                            </div>
                        </div>
                        <div class="flex" style="background:<?=$content['small_bg'];?>">
                            <!-- <div class="rightimage" style="background-image:url(image/<?= $content['small_image2']; ?>);"> -->
                            <div class="rightimage gal-img">
                                <img src="<?=$content['small_image2']; ?>">
                            </div>
                            <div class="small-desc desc-left relative w-50">
                                <div class="desc-container">
                                    <?= nl2br($content['small_desc2']); ?><br>
                                    <a href="<?=$content['small_image_link2'];?>" class="content-gal-link">Know More</a>
                                </div><br>
                            </div>
                        </div>
                    </div>
                <?php } else { ?>
                    <div class="smallSecContainer w-83">
                        <div class="flex" style="background:<?=$content['small_bg'];?>">
                            <!-- <div class="rightimage" style="background-image:url(image/<?= $content['small_image1']; ?>);"> -->
                            <div class="rightimage gal-img">
                                    <img src="<?=$content['small_image2']; ?>">
                            </div>
                            <div class="small-desc desc-left relative w-50">
                                <div class="desc-container">
                                    <?= nl2br($content['small_desc1']); ?><br>
                                    <a href="<?=$content['small_image_link'];?>" class="content-gal-link">Know More</a>
                                </div><br>
                            </div>
                        </div>
                        <div class="flex" style="background:<?=$content['small_bg'];?>">
                            <div class="small-desc desc-left relative w-50">
                                <div class="desc-container">
                                    <?= nl2br($content['small_desc2']); ?><br>
                                    <a href="<?=$content['small_image_link2'];?>" class="content-gal-link">Know More</a>
                                </div><br>
                            </div>
                            <!-- <div class="rightimage" style="background-image:url(image/<?= $content['small_image2']; ?>);"> -->
                            <div class="rightimage gal-img">
                                    <img src="<?=$content['small_image2']; ?>">
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        <?php } ?>
    <?php } ?>
</div>
<script>
    $('.desc-container').each(function() {
        $(this).html($(this).html().split('\n').map(function(el) {return '<div class="split">' + el + ' </span>'}));
    });
</script>
