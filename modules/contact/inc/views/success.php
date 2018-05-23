<?php 

$hashed_enquiry_id = $_GET['success'];

$is_enquiry = fetch_value("SELECT `id` FROM `enquiry` WHERE MD5(`id`) = '{$hashed_enquiry_id}' LIMIT 1");
if($is_enquiry)
{
	$headline = '
	
	<p><i class="fa fa-check-circle" style="padding-right: 20px; color: green;"></i>Thank you for your enquiry. We will get back to you as soon as possible.</p>';

    $tags_arr['introduction'] = $headline;


}
else
{
	header("Location: $htmlroot/{$page}");
	exit();
}



?>