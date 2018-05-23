<?php

############################################################################################################################
## Save Testimonial Item
############################################################################################################################

function save_item()
{

    global $message,$id,$do,$disable_menu, $root, $rootfull, $rootadmin, $upload_dir;


    //Get full url of fleet page
    $sql = "SELECT
                pmd.`full_url`
            FROM
                `page_meta_data` pmd
            LEFT JOIN `general_pages` gp ON
                (pmd.`id` = gp.`page_meta_data_id`)
            LEFT JOIN `general_importantpages` imp ON
                (imp.`page_id` = gp.`id`)
            WHERE
                imp.`imppage_id` = 7
            LIMIT 1";
    
    $fleet_url = fetch_value($sql);

    //Save Meta Data
    $meta_data                      = $page_data = array();
    $meta_data_id                   = sanitize_input('meta_data_id', FILTER_SANITIZE_NUMBER_INT);
    $meta_data['name']              = sanitize_input('name');
    $meta_data['menu_label']        = sanitize_input('menu_label');
    $meta_data['heading']           = sanitize_input('heading');
    $url                            = prepare_item_url($_POST['url']);
    $meta_data['url']               = $url;
    $full_url                       = $fleet_url.'/'.$url;
    $meta_data['full_url']          = $full_url;
    $meta_data['title']             = sanitize_input('title');
    $photo                          = sanitize_input('photo');
    $meta_data['photo']             = $photo;
    $meta_data['introduction']      = sanitize_input('introduction');
    $meta_data['date_updated']      = date('Y-m-d H:i:s');
    $meta_data['updated_by']        = $_SESSION['s_user_id'];
    $meta_data['slideshow_id']      = sanitize_input('slideshow_id', FILTER_SANITIZE_NUMBER_INT);
    $meta_data['gallery_id']        = sanitize_input('gallery_id', FILTER_SANITIZE_NUMBER_INT);


    if($photo)
    {
        //see if photo has been updated
        $current_photo = fetch_value("SELECT `photo` FROM `page_meta_data` WHERE `id` = '$meta_data_id' LIMIT 1");

        if($photo != $current_photo)
        {
            //delete the old thumb
            $current_thumb = fetch_value("SELECT `thumb_photo` FROM `page_meta_data` WHERE `id` = '$meta_data_id' LIMIT 1");
            
            if($current_thumb)
            {
                $current_thumb_full = "{$rootfull}{$current_thumb}";

                if( is_file($current_thumb_full) )
                {
                    unlink($current_thumb_full);
                }
            }

            include_once("$rootadmin/classes/class_imageresizer.php");
            $resizer_class = new images();
            $upload_dir_full_path = "{$rootfull}{$upload_dir}";

            $photo_full = "{$rootfull}{$photo}";

            if( is_file($photo_full) )
            {
                
                $new_thumb_path = '';
                $thumb_name     = uniqid('img-');
                $new_thumb_path = "{$upload_dir}/{$thumb_name}.jpg";

                $resizer_class->resizer($upload_dir_full_path, $photo_full, 570, 500, $thumb_name);

                $meta_data['thumb_photo'] = $new_thumb_path;
            }

        }
        
    }

    update_row($meta_data,'page_meta_data', "WHERE id = '{$meta_data_id}'");

    $fleet_data                 = array();
    $fleet_data['features']     = $_REQUEST['features'];
    
    update_row($fleet_data,'fleet', "WHERE id = '{$id}'");    

    $message = "Item has been saved";
}

?>