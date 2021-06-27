<div class="">
	<div class="pd-30 pd-md-60">
		<?php if ($article_videos) { ?>
			<div class="content blog-videos">
				<?php foreach ($article_videos as $video) { ?>
					<?php echo ($video['text']) ? '<h2 class="video-heading">'.$video['text'].'</h2>' : ''; ?>
					<div>
						<?php echo $video['code']; ?>
					</div>
				<?php } ?>
			</div>
		<?php } ?>
		<?php if ($thumb) { ?>
		<div class="pd-b30 text-center">
			<img class="w100" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
		</div>
		<?php } ?>

		<div class="pd-b15"><h3 class="bold news_title"><?php echo $news_title; ?></h3></div>

		<div class="pd-b15">
			<img src="image/catalog/project/general/calendar.png" alt="calendar"/>
			<span class="img-calendar"><?php echo $date_added; ?></span>
		</div>

		<div class="pd-b15 content-description"><?php echo $description; ?></div>

		<div class="pd-t30 pd-b30 flex flex-vcenter">
			<div class="pd-r15"><?= $text_share ?>:</div>
			<div><?= $share_html ?></div>
		</div>

	</div>

	<?php if ($related_products) { ?>
	<?= $related_products ?>
	<?php } ?>

	<?php if ($related_products_slider) { ?>
	<?= $related_products_slider ?>
	<?php } ?>

</div>
