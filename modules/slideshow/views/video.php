<?php

/*$primary_photo_details = fetch_row("SELECT `photo_group_id`, `full_path` 
	FROM `photo`
	WHERE `photo_group_id` = '{$slideshow_id}'
	ORDER BY `rank`
	LIMIT 1");

if( $primary_photo_details )
{

	$photo_group_id = $primary_photo_details['photo_group_id'];

	$slideshow_view = '<div id="slider-container">';

	$slideshow_view .= '<a href="#" class="nav prev" data-launch-gallery="'.$photo_group_id.'"><i class="glyphicons glyphicons-chevron-left"></i></a>
						<a href="#" class="nav next" data-launch-gallery="'.$photo_group_id.'"><i class="glyphicons glyphicons-chevron-right"></i></a>';

	$slideshow_view .= '<div id="slideshow" class="has-bg" style="background-image:url('.$primary_photo_details['full_path'].');" data-launch-gallery="'.$photo_group_id.'">';
	$slideshow_view .= '</div>';
	
	$slideshow_view .= '</div>';

	$jsVars['data']['initGallery']       = true;
	$jsVars['templates']['galleryModal'] = file_get_contents("{$tmpldir}/underscore/gallery.tmpl");


}*/

$section_cls    = (!empty($is_home_page)) ? ' video--fs' : '';
$slideshow_view = <<<HTML
	<section class="video__wrapper{$section_cls}">
		<div class="video__item">
			<div id="video_player" class="video_player" data-youtube-id="{$youtube_id}"></div>				
			<div class="banner__slider-caption">
	           <span class="banner__slider-header">Experience New Zealand's premium luxury coachline</span>
	           <a href="{$page_fleet->full_url}" class="btn btn--ghost btn--hover-green banner__slider-button"> Our Coaches <i class="fa fa-angle-right"></i></a>
	         </div>
	         <a href="#" class="scroll-trigger">
	          <span class="hidden-xs hidden-sm">
	            <i class="fa fa-angle-down fade-in fa-2x banner__slider-icon"></i>
	          </span>
	         </a>
	         <div class="banner__slider-overlay"></div>
		</div>
	</section>
HTML;

?>