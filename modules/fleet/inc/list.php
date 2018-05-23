<?php

$sql = "SELECT
		    f.`features`,
		    pmd.`heading`,
		    pmd.`introduction`,
		    pmd.`gallery_id`
		FROM
		    `fleet` f
		LEFT JOIN `page_meta_data` pmd ON
		    (pmd.`id` = f.`page_meta_data_id`)
		WHERE
		    pmd.`status` = 'A'
		ORDER BY
		    pmd.`rank`";

$all_fleet = fetch_all($sql);

if(!empty($all_fleet))
{

	foreach ($all_fleet as $fleet) {

			if(++$curCount%2==0) {

				$patternImg = '
							<div class="pattern-right hidden-xs hidden-sm">       
		        		<img src="/graphics/pattern-right.png" alt="">
       				</div>';

			}else {

				$patternImg = '
							<div class="pattern-left hidden-xs hidden-sm">       
		        		<img src="/graphics/pattern-left.png" alt="">
       				</div>';

			}

			$fleet_gallery_id = $fleet['gallery_id'];

			include 'gallery.php';

			$fleet_items .=<<<HTML
				<div class="col-xs-12">
					
					<div class="option">
						<div class="option__header text-center">
							<h2>
								<span>{$fleet['heading']}</span>
							</h2>
						</div>

						<p class="option__descr text-grey text-center">
							{$fleet['introduction']}
						</p>

						<div class="option__inner">
							{$patternImg}
							<div class="option__main">
								{$fleetGalleryView}
								<div class="option__feature">
									<P class="text-blue text-lg">
										Features include:
										{$fleet['features']}
									</p>
								</div>
							</div>
						</div>

						<div class="option__btn">
							<a href="{$page_contact->full_url}?subject={$fleet['heading']}" class="btn btn--green">
								Request a quote
								<i class="fa fa-angle-right"></i>
							</a>
						</div>
					</div>
				</div>
HTML;
	}

	$fleet_list = <<<HTML
		<section class="section section--slate quicklinks">
			<div class="container container-fw">
			  <div class="row">
				{$fleet_items}
			  </div>
			</div>
		</section>

HTML;

	$tags_arr['fleet_view'] = $fleet_list;

}


?>