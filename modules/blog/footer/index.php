<?php

$post = fetch_row("SELECT pmd.`heading`, pmd.`full_url`, pmd.`title`, pmd.`description`, pmd.`short_description`,
	pmd.`photo` AS photo_path, pmd.`thumb_photo` AS thumb_photo_path, 
	IF(bp.`date_posted`, DATE_FORMAT(bp.`date_posted`, '%M %d, %Y'), '') AS posted_on,
	TRIM(CONCAT(cu.`user_fname`, ' ', cu.`user_lname`)) AS author_name,
	REPLACE(LOWER(TRIM(cu.`user_fname`)), ' ', '-') AS author_url
	FROM `blog_post` bp
	LEFT JOIN `page_meta_data` pmd
	ON(pmd.`id` = bp.`page_meta_data_id`)
	LEFT JOIN `cms_users` cu
	ON(cu.`user_id` = pmd.`updated_by`)
	WHERE pmd.`status` = 'A'
	AND pmd.`thumb_photo` != ''
	AND bp.`date_posted` != ''
	ORDER BY bp.`date_posted` DESC
	LIMIT 1");

if(!empty($post)){

	$blog_full_url		= $pg_full_url.$post['full_url'];

	$posts_view = <<<HTML
		<article class="blog__item">
		 	<div class="blog__item__img"  title="{$post['title']}">
		 		<a href="{$blog_full_url}" title="{$post['title']}" class="zoom__wrapper">
		 		 	<span style="background-image:url({$post['thumb_photo_path']})" class="zoom"></span>
		 		</a>
		 	</div>
		 	<div class="blog__item__content">
		 		<h2 class="blog__item__heading">{$post['heading']}</h2>
		 		<a href="{$blog_full_url}" title="{$post['title']}" class="btn btn--blog">Read More</a>
		 	</div>				
		</article>
HTML;

	$tags_arr['footer_blog_view'] = $posts_view;
}


?>