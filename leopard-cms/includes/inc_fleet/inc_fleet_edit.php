<?php

############################################################################################################################
## Edit FAQ Item
############################################################################################################################

function edit_item()
{

    global $message,$id,$do,$disable_menu,$valid,$htmladmin, $main_subheading, $js_vars;

    $disable_menu = "true";

    $sql = "SELECT
                f.`id`,
                f.`features`,
                f.`page_meta_data_id`,
                pmd.`name`,
                pmd.`menu_label`,
                pmd.`url`,
                pmd.`title`,
                pmd.`heading`,
                pmd.`introduction`,
                pmd.`photo`,
                pmd.`slideshow_id`,
                pmd.`gallery_id`
            FROM
                `fleet` f
            LEFT JOIN `page_meta_data` pmd ON
                (pmd.`id` = f.`page_meta_data_id`)
            WHERE
                f.`id` = '{$id}'
            LIMIT 1";

    $row = fetch_row($sql);

    @extract($row);

    $main_subheading = 'Editing: '.$name;

    ##------------------------------------------------------------------------------------------------------
    // Init view variables

    $meta_content = '';

    ##-------------------------------
    ##Create drop down for gallery
    
    $sql2 = "SELECT `id`, `name` FROM `photo_group` WHERE `type` = 'G'";

    $gallery_list = fetch_all($sql2);
    $gallery_view = '<select name="gallery_id" style="height:25px;width:200px;"><option value="">--Choose gallery--</option>';
    
    foreach ($gallery_list as $gallery) {

        $sel = ($gallery_id == $gallery['id']) ? 'selected' : '';
        $gallery_view .= '<option '.$sel.' value="'.$gallery['id'].'">'.$gallery['name'].'</option>';
    }

    $gallery_view .= '</select>';


    ##--------------------------------
    ##Create drop down for slideshow

    $sql3 = "SELECT `id`, `name` FROM `photo_group` WHERE `type` = 'S'";

    $slideshow_list = fetch_all($sql3);
    $slideshow_view = '<select name="slideshow_id" style="height:25px;width:200px;"><option value="">--Choose slideshow--</option>';
    
    foreach ($slideshow_list as $slideshow) {

        $sel1 = ($slideshow_id == $slideshow['id']) ? 'selected' : '';
        $slideshow_view .= '<option '.$sel1.' value="'.$slideshow['id'].'">'.$slideshow['name'].'</option>';
    }

    $slideshow_view .= '</select>';


    ##------------------------------------------------------------------------------------------------------
    ## Page functions

    $page_functions = <<< HTML
    <ul class="page-action">
        <li><button type="button" class="btn btn-default" onclick="submitForm('save',1)"><i class="glyphicon glyphicon-floppy-save"></i> Save</button></li>
        <li><a class="btn btn-default" href="{$htmladmin}/?do={$do}"><i class="glyphicon glyphicon-arrow-left"></i> Cancel</a>
        </li>
    </ul>
HTML;

    ##------------------------------------------------------------------------------------------------------
    ## Features tab content
    include_once 'views/features.php';

    ##------------------------------------------------------------------------------------------------------
    ## Details tab content
    include_once 'views/details.php';

    ##------------------------------------------------------------------------------------------------------
    ## tab arrays and build tabs

    $temp_array_menutab                       = array();
    $temp_array_menutab['Details']            = $settings_content;
    $temp_array_menutab['Features']           = $feat_content;

    $counter     = 0;
    $tablist     = "";
    $contentlist = "";

    foreach($temp_array_menutab as $key => $value){

    	$tablist.= "<li><a href=\"#tabs-".$counter."\">".$key."</a></li>";
    	$contentlist.=" <div id=\"tabs-".$counter."\">".$value."</div>";
    	$counter++;
    }

    $tablist="<div id=\"tabs\"><ul>$tablist</ul><div style=\"padding:10px;\">$contentlist</div></div>";

        $page_contents="<form action=\"$htmladmin/?do={$do}\" method=\"post\" name=\"pageList\" enctype=\"multipart/form-data\">
            $tablist
            <input type=\"hidden\" name=\"action\" value=\"\" id=\"action\">
            <input type=\"hidden\" name=\"do\" value=\"{$do}\">
            <input type=\"hidden\" name=\"id\" value=\"$id\">
            <input type=\"hidden\" name=\"meta_data_id\" value=\"$page_meta_data_id\">
        </form>";

    require "resultPage.php";
    echo $result_page;
    exit();

}

?>
