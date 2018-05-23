<?php 

require_once 'inc/vars.php';

if(sanitize_input('continue') === '1' && $form_is_valid === true)
{
	require_once 'inc/insert_data.php';
}
elseif( isset($_GET['success']) )
{
	require_once 'inc/views/success.php';
}
else
{

	require_once 'inc/views/form.php';
}

//if($page_contact->id == $page_id){
	$tags_arr['content'] = ($output) ? '<div class="row">'.$output.'</div>' : '';
//}
?>