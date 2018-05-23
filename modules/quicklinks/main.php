<?php

###############################################################################################################################
## Make the Quicklinks
###############################################################################################################################

$quicklinks_view = '';

if($page == $page_services->url && $segment1){
  $page_query = fetch_row("SELECT `id` FROM `page_meta_data` WHERE `url` = '".$segment1."'");
  $page_id = $page_query['id'];
}

$quicklinks = fetch_all("SELECT IF((pmd.`quicklink_heading` != ''), pmd.`quicklink_heading`, pmd.`menu_label`) AS label, pmd.`quicklink_thumb`, pmd.`title`,
    pmd.`short_description`, pmd.`full_url`
    FROM `general_pages` gp
    LEFT JOIN `page_meta_data` pmd ON(pmd.`id` = gp.`page_meta_data_id`)
    LEFT JOIN `page_has_quicklink` phq ON(phq.`quicklink_page_id` = gp.`id`)
    WHERE pmd.`status` = 'A'
    AND phq.`page_id` = '{$page_id}'
    ORDER BY pmd.`rank`");

if( !empty($quicklinks) )
{
    foreach ($quicklinks as $quicklink)
    {
        $label             = $quicklink['label'];
        $title             = $quicklink['title'];
        $thumb_photo       = $quicklink['quicklink_thumb'];
        $full_url          = $quicklink['full_url'];
        $short_description = $quicklink['short_description'];
        
        $quicklinks_view .= '
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 quicklink--item">
              <div class="grid__col">
                <div class="grid__figure"> 
                  <div style="background:url('.$thumb_photo.');" class="quicklinks__figure-img"></div>
                  <div class="grid__figure-caption text-center">
                    '. $label .'
                  </div>
                  <a href="'. $full_url.'" class="grid__figure-link"></a>
                </div>
              </div>
            </div>';
    }

    $quicklinks_view = '
      <div class="grid">
        <div class="container-fluid bg-light-grey quicklinks-container">
            <div class="row text-center">
                '.$quicklinks_view.'
            </div>
        </div>
      </div>';

}

$tags_arr['quicklinks_view'] .= $quicklinks_view;

//var_dump($quicklinks_view);die;
    
?>