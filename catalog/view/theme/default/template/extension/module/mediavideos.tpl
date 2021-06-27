<div class="container-fluid media-videos">
    <div class="category_download relative">
        <?php foreach ($videos as $video){?>
            <div class="archive-img col-xs-6 ">
              <!-- <?php debug($video['video_link']);?> -->
                <img src="image/<?=$video['download_image'];?>" data-pop="<?=$video['video_link'];?>" class="img-responsive archive-pop" />
                <p class="archive-title"><?=$video['title'];?></p>
                <div class="to-overlay">
                    <div class="absolute magnify position-center-center">
                        <img src="image/catalog/project/general/play-button.png" class="img-responsive"/>
                    <p>Play Video</p>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
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
</div>
<script>
    $(".category_btn:nth-child(3) a").addClass("active");
    $(function() {
		$('.archive-img').on('click', function() {
			$('.embeddmediaVideo').html($(this).find('img').attr('data-pop'));
      console.log($(this).find('img').attr('data-pop'));
			$('#videomodal').modal('show');
		});
    });
</script>
