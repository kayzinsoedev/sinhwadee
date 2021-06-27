<?php 
class ControllerExtensionModuleCareersListManager extends Controller {
    private $error = array();
    // Add New Post by defining it here
    private $posts = array(
        'subject'	=>	'',
        'email'		=>	'',
    );

    // Add your post value to ignore in the email body content
    private $disallow_in_message_body = array(
        'var_abc_name'
    );

    public function populateDefaultValue(){
        $this->posts['name']		= $this->customer->getFirstName();
        $this->posts['email']		= $this->customer->getEmail();
    }
                
    public function index() {
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'careers_list_manager';

        $data['job_type_title1'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'job_type_title1');
        $data['job_type_desc1'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'job_type_desc1');
        $data['job_type_subtitle'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'job_type_subtitle');
        $data['aacept_file'] = 'We accept Microsoft Word and PDF format. Please only upload files that are below 1mb.';
        //debug($job_type_title1);

        $fulltimes = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'fulltimes');
        $data['fulltimes'] = array();
        if(!empty($fulltimes)) {
            usort($fulltimes, array($this,"sortFulltime"));
            $data['fulltimes'] = $fulltimes;
        }
        
        $data['action'] = $this->url->link('information/information', 'information_id=9', true);
        // Populate values after customer logged in
        if($this->customer->isLogged()) {
            $this->populateDefaultValue();
        }
        //debug($this->request->post);

        if ((isset($_POST['submit1']) && $this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate() && !isset($this->request->get['success'])) {
            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

            $mail->setTo($this->config->get('config_email'));
            //$mail->setFrom($this->request->post['email']);
            $mail->setFrom($this->config->get('config_email'));
                
            $mail->setSender(html_entity_decode($this->request->post['fname'], ENT_QUOTES, 'UTF-8'));
            $mail->setSubject(html_entity_decode('Career Enquiry - '.$this->request->post['fname']));

            $message = "";
				
            foreach ($this->posts as $post_var => $post_default_value){
                if( !in_array($post_var, $this->disallow_in_message_body) ){
                    //$message .= $this->language->get('entry_' .$post_var) . ":\n";
                    //$message .= $this->request->post[$post_var]??"";
                    //$message .= $this->request->post[$post_var] ? $this->request->post[$post_var] : "";
                    $message .= "\n\n";
                }
            }
            $mail->setText($message);

            // Pro email Template Mod
            if($this->config->get('pro_email_template_status')){
                $this->load->model('tool/pro_email');
                $email_params = array(
                    'type' => 'admin.career.fulltime',
                    'mail' => $mail,
                    'reply_to' => $this->request->post['email'],
                    'data' => array(
                        'fname' => html_entity_decode($this->request->post['fname'], ENT_QUOTES, 'UTF-8'),
                        'lname' => html_entity_decode($this->request->post['lname'], ENT_QUOTES, 'UTF-8'),
                        'email' => html_entity_decode($this->request->post['email'], ENT_QUOTES, 'UTF-8'),
                        'contact' => html_entity_decode($this->request->post['contact'], ENT_QUOTES, 'UTF-8'),
                        'address' => html_entity_decode($this->request->post['address'], ENT_QUOTES, 'UTF-8'),
                        'position' => html_entity_decode($this->request->post['position'], ENT_QUOTES, 'UTF-8'),
                        'cvfile' => html_entity_decode($this->request->post['cvfile'], ENT_QUOTES, 'UTF-8'),
                        'fileNamePath' => nl2br(html_entity_decode($this->request->post['fileNamePath'], ENT_QUOTES, 'UTF-8')),
                    )
                );
                $this->model_tool_pro_email->generate($email_params);
            } else {
                $mail->send();
            }
            $this->response->redirect($this->url->link('information/information&information_id=9'));
        }

        if (isset($this->error['fname'])) {
                $data['error_fname'] = $this->error['fname'];
        } else {
                $data['error_fname'] = '';
        }

        if (isset($this->error['lname'])) {
                $data['error_lname'] = $this->error['lname'];
        } else {
                $data['error_lname'] = '';
        }

        if (isset($this->error['email'])) {
                $data['error_email'] = $this->error['email'];
        } else {
                $data['error_email'] = '';
        }

        if (isset($this->error['contact'])) {
                $data['error_contact'] = $this->error['contact'];
        } else {
                $data['error_contact'] = '';
        }

        if (isset($this->error['address'])) {
                $data['error_address'] = $this->error['address'];
        } else {
                $data['error_address'] = '';
        }

        if (isset($this->error['position'])) {
        $data['error_position'] = $this->error['position'];
        } else {
                $data['error_position'] = '';
        }

        if (isset($this->error['cvfile'])) {
        $data['error_cvfile'] = $this->error['cvfile'];
        } else {
                $data['error_cvfile'] = '';
        }

        if (isset($this->request->post['fname'])) {
                $data['fname'] = $this->request->post['fname'];
        } else {
                $data['fname'] = '';
        }

        if (isset($this->request->post['lname'])) {
                $data['lname'] = $this->request->post['lname'];
        } else {
                $data['lname'] = '';
        }

        if (isset($this->request->post['email'])) {
                $data['email'] = $this->request->post['email'];
        } else {
                $data['email'] = '';
        }

        if (isset($this->request->post['contact'])) {
                $data['contact'] = $this->request->post['contact'];
        } else {
                $data['contact'] = '';
        }

        if (isset($this->request->post['address'])) {
                $data['address'] = $this->request->post['address'];
        } else {
                $data['address'] = '';
        }

        if (isset($this->request->post['position'])) {
        $data['position'] = $this->request->post['position'];
        } else {
                $data['position'] = '';
        }

        if (isset($this->request->post['cvfile'])) {
        $data['cvfile'] = $this->request->post['cvfile'];
        } else {
                $data['cvfile'] = '';
        }

        if (isset($this->request->post['fileNamePath'])) {
        $data['fileNamePath'] = $this->request->post['fileNamePath'];
        } else {
                $data['fileNamePath'] = '';
        }

        // Captcha
        // $data['captcha'] = '';
        // if ($this->config->get($this->config->get('config_captcha') . '_status')) {
        //         $data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
        // }
        return $this->load->view('extension/module/careers_list_manager', $data);
        
        $this->response->redirect($this->url->link('information/information&information_id=8/success'));
    }
    
    function sortFulltime($object1, $object2){
        if (is_numeric($object1['sort']) && is_numeric($object2['sort'])) {
            return $object1['sort'] - $object2['sort'];
        }
    }
    
    public function validate() {
        if (isset($_FILES['cvfile'])) {
            $currentDirectory = getcwd();
            $uploadDirectory = "/image/catalog/project/career_uploads/";

            $fileExtensionsAllowed = ['pdf','docx'];

            $fileName = $_FILES['cvfile']['name'];
            $fileSize = $_FILES['cvfile']['size'];
            $fileTmpName  = $_FILES['cvfile']['tmp_name'];
            $fileType = $_FILES['cvfile']['type'];
            $filestmp = explode('.', $fileName);
            $fileExtension = strtolower(end($filestmp));

            $uploadPath = $currentDirectory . $uploadDirectory . basename($fileName); 
            $didUpload = move_uploaded_file($fileTmpName, $uploadPath);

            //debug($uploadPath);
        }


        if ((utf8_strlen($this->request->post['fname']) < 1) || (utf8_strlen($this->request->post['fname']) > 32)) {
            $this->error['fname'] = 'First name must be between 1 and 32 characters!';
        }

        if ((utf8_strlen($this->request->post['lname']) < 1) || (utf8_strlen($this->request->post['lname']) > 32)) {
            $this->error['lname'] = 'Last name must be between 1 and 32 characters!';
        }

        if (!filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
            $this->error['email'] = 'Invalid Email';
        }

        if ((utf8_strlen($this->request->post['contact']) < 1) || (utf8_strlen($this->request->post['contact']) > 12)) {
            $this->error['contact'] = 'Contact number must be between 1 and 12 characters!';
        }

        if ((utf8_strlen($this->request->post['address']) < 1) || (utf8_strlen($this->request->post['address']) > 32)) {
                $this->error['address'] = 'Address must be between 3 and 32 characters!';
        }

        if ((utf8_strlen($this->request->post['position']) < 1) || (utf8_strlen($this->request->post['position']) > 32)) {
                $this->error['position'] = 'You must select position!';
        }
     
        if ((utf8_strlen($this->request->post['cvfile']) < 1) || (utf8_strlen($this->request->post['cvfile']) == 0)) {
        $this->error['cvfile'] = 'Please upload a file!';
        }

        if (! in_array($fileExtension,$fileExtensionsAllowed)) {
        $this->error['cvfile'] = 'This file extension is not allowed. Please upload a pdf or docx file.';
        }
        
        if ($fileSize > 1000000) {
        $this->error['cvfile'] = 'File exceeds maximum size (1MB)';
        }

        // Captcha
        // if ($this->config->get($this->config->get('config_captcha') . '_status')) {
        //         $captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');
        //         if ($captcha) {
        //                 $this->error['captcha'] = $captcha;
        //         }
        // }
        return !$this->error;
    }

    public function success() {
        $this->load->language('information/contact');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_message'] = $this->language->get('text_success');

        $data['button_continue'] = $this->language->get('button_continue');

        $data['continue'] = $this->url->link('common/home');

        $data = $this->load->controller('component/common', $data); 

        $this->response->setOutput($this->load->view('common/success', $data));
    }
}
