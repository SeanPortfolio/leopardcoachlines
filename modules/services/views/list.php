<?php
$services_query = fetch_all("SELECT sv.`id`,
                                  pmd.`menu_label`,
                                  pmd.`title`,
                                  pmd.`full_url`,
                                  pmd.`url`,
                                  pmd.`heading`,
                                  pmd.`introduction`,
                                  pmd.`short_description`,
                                  pmd.`description`,
                                  pmd.`photo`
                           FROM `service` sv 
                           LEFT JOIN `page_meta_data` pmd ON (sv.`page_meta_data_id` = pmd.`id`)
                           WHERE pmd.`status` = 'A'
                           ORDER BY pmd.`rank`");

$services_html = '';
$pattern_left = '<div class="pattern-left hidden-xs hidden-sm">      
                   <img src="/graphics/pattern-left.png" alt="">
                 </div>';
$pattern_right = '<div class="pattern-right hidden-xs hidden-sm">      
                   <img src="/graphics/pattern-right.png" alt="">
                 </div>';   

$count = 0;     
foreach($services_query as $item){

    $pattern_l = $count%2 ? '' : $pattern_left;
    $pattern_r = $count%2 ? $pattern_right : '';

    $services_html .= <<<HTML
        <div class="row service">
          <div class="col-xs-12 col-md-5 no-padding">
            <div class="service__photo">
              {$pattern_l}
              <div class="service__figure">
                <div class="service__figure__photo" style="background:url({$item['photo']});"></div>
              </div>
            </div>
          </div>
          <div class="col-xs-12 col-md-7 no-padding">
            <div class="service__info">
              <h2 class="service__info__title">
                <strong>{$item['heading']}</strong>
              </h2>
              <p>
                {$item['short_description']}
              </p>
              <a href="{$item['full_url']}" class="btn btn--ghost btn--hover-green service--button"> Find out more <i class="fa fa-angle-right"></i></a>
            </div>
            $pattern_r
           </div>
        </div>
HTML;
 
 $count++;
}

$tags_arr['content'] .= <<<HTML
    <div class="container service-container">
        <div class="row text-center">
            <p class="text-green text-bold text-title">
              <span class="service__heading">
                  OUR SERVICES
              </span>
            </p>
        </div>
        {$services_html}
    </div>

HTML;
?>