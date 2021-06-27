<div class="container-fluid media-archives">
    <div class="category_download relative">
        <?php foreach ($archives as $archive){?>
            <div class="archive-img col-xs-6 "> 
                <img src="image/<?=$archive['download_image'];?>" data-pop="image/<?=$archive['pop_image'];?>" class="img-responsive archive-pop" />
                <p class="archive-title"><?=$archive['title'];?></p>
                <div class="to-overlay">
                    <div class="absolute magnify position-center-center">
                        <img src="image/catalog/project/general/magnifying.png" class="img-responsive"/>
                    <p>View more</p>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
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
</div>
<script>
    $(".category_btn:nth-child(1) a").addClass("active");
    $(function() {
		$('.archive-img').on('click', function() {
			$('.imagepreview').attr('src', $(this).find('img').attr('data-pop'));
			$('#archivemodal').modal('show');   
		});		
    });
</script>