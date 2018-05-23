<?php

// homepage
// services page
// service individual page with options
// setup service page as important page

if($page == 'home'){
	require_once 'views/home.php';
} else if($page == $page_services->url && !$segment1){
	require_once 'views/list.php';
} else if ($page == $page_services->url && $segment1) {
    require_once 'views/service_individual.php';
}

?>