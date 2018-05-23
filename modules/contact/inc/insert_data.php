<?php 
	date_default_timezone_set( 'Pacific/Auckland' );

	$enquiry_data = array();

	$enquiry_data['full_name']        = $fname.' '.$lname;
	$enquiry_data['contact_info']     = $email_address;
	$enquiry_data['phone']            = $phone;
	$enquiry_data['subject']          = $subject;
	$enquiry_data['message']          = $message;
	$enquiry_data['date_of_enquiry']  = date('Y-m-d H:i:s');
	$enquiry_data['status']           = 'A';
	$enquiry_data['ip_address']       = getenv('REMOTE_ADDR');

	// if all posted data is valid store enquiry information in database
	$new_enquiry = insert_row($enquiry_data, 'enquiry');
	
	$contact_details = array();

	if($new_enquiry) 
	{	
		$contact_details = fetch_row("SELECT `full_name`, `contact_info`, `phone`,  `subject`, `message`, DATE_FORMAT(`date_of_enquiry`, '%e %M %Y @ %h:%i %p') AS date_enquired
			FROM `enquiry`
			WHERE `id` = '$new_enquiry'
			LIMIT 1");

		$email_template_tags = array();
		$email_template_tags['email_subject'] = 'You have received a new enquiry from website.';

		$email_template_tags = array_merge($email_template_tags, $contact_details);


		$etemplate_path = "{$tmpldir}/email/contact.tmpl";

		$email_template = process_template($etemplate_path, $email_template_tags);

		if( $email_template )
		{

			require_once "$classdir/class_phpmailer.php";

			$company_email   = ($comp_emails->primaryEmail) ? $comp_emails->primaryEmail : '';

			if( $company_email )
			{
				$mail = new PHPMailer();
				$mail->IsHTML();
				$mail->AddReplyTo($email_template_tags['email_address']);
				$mail->AddAddress($company_email);
				if( !empty($comp_emails) )
				{
					foreach ($comp_emails->list as $email)
					{
						$mail->AddCC($email);
					}
				}

				$mail->SetFrom($company_email);
				$mail->FromName = "{$email_template_tags['name']}";
				$mail->Subject  = $email_template_tags['email_subject'];
				$mail->msgHTML($email_template);

				if( $mail->Send() )
				{
					header("Location: {$htmlrootfull}/{$page}?success=".md5($new_enquiry));
					exit();
				}

			}
			
		}
		
	} 
?>