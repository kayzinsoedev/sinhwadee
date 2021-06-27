<div class="newsletter-module<?= $uniqid ?> newsletter-module">
    <form id="form-newsletter<?= $uniqid ?>">
        <div class="pd-b15 text-center"><div class="f60 orange"><h3><?= $title ?></h3></div></div>
        <?php if($description) { ?>
        <div class="pd-b15 desc"><?= $description ?></div>
        <?php } ?>
		
		<?php if($has_subscribed) { ?>
		<div class="text-center"><?= $text_has_subscribed ?></div>
		<?php }else{ ?>
		<div class="flex mg-b30 input-wrap">
			<div class="flex-1"><input type="email" id="newsletter-input-email<?= $uniqid ?>" name="email" value="<?= $email ?>" class="form-control w100" placeholder="<?= $email_field_placeholder_text; ?>" /></div>
			<div class="text-center text-sm-right"><button type="button" id="submit-newsletter<?= $uniqid ?>" data-loading-text="<?= $text_loading; ?>" class="btn btn-primary"><?= $submit_button_field_text; ?></button></div>
		</div>
		<?php } ?>
	</form>
</div>
<script type="text/javascript">
$(document).on('click', '#submit-newsletter<?= $uniqid ?>', function(){
	$.ajax({
		url: 'index.php?route=extension/module/newsletter_module/validate',
		type: 'post',
		data: $('#form-newsletter<?= $uniqid ?>').serialize(),
		dataType: 'json',
		beforeSend: function () {
			$('#submit-newsletter<?= $uniqid ?>').button('loading');
		},
		complete: function () {
			$('#submit-newsletter<?= $uniqid ?>').button('reset');
		},
		success: function (json) {
			$('.newsletter-module<?= $uniqid ?> .text-danger').remove();

			if (json['error']) {
				for (i in json['error']) {
					//var element = $('#newsletter-input-<?= $uniqid ?>' + i);
					//element.after('<div class="text-danger">' + json['error'][i] + '</div>');

                    swal({
						title: '<?= $error_title ?>',
						html: json['error'][i],
						type: "error"
					});
				}
			}

			if (json['success']) {
                swal({
                    title: '<?= $success_title ?>',
                    html: json['success'],
                    type: "success"
                });
			}
		},
		error: function (xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
</script>