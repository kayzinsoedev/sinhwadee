<?php if ($article) { ?>
	<div class="news-list-wrap flex flex-wrap">
		<?php foreach ($article as $articles) { ?>
			<?php if(!empty($articles)){ ?>
			<!-- id=61 ->newsletter -->
			<?php if($cat_id == "61"){ ?>
					<div class="news-post newsletter b4-col b4-col-100p pd-t15 pd-b15">
					<!-- id=59 ->recipes -->
			<?php }elseif($cat_id == "59"){ ?>
					<div class="recipes news-post b4-col b4-col-100p b4-col-50p-md pd-t15 pd-b15">
			<?php }elseif($cat_id == "66"){ ?>
						<div class="download-img news-post b4-col b4-col-100p b4-col-50p-md pd-t15 pd-b15">
			<?php }else{ ?>
						<div class="archive-img news-post b4-col b4-col-100p pd-t15 pd-b15">
			<?php } ?>

				<?php if($cat_id == "61"){ ?>
							<div class="mg-b30 relative hover-overlay newsletter-img-section">
				<?php }else{ ?>
							<div class="mg-b30 relative hover-overlay">
				<?php } ?>

					<?php if ($articles['video']) { ?>
						<!-- <?php debug("if");?> -->
								<div class="cover-bg center-bg pd-b80p" style="background-image:url('<?php echo $articles['thumb']; ?>');"></div>
						<div class="cover-bg video-media center-bg pd-b80p hidden">
									<img src="<?php echo $articles['thumb']; ?>" class="img-responsive"/ data-pop="<?=$articles['video']; ?>" >
						</div>
						<?php /* ?>
						<img class="article-image img-responsive" src="" title="<?php echo $articles['name']; ?>" alt="<?php echo $articles['name']; ?>" />
						<?php */ ?>
					<?php } else { ?>
						<!-- <?php debug("else");?> -->
						<?php if ($articles['thumb']) { ?>
						<?php if($cat_id == "59" || $cat_id == "61"){ ?>
							<!-- <?php debug("if");?> -->
								<a href="<?php echo $articles['href']; ?>">
										<div class="cover-bg center-bg pd-b80p" style="background-image:url('<?php echo $articles['thumb']; ?>');" data-pop="<?php echo $articles['thumb']; ?>"></div>
										<div class="cover-bg center-bg pd-b80p hide">
													<img src="<?php echo $articles['thumb']; ?>" class="img-responsive"/ data-pop="<?php echo $articles['thumb']; ?>">
										</div>
										<?php /* ?>
										<img class="article-image img-responsive" src="" title="<?php echo $articles['name']; ?>" alt="<?php echo $articles['name']; ?>" />
										<?php */ ?>
							</a>
						<?php } else if($cat_id == "66"){ ?>
							<!-- <?php debug("else if");?> -->
								<a href="image/catalog/project/media/<?=$articles['download_file'];?>" download>
										<div class="cover-bg center-bg pd-b80p" style="background-image:url('<?php echo $articles['thumb']; ?>');" data-pop="<?php echo $articles['thumb']; ?>"></div>
								</a>
						<?php }else{ ?>
							<!-- <?php debug("else");?> -->
							<div>
										<div class="cover-bg center-bg pd-b80p" style="background-image:url('<?php echo $articles['thumb']; ?>');" data-pop="<?php echo $articles['thumb']; ?>"></div>
										<div class="cover-bg center-bg pd-b80p hide">
													<img src="<?php echo $articles['thumb']; ?>" class="img-responsive"/ data-pop="<?php echo $articles['thumb']; ?>">
										</div>
										<?php /* ?>
										<img class="article-image img-responsive" src="" title="<?php echo $articles['name']; ?>" alt="<?php echo $articles['name']; ?>" />
										<?php */ ?>
							</div>
						<?php } ?>
						<?php } ?>
					<?php } ?>
					<div class="to-overlay">
								<!-- ID 59 is recipes -->
								<!-- ID 61 is newsletter -->
								<?php if($cat_id == "59" || $cat_id == "61"){ ?>
								<a href="<?php echo $articles['href']; ?>">
										<div class="absolute position-center-center colorblack"><i class="fa fa-search fa-2em"></i><p> View More</p></div>
								</a>
							<?php }else if($cat_id == "66"){ ?>
									<a href="image/catalog/project/media/<?=$articles['download_file'];?>" download>
											<div class="absolute position-center-center colorblack"><i class="fa fa-download fa-2em"></i><p></p></div>
									</a>
							<?php } else{ ?>
										<div class="absolute position-center-center colorblack"><i class="fa fa-search fa-2em"></i><p> View More</p></div>
							<?php } ?>
					</div>
				</div>

				<?php if($cat_id == "61"){ ?>
							<div class="newsletter-content-section">
				<?php }else{ ?>
							<div class="">
				<?php } ?>

					<?php if ($articles['name']) { ?>
						<div class="article-name bold pd-b15"><a href="<?php echo $articles['href']; ?>"><?php echo $articles['name']; ?></a></div>
					<?php } ?>
					<?php if ($articles['date_added']) { ?>
						<div class="pd-b15">
							<img src="image/catalog/project/general/calendar.png" alt="calendar"/>
							<span class="img-calendar"><?php echo $articles['date_added']; ?></span>
						</div>
					<?php } ?>
					<?php if ($articles['description']) { ?>
						<div class="article-description pd-b15"><?php echo $articles['description']; ?></div>
					<?php } ?>
					<?php if ($articles['button']) { ?>
						<div class="article-button"><a href="<?php echo $articles['href']; ?>"><?php echo $button_read_more; ?></a></div>
					<?php } ?>
				</div>
			</div>


		<?php } ?>
		<?php } ?>
  </div>


	<?php if ($articles['video']) { ?>
	<div class="modal fade" id="videomodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="absolute position-center-center">
					<div class="modal-dialog">
							<div class="modal-content">
									<div class="modal-body">
											<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
											<div class="embeddmediaVideo"></div>
									</div>
							</div>
					</div>
			</div>
	</div>
<?php }else{ ?>
		<div class="modal fade" id="archivemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="absolute position-center-center">
						<div class="modal-dialog">
								<div class="modal-content">
										<div class="modal-body">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
												<img src="" class="imagepreview" style="width: 100%;" >
										</div>
								</div>
						</div>
				</div>
		</div>
<?php } ?>

  <div class="text-center pd-b60"><?php echo $pagination; ?></div>

<?php } ?>






<script>
    $(function() {
		$('.archive-img').on('click', function() {
					console.log('<?=$articles['video'];?>');
					if('<?=$articles['video'];?>' !=""){
								$('.embeddmediaVideo').html('<?=$articles['video'];?>');
								$('#videomodal').modal('show');
					}else{
								$('.imagepreview').attr('src', $(this).find('img').attr('data-pop'));
								$('#archivemodal').modal('show');
					}
				});
    });
</script>
