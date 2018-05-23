<?php
$slideshow_view = '';
$body_cls     = '';

$mobileDetect = new Mobile_Detect();
$isMobileDevice  = ($mobileDetect->isMobile() || $mobileDetect->isTablet());
$browserIsIE = (preg_match('~MSIE|Internet Explorer~i', $_SERVER['HTTP_USER_AGENT']) || (strpos($_SERVER['HTTP_USER_AGENT'], 'Trident/7.0; rv:11.0') !== false));
$isHomePage = ($main_page_id === $page_home->id);

if($page_services->url == $page && $segment1){

	$sql = fetch_row("SELECT pmd.`slideshow_id`,
								 pmd.`url`
					FROM `page_meta_data` pmd
					WHERE pmd.`url` = '{$segment1}'");

	@extract($sql);
}

if ($isHomePage && $youtube_id && empty($browserIsIE) && !$browserIsIE && !$isMobileDevice) {
    require_once("views/video.php");
} elseif ($slideshow_id) {
    require_once("views/slider.php");
} elseif (!empty($page_photo)) {
    require_once("views/heroshot.php");
}

//var_dump($slideshow_view);die;

$tags_arr['body_cls'] .= " {$body_cls}";

$tags_arr['slideshow_view'] = $slideshow_view;


?>
