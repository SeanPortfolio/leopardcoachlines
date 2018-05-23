<?php

if($page_url == $page_reviews->url){

	$review_type = 'P';
	$review_list = '';

	if(isset($_GET['type']) && $_GET['type'] == '2'){
		$review_type = 'A';
	}

	$sql = "SELECT `person_name`, `description`
			FROM `review`
			WHERE `status` = 'A'
			AND `type` = '$review_type'
			ORDER BY `rank`";

	$review_arr = fetch_all($sql);

	if(!empty($review_arr)){
		foreach ($review_arr as $review) {

		  $review_list .= '<span class="separator"></span>
								<blockquote class="testimonial__item">
									<p class="testimonial__item__text_desc">"'.$review['description'].'"</p>
									<p class="testimonial__item__person">- '.$review['person_name'].'</p>
								</blockquote>';
		}
	}

	$reviews_html = '<div class="row">
                      <div class="contents center">
                          '.$review_list.'
                      </div>
                  </div>';

    $reviews_html = <<< HTML
					<section class="section section--reviews-list">
						<div class="container">
							<div class="row">
								<div class="col-xs-12 col-md-10 col-md-offset-1 text-center">
									{$review_list}
								</div>
							</div>
						</div>
					</section>
HTML;

	$tags_arr['content'] = $reviews_html;
}


?>