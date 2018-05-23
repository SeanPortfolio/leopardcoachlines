<?php

$reviews_view = '';


if( $page_reviews->url === $page )
{
    require_once 'inc/list.php';
}
else
{
	if($page_url !== $page_reviews->url){	
    	require_once 'inc/single.php';
	}
}

$tags_arr['testimonial_view'] = $reviews_view;

?>