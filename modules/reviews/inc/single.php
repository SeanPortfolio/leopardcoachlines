<?php


$customer_review = fetch_row("SELECT `person_name`,`description`
	FROM `review`
	WHERE `status` = 'A'
	AND `type` = 'P'
	ORDER BY RAND()
	LIMIT 1");


if( $customer_review)
{

$review_photo = fetch_row("SELECT `review_photo`
	FROM `general_settings`");

$description = strlen($customer_review['description']) > 200 ? substr($customer_review['description'],0,200)."..." : $customer_review['description'];

$reviews_view = <<< HTML
					<section class="section section-reviews bg-blue">
						<div class="container">
							<div class="row">
								<div class="col-xs-12 text-center section-reviews__block">
									<img src="/graphics/quote.jpg" class="section-reviews__block--quote" />
									<span class="separator"></span>
									<blockquote class="section-reviews__testimonial--item">
										<p class="testimonial__item__text">{$description}</p>
											<p class="testimonial__item__person">{$customer_review['person_name']}</p>
									</blockquote>
											<a href="{$page_reviews->url}" title="" class="btn btn--ghost btn--hover-green btn--ghost--white section-reviews__testimonial--item_more">More reviews <i class="fa fa-angle-right"></i>
											</a>
									<hr class="section-reviews__block--line" />
								</div>
							</div>
						</div>
					</section>
	
HTML;

}


?>