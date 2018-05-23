<?php

############################################################################################################################
## Save Testimonial Item
############################################################################################################################

function save_item()
{

    global $message,$id,$do,$disable_menu, $root, $rootfull, $rootadmin, $upload_dir;


    //Get full url of service page
    $sql = "SELECT
                pmd.`full_url`
            FROM
                `page_meta_data` pmd
            LEFT JOIN `general_pages` gp ON
                (pmd.`id` = gp.`page_meta_data_id`)
            LEFT JOIN `general_importantpages` imp ON
                (imp.`page_id` = gp.`id`)
            WHERE
                imp.`imppage_id` = 6
            LIMIT 1";
    
    $service_url = fetch_value($sql);

//preprint_r($service_url);die;
    //Save Meta Data
    $meta_data                      = $page_data = array();
    $meta_data_id                   = sanitize_input('meta_data_id', FILTER_SANITIZE_NUMBER_INT);
    $meta_data['name']              = sanitize_input('name');
    $meta_data['menu_label']        = sanitize_input('menu_label');
    $meta_data['heading']           = sanitize_input('heading');
    $url                            = prepare_item_url($_POST['url']);
    $meta_data['url']               = $url;
    $full_url                       = $service_url.'/'.$url;
    $meta_data['full_url']          = $full_url;
    $meta_data['title']             = sanitize_input('title');
    $meta_data['meta_description']  = sanitize_input('meta_description');
    $photo                          = sanitize_input('photo');
    $meta_data['photo']             = $photo;
    $meta_data['introduction']      = sanitize_input('introduction');
    $meta_data['short_description'] = sanitize_input('short_description');
    $meta_data['og_title']          = sanitize_input('og_title');
    $meta_data['og_meta_description']= sanitize_input('og_meta_description');
    $meta_data['og_image']          = sanitize_input('og_image');
    $meta_data['date_updated']      = date('Y-m-d H:i:s');
    $meta_data['updated_by']        = $_SESSION['s_user_id'];
    $meta_data['slideshow_id']      = sanitize_input('slideshow_id', FILTER_SANITIZE_NUMBER_INT);

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

    //save service data

    $service_data                 = array();
    $service_data['show_on_home_page'] =  ( sanitize_input('show_on_home_page') == 'Y') ? 'Y' : 'N';

    update_row($service_data,'service', "WHERE id = '{$id}'");

    //save service option table data
        
    $full_path         = $_REQUEST['full_path'];
    $caption_heading   = $_REQUEST['photo_caption_heading'];
    $description       = $_REQUEST['photo_description'];
    $photo_rank        = $_REQUEST['photo_rank'];


    //save quicklinks data
    
    /*
    run_query("DELETE FROM `service_has_quicklink` WHERE `service_id` = '{$id}'");

    $quicklinks = $_POST['quicklink_id'];

    if( !empty($quicklinks) )
    {
        for($i=0;$i<count($quicklinks);$i++)
        {
            $ql_arr = array();

            $ql_arr['quicklink_page_id']    = $quicklinks[$i];
            $ql_arr['service_id']           = $id;

            insert_row($ql_arr, 'service_has_quicklink');
        }
    } */

    // save quicklinks
    run_query("DELETE FROM `page_has_quicklink` WHERE `page_id` = '{$meta_data_id}'");

    $quicklinks = $_POST['quicklink_id'];

    if( !empty($quicklinks) )
    {
        for($i=0;$i<count($quicklinks);$i++)
        {
            $ql_arr = array();

            $ql_arr['quicklink_page_id'] = $quicklinks[$i];
            $ql_arr['page_id']           = $meta_data_id;

            insert_row($ql_arr, 'page_has_quicklink');
        }
    }

    // $photo_group_data = array();
    // $photo_group_data['name'] = sanitize_input('label');
    // update_row($photo_group_data, 'photo_group', "WHERE `id` = '{$id}'");

    run_query("DELETE FROM `service_options` WHERE `service_id` = '{$id}'");

    for($i=0;$i<count($full_path);$i++)
    {
        $photo_full_path  = "{$rootfull}{$full_path[$i]}";
        
        $photo_details = getimagesize($photo_full_path);

        $temp_array_save['full_path']               = $full_path[$i];
        $temp_array_save['caption_heading']         = $caption_heading[$i];
        $temp_array_save['description']             = $description[$i];
        $temp_array_save['rank']                    = $photo_rank[$i];
        $temp_array_save['service_id']              = $id;

        insert_row($temp_array_save, 'service_options');
    }

    ### save page responsive content ###
    // Check if content record exist for this page

    //get all exisitng row belong to this page's content
    $existing_rows = fetch_value("SELECT GROUP_CONCAT(`id`) FROM `content_row` WHERE `page_meta_data_id` = '$meta_data_id'");

    if($existing_rows)
    {
        // delete all columns
        run_query("DELETE FROM `content_column` WHERE `content_row_id` IN($existing_rows)");

        // delete all rows
        run_query("DELETE FROM `content_row` WHERE `id` IN($existing_rows)");
    }

    if( !empty($_POST['row-index']) && $meta_data_id )
    {

        // save new content rows and columns
        $rows      = $_POST['row-index'];
        $rows_rank = $_POST['row-rank'];
        $row_count = count($rows);

        if($row_count > 0)
        {
            for ($i=0; $i < $row_count; $i++)
            { 
                $row_record = array();
                $row_record['rank']              = ($rows_rank[$i]);
                $row_record['page_meta_data_id'] = $meta_data_id;

                $row_id = insert_row($row_record, 'content_row');

                if( $row_id )
                {
                    
                    $columns_rank    = $_POST["content-{$rows[$i]}-rank"];
                    $columns_content = $_POST["content-{$rows[$i]}-text"];
                    $columns_class   = $_POST["content-{$rows[$i]}-class"];

                    $total_row_columns = count($columns_content);

                    if($total_row_columns > 0)
                    {
                        for ($k=0; $k < $total_row_columns; $k++) 
                        { 
                            $column_record                   = array();
                            
                            $column_record['content']        = $columns_content[$k];
                            $column_record['css_class']      = $columns_class[$k];
                            $column_record['rank']           = $columns_rank[$k];
                            $column_record['content_row_id'] = $row_id;

                            insert_row($column_record, 'content_column');
                        }
                    }

                }
            }
        }
    }
    
    $message = "Item has been saved";
}

?>