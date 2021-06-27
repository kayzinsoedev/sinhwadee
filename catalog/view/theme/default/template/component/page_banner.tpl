<div class='page-banner relative'>
    <img src="<?= $banner_image; ?>" alt="<?= $page_name; ?>" class="img-responsive hidden-xs" />
    <img src="<?= $mobile_banner_image; ?>" alt="<?= $page_name; ?>" class="img-responsive visible-xs" />

    <div class="page-banner-title absolute position-center-center container text-center">
        <h3><?= $title; ?></h3>
        <ul class="banner_breadcrumb"></ul>
    </div>
</div>
<script>
    $( document ).ready(function() {
        var copyBreadcrumb = $('.breadcrumb').html();
        $('.banner_breadcrumb').html(copyBreadcrumb);
    });
</script>