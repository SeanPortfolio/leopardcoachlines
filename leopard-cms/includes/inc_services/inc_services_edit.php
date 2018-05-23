<?php

############################################################################################################################
## Edit FAQ Item
############################################################################################################################

function edit_item()
{

    global $message,$id,$do,$disable_menu,$valid,$htmladmin, $main_subheading, $js_vars;

    $disable_menu = "true";

    $sql = "SELECT
                s.`id`,
                s.`show_on_home_page`,
                s.`page_meta_data_id`,
                pmd.`name`,
                pmd.`menu_label`,
                pmd.`heading`,
                pmd.`url`,
                pmd.`title`,
                pmd.`meta_description`,
                pmd.`introduction`,
                pmd.`og_title`,
                pmd.`og_image`,
                pmd.`og_meta_description`,
                pmd.`short_description`,
                pmd.`slideshow_id`,
                pmd.`photo`
            FROM
                `service` s
            LEFT JOIN `page_meta_data` pmd ON
                (pmd.`id` = s.`page_meta_data_id`)
            WHERE
                s.`id` = '{$id}'
            LIMIT 1";

    $row = fetch_row($sql);

    @extract($row);

    $main_subheading = 'Editing: '.$name;

    $hchecked   = ($show_on_home_page === 'Y') ? ' checked="checked"':'';

    ##------------------------------------------------------------------------------------------------------
    // Init view variables

    $meta_content = '';

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
    ## Details tab content
    include_once'views/details.php';

    ##------------------------------------------------------------------------------------------------------
    ## Content Tab
    include_once 'views/overview.php';

    ##------------------------------------------------------------------------------------------------------
    ## Meta Data Tab
    include_once 'views/meta_data.php';

    ##------------------------------------------------------------------------------------------------------
    ## Service Option Tab
    include_once 'views/service_option.php';

    ##------------------------------------------------------------------------------------------------------
    ## Quicklink Tab
    include_once 'views/quicklink.php';


    ##------------------------------------------------------------------------------------------------------
    ## tab arrays and build tabs

    $temp_array_menutab                       = array();
    $temp_array_menutab['Details']            = $settings_content;
    $temp_array_menutab['Content']            = $main_content;
    $temp_array_menutab['Service Options']    = $service_content;
    $temp_array_menutab['Quicklinks']         = $quicklink_content;
    $temp_array_menutab['Meta Data']          = $meta_content;

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
