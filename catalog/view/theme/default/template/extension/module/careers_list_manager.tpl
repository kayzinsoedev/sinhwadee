
<?php if ($job_type_title1 && $fulltimes) { ?>
<section class="career1 container-fluid">
    <h3 class="text-center career-title"><?= nl2br($job_type_title1); ?></h3>
    <h4 class="career-tdesc"><?= html($job_type_desc1); ?></h4>
    <h4 class="text-center career-subtitle"><?= html($job_type_subtitle); ?></h4>

    <div class="panel-group" id="accordion-1" role="tablist" aria-multiselectable="true">
        <?php $x=1; $i=1; $j=1; $k=1; foreach ($fulltimes as $fulltime) { ?>
            <div class="panel panel-default" id="panel<?= $k++ ?>">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" class="collapsed" data-target="#collapses<?= $i++ ?>">
                            <?= nl2br($fulltime['position_name1']); ?>
                            <i class="fa fa-plus ii8-fa" aria-hidden="true"></i>
                            <i class="fa fa-minus ii8-fa d-none" aria-hidden="true"></i>
                        </a>
                    </h4>
                </div>
                <div id="collapses<?= $j++ ?>" class="panel-collapse collapse">
                    <div class="panel-body">
                        <?= html($fulltime['position_desc1']); ?>
                        <a id="btn-1" data-toggle="modal" data-target="#myModal-1" class="btn btn-primary" style="margin-top: 25px;">APPLY NOW</a>				
                    </div>
                </div>
            </div>
        <?php } ?>
        <!-- Modal Fulltime-->
        <div class="modal fade ii8-modal" id="myModal-1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title text-left" id="myModalLabel">
                            Application Form
                        </h4>				
                        <p class="submodaltitle">Please fill up the details below.</p>
                    </div>
                    <div class="modal-body">

                        <form action="<?= $action ?>" method="post" id="career1" enctype="multipart/form-data">
                            <div class="row">
                                
                                <div class="form-group required col-sm-12">
				                    <label class="control-labels">Position Applying</label>
                                    <select id="input-positions" name="position" class="form-control">
                                        <?php  foreach ($fulltimes as $fulltime) { ?>
                                            <option value="<?= $fulltime['position_name1']; ?>"><?= $fulltime['position_name1']; ?></option>
                                        <?php } ?>
                                    </select>
                                        <?php if ($error_position) { ?>
                                            <div class="text-danger"><?= $error_position; ?></div>
                                        <?php } ?>
                                </div>
                                <div class="form-group required col-sm-6">
                                    <label class="control-label">First Name</label>
                                    <input type="text" name="fname" placeholder="First Name" value="<?= $fname; ?>" id="input-fnames" class="form-control input-theme" />
                                        <?php if ($error_fname) { ?>
                                            <div class="text-danger"><?= $error_fname; ?></div>
                                        <?php } ?>
                                </div>
                                <div class="form-group required col-sm-6">
                                <label class="control-label">Last Name</label>
                                    <input type="text" name="lname" placeholder="Last Name" value="<?= $lname; ?>" id="input-lnames" class="form-control input-theme" />
                                        <?php if ($error_lname) { ?>
                                            <div class="text-danger"><?= $error_lname; ?></div>
                                        <?php } ?>
                                </div>
                                <div class="form-group required col-sm-6">
                                    <label class="control-label">Email</label>
                                    <input type="text" name="email" placeholder="Email Address" value="<?= $email; ?>" id="input-emails" class="form-control input-theme" />
                                        <?php if ($error_email) { ?>
                                                <div class="text-danger"><?= $error_email; ?></div>
                                        <?php } ?>
                                </div>
                                <div class="form-group required col-sm-6">
                                    <label class="control-label">Contact No.</label>
                                    <input type="text" name="contact" placeholder="Contact Number" value="<?= $contact; ?>" id="input-contacts" class="form-control input-theme" />
                                    <?php if ($error_contact) { ?>
                                            <div class="text-danger"><?= $error_contact; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="form-group required col-sm-12">
                                    <label class="control-label">Address</label>
                                    <input type="text" name="address" placeholder="Address" value="<?= $address; ?>" id="input-address" class="form-control input-theme" />
                                        <?php if ($error_address) { ?>
                                                <div class="text-danger"><?= $error_address; ?></div>
                                        <?php } ?>
                                </div>

                                <div class="form-group required col-sm-12"> 
                                    <label class="control-label">Your Resume</label> <br/>
                                    <label class="btn btn-primary btn-files">
                                    <span data-toggle="tooltip" title="" data-original-title="pdf, docx only">UPLOAD</span>
                                    <input type="file" id="uploadfile" name="cvfile" value="<?= $cvfile; ?>"/> 
                                    </label>
                                    <input placeholder="<?= $aacept_file; ?>" class="form-control" id="cvfile" name="cvfile" value="<?= $cvfile; ?>"/> 
                                    <?php if ($error_cvfile) { ?>
                                        <div class="text-danger"><?= $error_cvfile; ?></div>
                                    <?php } ?>
                                </div>

                                <div class="required col-sm-6 hidden">
                                        <?= $captcha; ?>
                                </div>
                                <div class="col-sm-6 submits">
                                        <input class="btn btn-primary fulltime_submit" type="submit" name="submit1" value="Submit"/>
                                </div>
                                <input id="fileNamePath" name="fileNamePath" value="" hidden/>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<?php } ?>


<script>
    var siteRoot = window.location.origin;
    var extendPathRoot = siteRoot + "/sinhwadee/image/catalog/project/career_uploads/";
    $('#fileNamePath').val(extendPathRoot);
    $(document).ready(function () {
        $("#btn-1").click(function(){
           // $("#myModal-1").modal("show");
             localStorage.setItem("modalName", "myModal-1");
        });
        $("#btn-2").click(function(){
          //  $("#myModal-2").modal("show");
             localStorage.setItem("modalName", "myModal-2");
        });
        
    });
    
    setTimeout(function(){
        var thisModal = localStorage.getItem("modalName");
        if($('#myModal-1 .modal-body .text-danger').length > 0){
        $("#"+thisModal).modal("show");
            $('html, body').animate({ scrollTop: $('.text-danger').first().offset().top - $('.fixed-header').outerHeight()}, 500);
        }
    },8000);
    
    $('#uploadfile').on('change',function(evt) {
        $('#cvfile').val(evt.target.files[0].name);
    });
    jQuery(function ($) {
        var $active = $('#accordion-1 .panel-collapse.in').addClass('active');
        $('#accordion-1').on('show.bs.collapse', function (e) {
            $(e.target).prev().addClass('active').find('.fa-minus').removeClass('d-none');
            $(e.target).prev().addClass('active').find('.fa-plus').addClass('d-none');
            $('#accordion-1 .panel-heading.active').removeClass('active').find('.glyphicon').toggleClass('glyphicon-plus glyphicon-minus');
            $(e.target).prev().addClass('active').find('.glyphicon').toggleClass('glyphicon-plus glyphicon-minus');
        })
        $('#accordion-1').on('hide.bs.collapse', function (e) {
            $(e.target).prev().removeClass('active').find('.fa-plus').removeClass('d-none');
            $(e.target).prev().removeClass('active').find('.fa-minus').addClass('d-none');
        });
    });
</script>
