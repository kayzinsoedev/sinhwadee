<div class="container-fluid">
    <div class="col-sm-4 col-xs-12 amain_title">
      <h2> <?= $sec_title; ?> </h2>
    </div>
    <div class="col-sm-8 col-xs-12 homeabout_content">
       <div class="home_about-content"><?php  echo html($about_upload); ?> </div>
        <div class="text-left">
            <a href="<?= $btn_link; ?>" class="btn btn-default">
                <?= $btn_name; ?>
            </a>
        </div>
    </div>
</div>