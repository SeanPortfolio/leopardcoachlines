<?php

if($page_blog->url == $page && $segment2 !== ''){
	$slideshow_query = fetch_row("SELECT `photo` FROM `page_meta_data` WHERE `url` = '".$segment2."'");
	$bg_img = ' style="background:url('.$slideshow_query['photo'].');background-position: center;background-size: cover;"';

$slideshow_view = <<<HTML
    <section id="heroshot-section" class="heroshot__wrapper {$section_cls}">
      <div class="heroshot ss" {$bg_img}>
      </div>
    </section>
HTML;

} else{

$slideshow_photos = fetch_all("SELECT `full_path`, `width`, `height`
FROM `photo`
WHERE `photo_group_id` = '{$slideshow_id}'
AND `full_path` != ''
ORDER BY `rank`");


$slideshow_photos_count = count($slideshow_photos);

$first_image_details = $slideshow_photos[0];

$first_image = $first_image_details['full_path'];

$bg_img = (($first_image && $slideshow_photos_count === 1) ? ' style=" background-image:url('.$first_image.'); "' : '');

// heroshot
$slideshow_view = <<<HTML
    <section id="heroshot-section" class="heroshot__wrapper {$section_cls}">
      <div class="heroshot" {$bg_img}>
        {$caption_view}
      </div>
      {$scroll_view}
    </section>
HTML;
}