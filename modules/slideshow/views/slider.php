<?php

$body_cls = ' home';

$section_cls    = (!empty($is_home_page)) ? ' slider--fs' : '';
$display_none   = ($page_home->url == $page) ? '' : 'display_none';

$slideshow_photos = fetch_all("SELECT `full_path`, `width`, `height`, `caption_heading`, `caption`, `alt_text`
    FROM `photo`
    WHERE `photo_group_id` = '{$slideshow_id}'
    AND `full_path` != ''
    ORDER BY `rank`");

if( !empty($slideshow_photos) )
{
    foreach ($slideshow_photos as $slideshow_photo)
    {
       $photo_path      = $slideshow_photo['full_path'];
       $photo_caption   = $slideshow_photo['caption'];
       $photo_alt_text  = $slideshow_photo['alt_text'];
       $slideshow_view .= <<<HTML
      <div class="banner__slider-figure">
         <div style="background:url('{$photo_path}');" class="banner__slider-img" title="{$photo_alt_text}"></div>
         <div class="banner__slider-caption">
           <span class="banner__slider-header">{$photo_caption}</span>
           <a href="{$page_fleet->full_url}" class="btn btn--ghost btn--hover-green banner__slider-button $display_none"> Our Coaches <i class="fa fa-angle-right"></i></a>
         </div>
         <a href="javascript:;" class="scroll-trigger">
          <span class="hidden-xs hidden-sm">
            <i class="fa fa-angle-down fade-in fa-2x banner__slider-icon"></i>
          </span>
         </a>
         <div class="banner__slider-overlay"></div>
      </div> 
HTML;
    }

    $slideshow_view = <<<HTML
        <section id="banner" class="banner">
            <div id="slider" class="banner__slider">
              <!--<div class="banner__slider-slide">-->
                {$slideshow_view}
              <!--</div>-->  
            </div><!-- /#slider -->
        </section><!-- /#slider-wrapper -->
HTML;
}



?>