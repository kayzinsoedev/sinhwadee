<?php echo $header; ?>
<div class="container">
  <?php echo $content_top; ?>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger">
    <button type="button" class="close pull-right" data-dismiss="alert">×</button>
    <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">

      <h2><?php echo $heading_title; ?></h2>
      <div class="text-login text-center">
        <?=$text_account_already?>
      </div>
      <form id="register-form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <?php include_once('register_mod_function.tpl'); ?>

        <div class="col-sm-6">
          <?php foreach($form_left as $each){ ?>
            <?= mod($each); ?>
          <?php } ?>

          <?php foreach($form_right as $each){ ?>
            <?= mod($each); ?>
          <?php } ?>

        </div>

        <div class="row">
            <div class="col-sm-6 left p-0-i">
              <label>
                <input id="create-corporate" name="corporate" type="checkbox" class="form-control" value="1" <?= $corporate?'checked':''; ?> onclick="createCorporate()" />
                Create Corporate Account
              </label>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <input type="text" id="company-name" name="company_name" class="form-control" placeholder="Company Name">
            </div>
            <div class="col-sm-6">
                <input type="text" id="uen-number" name="uen_number" class="form-control" placeholder="Company UEN number">
            </div>
        </div>


        <div class="row">
          <div class="col-sm-12">
            <hr/>
          </div>
        </div>


        <div class="col-sm-6 left p-0-i">
          <label>
            <input type="checkbox" class="form-control" name="newsletter" value="1" <?= $newsletter?'checked':''; ?> />
            <?= $text_newsletter; ?>
          </label>
        </div>

        <div class="col-sm-6 right text-sm-right p-0-i">
          <label>
          <?php if ($text_agree) { ?>
              <?php if ($agree) { ?>
              <input type="checkbox" name="agree" value="1" checked="checked" class="form-control" />
              <?php } else { ?>
              <input type="checkbox" name="agree" value="1" class="form-control" />
              <?php } ?>
              <?php echo $text_agree; ?>
          <?php }  ?>
          </label>
        </div>

        <div class="row">
          <div class="col-sm-12">
            <br/>
          </div>
        </div>

        <div class="reg-footer text-center flex">
          <div class="reg-captcha"> <?php echo $captcha; ?></div>
          <div class="col-sm-6 p-0-i text-center">
            <input type="submit" value="<?php echo $button_proceed; ?>" class="btn btn-primary float-sm-right" />
          </div>
        </div>

      </form>
      </div>
    <?php echo $column_right; ?></div>
    <?php echo $content_bottom; ?>
</div>
<script type="text/javascript">

var company_name = document.getElementById("company-name");
var uen_number = document.getElementById("uen-number");

$( document ).ready(function() {
      company_name.style.display = "none";
      uen_number.style.display = "none";
});


function createCorporate(){
    var checkBox = document.getElementById("create-corporate");

    // If the checkbox is checked, display the output text
    if (checkBox.checked == true){
      company_name.style.display = "block";
      uen_number.style.display = "block";
    } else {
      company_name.style.display = "none";
      uen_number.style.display = "none";
    }
}

<!--

$('input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('.custom-field').hide();
			$('.custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('#custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('#custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}


		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
$('.birthday').datetimepicker({
	pickTime: false,
  	format: 'YYYY-MM-DD',
	maxDate: moment()
});
//--></script>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<script type="text/javascript"><!--
 $(window).load(function(){
   postalcode('#input_postcode', '#input_address_1', '#input_address_2');
 });
//--></script>
<?php echo $footer; ?>
