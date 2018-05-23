<?php

$fleetGalleryView = '';

if ($fleet_gallery_id) {

	$sql = "SELECT
	        MD5(`photo_group_id`) AS group_key,
			`full_path`,
			`thumb_path`,
			`width` AS w,
			`height` AS h,
			`caption` AS title,
			CONCAT(`width`,'x',`height`) AS size
		FROM
			photo
		WHERE
			photo_group_id = '$fleet_gallery_id'
		ORDER BY
			rank ASC";

	$fleetPhotos = fetch_all($sql);

	//preprint_r($fleetPhotos);die;

	if (!empty($fleetPhotos)) {

		$item_index = 0;

		foreach ($fleetPhotos as $fleetPhoto) {

			$fleetPhotoPath      = $fleetPhoto['full_path'];
			$fleetPhotoThumbPath = $fleetPhoto['thumb_path'];
			$fleetPhotoWidth     = $fleetPhoto['w'];
			$fleetPhotoHeight    = $fleetPhoto['h'];
			$fleetPhotoSize      = $fleetPhoto['size'];
			$fleetPhotosTitle    = $fleetPhoto['title'];

			if (!empty($fleetPhotoPath) && !empty($fleetPhotoThumbPath)) {
				
				$fleetGalleryView .= '
				<figure class="gallery__figure img ps-item" data-key="'.$item_index.'" data-groups="galleryImages'.$fleet_gallery_id.'" data-gp="'.$fleetPhoto['group_key'].'">
					<span>
						<img src="'.$fleetPhotoThumbPath.'" class="gallery__figure-img">
					</span>
				</figure>';

				$item_index++;
				
			}

		}

		$jsVars['globals']['galleryImages'.$fleet_gallery_id] = $fleetPhotos;

		if (!empty($fleetGalleryView)) {
			
			$fleetGalleryView = '<div class="gallery gallery-carousel">'.$fleetGalleryView.'</div>';
		}
	}

	$fleetGalleryView .= <<< HTML
		<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
			<!-- Background of PhotoSwipe. 
				 It's a separate element as animating opacity is faster than rgba(). -->
			<div class="pswp__bg"></div>
			<!-- Slides wrapper with overflow:hidden. -->
			<div class="pswp__scroll-wrap">
				<!-- Container that holds slides. 
					PhotoSwipe keeps only 3 of them in the DOM to save memory.
					Don't modify these 3 pswp__item elements, data is added later on. -->
				<div class="pswp__container">
					<div class="pswp__item"></div>
					<div class="pswp__item"></div>
					<div class="pswp__item"></div>
				</div>
				<!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
				<div class="pswp__ui pswp__ui--hidden">
					<div class="pswp__top-bar">
						<!--  Controls are self-explanatory. Order can be changed. -->
						<div class="pswp__counter"></div>
						<button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
						<button class="pswp__button pswp__button--share" title="Share"></button>
						<button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
						<button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
						<!-- Preloader demo http://codepen.io/dimsemenov/pen/yyBWoR -->
						<!-- element will get class pswp__preloader--active when preloader is running -->
						<div class="pswp__preloader">
							<div class="pswp__preloader__icn">
							  <div class="pswp__preloader__cut">
								<div class="pswp__preloader__donut"></div>
							  </div>
							</div>
						</div>
					</div>
					<div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
						<div class="pswp__share-tooltip"></div> 
					</div>
					<button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
					</button>
					<button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
					</button>
					<div class="pswp__caption">
						<div class="pswp__caption__center"></div>
					</div>
				</div>
			</div>
		</div>
HTML;

}

?>