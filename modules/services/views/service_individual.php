<?php

$services_query = fetch_row("SELECT sv.`id`,
									sv.`page_meta_data_id`,
								  pmd.`menu_label`,
								  pmd.`title`,
								  pmd.`full_url`,
								  pmd.`url`,
								  pmd.`heading`,
								  pmd.`introduction`,
								  pmd.`short_description`,
								  pmd.`description`,
								  pmd.`photo`,
								  cc.`content`
			               FROM `service` sv 
			               LEFT JOIN `page_meta_data` pmd ON (sv.`page_meta_data_id` = pmd.`id`)
			               LEFT JOIN `content_row` cr ON (cr.`page_meta_data_id` = pmd.`id`)
			               LEFT JOIN `content_column` cc ON (cc.`content_row_id` = cr.`id`)
			               WHERE pmd.`status` = 'A'
			               AND pmd.`menu_label` != ''
			               AND pmd.`url` = '".$segment1."'
			               ORDER BY pmd.`rank`");

@extract($services_query);

	$services_options_query = fetch_all("SELECT `full_path`,
											    `description`,
											    `caption_heading`
				               FROM `service_options` 
				               WHERE `service_id` = '".$id."'
				               ORDER BY `rank`");
	$services_item_html = '';

	$count = 0;
	foreach($services_options_query as $item){
		$caption     = $item['caption_heading'];
		$description = $item['description'];
		$image_path  = $item['full_path'];

		$pattern_left = '<div class="pattern-left hidden-xs hidden-sm">      
				           <img src="/graphics/pattern-left.png" alt="">
				         </div>';
		$pattern_right = '<div class="pattern-right hidden-xs hidden-sm">      
	                        <img src="/graphics/pattern-right.png" alt="">
	                      </div>'; 		    

		$services_item_html .= '<div class="grid--flex">
								  <div class="col col--image">
									'.($count%2 ? $pattern_right : $pattern_left).'
								  	<img src="'.$image_path.'" class="img-rounded" />
								  </div>
								  <div class="col col--text '.($count%2 ? "col--left" : "").'">
								    <div class="aligner--item">
								     <div class="text-grey">'.
								     '<h3 class="text-uppercase text-green"><strong>'.$caption.'</strong></h3>' .	
								     $description.'</div>
								    </div>
								  </div>
								</div>';


		$count++;
	}	


$services_section = <<< HTML
	<section class="services-item-section">
		<div class="container">
			<div class="row">
				  {$services_item_html}
			</div>
		</div>
		<div class="services-item-section--quote text-center well bg-green">
			<h2 class="text-white"><strong>Let us help you find the perfect coach.</strong></h2>
			<p><a href="{$page_contact->url}" class="btn btn--ghost btn--hover-blue btn--ghost--white services-item-section--quote--button">Request a Quote <i class="fa fa-angle-right"></i></a></p>
		</div>
	</section>
HTML;

$tags_arr['body_cls']     = ' services-item-page';
$tags_arr['heading']      = $heading;
$tags_arr['introduction'] = $introduction;
$tags_arr['content']      = get_content($page_meta_data_id);
$tags_arr['body_html']   .= $services_section;
?>
