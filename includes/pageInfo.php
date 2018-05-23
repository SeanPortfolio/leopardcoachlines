<?php
###############################################################################################################################
## Fetch Website Settings
###############################################################################################################################

function fetchSettings()
{
    $sql = "SELECT gs.`company_name`, 
                   gs.`start_year`, 
                   gs.`email_address`,
                   gs.`phone_number`,
                   gs.`address`, 
                   gs.`js_code_head_close`, 
                   gs.`js_code_body_open`, 
                   gs.`js_code_body_close`,
                   gs.`youtube_id`,
                   gs.`adwords_code`, 
                   gs.`slideshow_speed`, 
                   gs.`homepage_slideshow_caption`, 
                   gs.`mailchimp_api_key`, 
                   gs.`mailchimp_list_id`,
                   gs.`map_latitude`, 
                   gs.`map_longitude`, 
                   gs.`map_heading`, 
                   gs.`map_description`, 
                   gs.`booking_url`, 
                   gs.`tripadvisor_widget_code`
            FROM `general_settings` gs
            WHERE gs.`id` = '1'
            LIMIT 1";


    return fetch_row($sql);

}

function fetchImportantPages()
{

    $sql = "SELECT ip.`imppage_name` AS name, pmd.`url`, pmd.`full_url`, pmd.`name` AS menu_name, pmd.`menu_label`,
    pmd.`title`, gp.`id` AS pg_id
    FROM `general_importantpages` ip
    LEFT JOIN `general_pages` gp
    ON(gp.`id` = ip.`page_id`)
    LEFT JOIN `page_meta_data` pmd
    ON(gp.`page_meta_data_id` = pmd.`id`)
    WHERE pmd.`status` = 'A'
    AND pmd.`url` != ''";

    $result = fetch_all($sql);

    $return_arr = array();

    foreach( $result as $key => $array )
    {

        $this_importantpage_url  = ($this_importantpage_name != '')  ? $array['url'] : 'home' ;

        $this_importantpage_name = strtolower(str_replace(' ','',$array['name']));

        $return_arr["impage_{$this_importantpage_name}"] = (object) array(
            'menu_label' => (($array['menu_label'])?$array['menu_label']:$array['menu_name']),
            'url' => $this_importantpage_url,
            'full_url' => $array['full_url'],
            'id' => $array['pg_id'],
            'title' => $array['title']
        );
    }



    return $return_arr;
}

$settings_arr = array_merge( fetchSettings(), fetchImportantPages() );

include "$incdir/formatSettings.php";

###############################################################################################################################
## Fetch Page Information
###############################################################################################################################

function get_content( $pg_meta_id )
{

    $output = '';
    
    if( $pg_meta_id )
    {

        $rows = fetch_all("SELECT `id` FROM `content_row` WHERE `page_meta_data_id` = '{$pg_meta_id}' ORDER BY `rank`");

        if( !empty($rows) )
        {
            foreach ($rows as $row)
            {
                $columns = fetch_all("SELECT `content`, `css_class` FROM `content_column` WHERE `content_row_id` = '{$row['id']}' ORDER BY `rank`");

                if( !empty($columns) )
                {
                    $output .= '<div class="row content-row">';
                    
                    foreach ($columns as $column)
                    {
                        $output .= '<div class="'.$column['css_class'].'">'.$column['content'].'</div>';
                    }
               
                    $output .= '</div>';
                }
            }
        }
    }

    return $output;
}

function fetchPageInfo( $pg_url )
{

    global $settings_arr;

    $sql = "SELECT
                pmd.`id` AS page_meta_id,
                gp.`id` AS page_id,
                pmd.`menu_label`,
                pmd.`heading`,
                pmd.`sub_heading`,
                pmd.`introduction`,
                pmd.`url`,
                pmd.`full_url`,
                pmd.`description`,
                pmd.`quicklink_heading`,
                pmd.`photo`,
                pmd.`thumb_photo`,
                pmd.`title`,
                pmd.`meta_description`,
                pmi.`value` AS mrobots,
                gp.`parent_id`,
                pmd.`slideshow_id`,
                pmd.`gallery_id`,
                gp.`template_id`,
                gp.`slideshow_type`,
                pmd.`og_title`,
                pmd.`og_meta_description`,
                pmd.`og_image`
            FROM
                `general_pages` gp
            LEFT JOIN `page_meta_data` pmd ON
                (pmd.`id` = gp.`page_meta_data_id`)
            LEFT JOIN `page_meta_index` pmi ON
                (
                    pmi.`id` = pmd.`page_meta_index_id`
                )
            WHERE
                pmd.`url` = '{$pg_url}' AND pmd.`status` = 'A'
            LIMIT 1";


    $page_data = fetch_row($sql);

    if( !empty($page_data) )
    {
       $page_data['content'] = get_content( $page_data['page_meta_id'] );
    }

    return $page_data;
}

$page_home = $settings_arr['impage_home']->url;
$page_404  = $settings_arr['impage_404']->url;



$total_url_segments = count($uri_segments);
$ignore_urls        = array($settings_arr['impage_blog']->url);
$current_full_url   = implode('/', $uri_segments);
$page_index         = 0;


if( empty($uri_segments) )
{
    $page_url = $page_home;
  
}
elseif($total_url_segments > 0)
{
  
    for ($i=($total_url_segments - 1); $i >=0 ; $i--)
    { 
        $segment = $uri_segments[$i];

        $page_url = fetch_value("SELECT pmd.`url`
            FROM `general_pages` gp
            LEFT JOIN `page_meta_data` pmd
            ON(pmd.`id` = gp.`page_meta_data_id`)
            WHERE pmd.`url` = '{$segment}'
            AND pmd.`status` = 'A'
            LIMIT 1");

        if( $page_url )
        {
            break;
        }
    }

    if( $page_url )
    {

        $page_index            = (array_search($page_url, $uri_segments) + 1);
        $page_options          = array_slice($uri_segments, $page_index);
        $page_options_full_url = implode('/', $page_options);


        $is_valid_url = fetch_value("SELECT `id` FROM `page_meta_data`
            WHERE (`full_url` = '/{$current_full_url}' OR `full_url` = '/{$page_options_full_url}')
            AND `status` = 'A'
            LIMIT 1");


        if( !$is_valid_url && !in_array($page_url, $ignore_urls))
        {
            
            $page_url = $page_404;
            header("HTTP/1.1 404 Not Found");
        }

    }
    else
    {
        $page_url = $page_404;
        header("HTTP/1.1 404 Not Found");
    }

}

$page_arr = fetchPageInfo($page_url);


###############################################################################################################################
## Page Insert Tags
###############################################################################################################################

$formatted_arr = array_merge($page_arr, $settings_arr);


$tags_arr = array();

// Page Inserts
$page_title                 = $tags_arr['title']                      = $formatted_arr['title'];                                              ## Metatag Title >> inc_formattemp.php
$tags_arr['og_title']       = ($formatted_arr['og_title']) ? $formatted_arr['og_title'] : $formatted_arr['title'];                                              ## Metatag Title >> inc_formattemp.php
$tags_arr['og_mdescr']      = ($formatted_arr['og_meta_description']) ? $formatted_arr['og_meta_description'] : $formatted_arr['meta_description'];  
$tags_arr['mdescr']         = $formatted_arr['meta_description'];                                   ## Metatag Description
$mrobots                    = $tags_arr['mrobots']                    = $formatted_arr['mrobots'];      ## Metatag Robots >> inc_formattemp.php
$tags_arr['mauthor']        = 'Tomahawk';                                                           ## Metatag Author
$heading                    = $tags_arr['heading']                    = $formatted_arr['heading'];
$introduction               = $tags_arr['introduction']               = $formatted_arr['introduction'];
$quicklink_heading          = $tags_arr['quicklink_heading']          = $formatted_arr['quicklink_heading'];
$sub_heading                = $tags_arr['sub_heading']                = $formatted_arr['sub_heading'];
$page_language_code         = $tags_arr['lang_iso_code']              = $formatted_arr['iso_code'];
$tags_arr['content']        = $formatted_arr['content'];                                            ## Page Content

// Company/Website Inserts
$company_name = $company                    = $tags_arr['company']                    = $formatted_arr['company_name'];             ## Company Name
$tags_arr['copyright']      = $formatted_arr['copyright'];                                                       ## e.g. Copyright 2007 - 2010. Company. >> inc_formattemp.php
$tags_arr['credits']        = $formatted_arr['credits'];                                                         ## e.g. Website design by Webdirectionz @ Tomahawk >> inc_formattemp.php
$booking_url                = $tags_arr['booking_url']                 = $formatted_arr['booking_url'];                
$company_email_address      = $tags_arr['company_email_address']       = $formatted_arr['email_address'];      ## Company email(s)
$phone_number               = $tags_arr['phone_number']                = $formatted_arr['phone_number'];
$free_phone_number          = $tags_arr['free_phone_number']           = $formatted_arr['free_phone_number'];
$skype_username             = $tags_arr['skype_username']              = $formatted_arr['skype_username'];
$company_address            = $tags_arr['company_address']             = $formatted_arr['address'];       ## Company address
$homepage_slideshow_caption = $tags_arr['homepage_slideshow_caption']  = $formatted_arr['homepage_slideshow_caption'];
$homepage_slideshow_url     = $tags_arr['homepage_slideshow_url']      = $formatted_arr['homepage_slideshow_url'];
$mailchimp_api_key          = $tags_arr['mailchimp_api_key']           = $formatted_arr['mailchimp_api_key'];
$mailchimp_list_id          = $tags_arr['mailchimp_list_id']           = $formatted_arr['mailchimp_list_id'];
$slideshow_speed            = $tags_arr['slideshow_speed']             = $formatted_arr['slideshow_speed'];
$jsVars['slideshow_speed']  = $slideshow_speed;


$comp_emails                = get_email_list($company_email_address);
$primary_email              = $tags_arr['primary_email'] = $comp_emails->primaryEmail;


$adwards            = $tags_arr['adwords_code']       = $formatted_arr['adwords_code'];
$js_code_head_close = $tags_arr['js_code_head_close'] = $formatted_arr['js_code_head_close'];
$js_code_body_open  = $tags_arr['js_code_body_open']  = $formatted_arr['js_code_body_open'];
$js_code_body_close = $tags_arr['js_code_body_close'] = $formatted_arr['js_code_body_close'];


$tags_arr['root']      = $htmlroot;                                                                     ## For use to direct the template to the root of the website for css, js & image files
$tags_arr['fromroot']  = $fromroot;

// Code Variables                                                 ## Variables with information about the current page
$main_page_id         = $page_id                                = $formatted_arr['page_id'];              ## Page Id
$page_full_url        = $formatted_arr['full_url'];              ## Full Url
$page                 = $page_url                               = $formatted_arr['url'];
$template_id          = $formatted_arr['template_id'];          ## Template Id
$slideshow_type       = $formatted_arr['slideshow_type'];    

$page_parent_id       = $formatted_arr['parent_id'];            ## Page Parent Id
$absparent_id         = getAbsoluteParentId($page_id);          ## Absolute Parent Id
$slideshow_id         = $formatted_arr['slideshow_id'];         ## Slideshow Id
$gallery_id           = $formatted_arr['gallery_id'];           ## gallery Id
$page_photo           = ($formatted_arr['photo']) ? $formatted_arr['photo'] : '';
$page_thumb_photo     = ($formatted_arr['thumb_photo']) ? $formatted_arr['thumb_photo'] : '';
$page_photo_caption   = ($formatted_arr['photo_caption']) ? $formatted_arr['photo_caption'] : '';
$page_menu_label      = $formatted_arr['menu_label'];
$og_page_photo        = (is_file("{$rootfull}{$formatted_arr['og_image']}")) ? $formatted_arr['og_image'] : $page_photo;
$tags_arr['og_image'] = ($og_page_photo) ? "{$htmlroot}{$og_page_photo}" : '';
$tags_arr['og_url']   = "{$htmlroot}{$_SERVER['REQUEST_URI']}";


###### Dynamically generated page segments/options ##########
$segment1 = ${"option{$page_index}"};
$segment2 = ${"option".($page_index+1)};
$segment3 = ${"option".($page_index+2)};
$segment4 = ${"option".($page_index+3)};

$number_of_module_tags   = fetch_value("SELECT tn.`tmpl_nummoduletags`
    FROM `templates_normal` tn
    WHERE tn.`tmpl_id` = '$template_id'");

// Important Pages
$page_home          = $formatted_arr['impage_home'];
$page_blog          = $formatted_arr['impage_blog'];
$page_contact       = $formatted_arr['impage_contact'];
$page_fleet         = $formatted_arr['impage_fleet'];
$page_services      = $formatted_arr['impage_services'];
$page_reviews       = $formatted_arr['impage_reviews'];


// Initializing Empty Tags                                              ## Tags made for later use
$tags_arr['scripts-load-top']      = '';
$tags_arr['style-int']             = '';                                   ## Position held for internal styles
$tags_arr['style-ext']             = '';                                   ## Position held for external styles
$tags_arr['script-ext']            = '';                                   ## Position held for external scripts
$tags_arr['script-onload']         = '';                                   ## Position held for onload scripts
$tags_arr['module']                = '';
$tags_arr['body_cls']              = '';
$tags_arr['mod_view']              = '';
$tags_arr['fleet_view']            = '';
$tags_arr['map_view']              = '';
$tags_arr['script-inline']         = '';
$tags_arr['body_html']             = '';
$tags_arr['why_choose_us']         = '';
$tags_arr['testimonial_view']      = '';

$tags_arr['map_pins_view'] = '';
$tags_arr['quicklinks_view']       = '';

$youtube_id = $formatted_arr['youtube_id'];


// Template assets file paths
$tags_arr['favicon_path']   = get_file_path('/favicon.ico');
$tags_arr['css_path']       = get_file_path('/assets/css/'.(($is_local) ? '_main_xl.css' : 'main.css'));
$tags_arr['modernizr_path'] = get_file_path('/assets/js/libs/min/modernizr-2.8.3.min.js');
$tags_arr['vender_js_path'] = get_file_path('/assets/js/libs/min/vendor.js');
$tags_arr['js_path']        = get_file_path('/assets/js/'.(($is_local) ? 'unmin/main.js' : 'min/main.js'));

$tags_arr['ex_meta_taga'] = <<< H
<meta name="robots" content="{$mrobots}">
\t<meta name="googlebot" content="{$mrobots}">
H;

$phone_icon_view = '';
if( $phone_number )
{
    $phone_icon_view = '<a href="tel:'.$phone_number.'" class="phone-trigger"><i class="fa fa-phone"></i>'.$phone_number.'</a>';
    
}

if( $free_phone_number )
{
    $phone_icon_view .= '<span class="phone-trigger-md">Freecall: '.$free_phone_number.'<br>(within Australia)</span>';
    
}

$tags_arr['phone_icon_view'] = $phone_icon_view;

$newsletter_view = '';

if($mailchimp_api_key && $mailchimp_api_key){

    $newsletter_view = '<div class="footer__newsletter">
                            <h6 class="footer__newsletter__title">
                                OUR NEWSLETTER
                            </h6>
                            <form action="#" id="news-signup-form" method="post">
                                <div class="form_group">
                                    <input type="email" id="signup-email" class="footer__newsletter-form__input" placeholder="Your email address">
                                    <button type="submit" id="newsletter-submit" class="btn btn--green footer__newsletter-form__btn btn--hover-blue">
                                        Submit <i class="fa fa-angle-right"></i>
                                    </button>
                                    <p class="msg"></p>
                                </div>
                            </form>
                        </div>';

}

$tags_arr['newsletter_view'] = $newsletter_view;
$tags_arr['contact_url']     = $page_contact->url;

if($page == $page_home->url){
$tags_arr['heading']      = '';
$tags_arr['introduction'] = '';
}


if ($page_id == $page_home->id) {
    $stylesLoader = <<< H
    
    <style>

      .preloader {
        position: fixed;
        left: 0;
        top: 0;
        background-color: #fff;
        width: 100%;
        height: 100%;
        z-index: 99999;
      }

      .preloader__img {
        display: block;
        width: 181px;
        height: 48px;
        position: absolute;
        left: 50%;
        top: 50%;
        -webkit-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        background: url(/graphics/logo.png) no-repeat center;
        background-size: cover;
      }

    </style>

    <noscript id="deferred-styles">
      <link href="//fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700" rel="stylesheet">
      <link rel="stylesheet" href="{$tags_arr['css_path']}">
    </noscript>

    <script>
      var loadDeferredStyles = function() {
        var addStylesNode = document.getElementById("deferred-styles");
        var replacement = document.createElement("div");
        replacement.innerHTML = addStylesNode.textContent;
        document.head.appendChild(replacement)
        addStylesNode.parentElement.removeChild(addStylesNode);

        $('.preloader').delay(100).fadeOut(100, function(){
          $(this).remove();
        })
      };

       window.addEventListener('load', loadDeferredStyles)
    </script>
H;

} else {

    $stylesLoader = <<< H

    <link href="//fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700" rel="stylesheet">
    <link rel="stylesheet" href="{$tags_arr['css_path']}">


H;
}

$tags_arr['styles-loader'] = $stylesLoader;

?>