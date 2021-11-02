<?php
class ControllerExtensionModuleContentGallery extends Controller {
	public function index() {
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'contentgallery';

        $contents = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'contents');
				// debug($contents);die;

				$this->load->model('tool/image');

        $data['contents'] = array();
        if(!empty($contents)) {
            // $data['contents'] = $contents;
        }

				foreach ($contents as $key => $value) {
						$data['contents'][$key] = array(
								'top_image' => $this->model_tool_image->resize($value['top_image'], 400, 487),
								'top_image_desc' => $value['top_image_desc'],
								'top_image_link' => $value['top_image_link'],
								'alignment' => $value['alignment'],
								'big_bg' => $value['big_bg'],
								'small_image1' => $this->model_tool_image->resize($value['small_image1'], 400, 247),
								'small_desc1' => $value['small_desc1'],
								'small_image_link' => $value['small_image_link'],
								'small_alignment' => $value['small_alignment'],
								'small_image2' => $this->model_tool_image->resize($value['small_image2'], 400, 247),
								'small_desc2' => $value['small_desc2'],
								'small_image_link2' => $value['small_image_link2'],
								'small_bg' => $value['small_bg'],
						);

				}

				// $this->model_tool_image->resize($result['image'], $image_popup_width, $image_popup_height),
				// debug($data['contents']);die;

		return $this->load->view('extension/module/contentgallery', $data);
    }

}
