<?php
$settings_content = <<< HTML
    <table width="100%" border="0" cellspacing="0" cellpadding="8">
        <tr>
            <td width="130"><label for="name">Name:</label></td>
            <td><input name="name" type="text" id="name" value="$name" style="width:300px;" /></td>
            <td width="130"><label for="menu_label">Menu Label:</label></td>
            <td><input name="menu_label" type="text" id="menu_label" value="$menu_label" style="width:300px;" /></td>
        </tr>
        <tr>
            <td width="130"><label for="heading">Heading:</label></td>
            <td><input name="heading" type="text" id="heading" value="$heading" style="width:300px;" /></td>
            <td width="130"><label for="url">URL:</label></td>
            <td><input name="url" type="text" id="url" value="$url" style="width:300px;" /></td>
        </tr>
        <tr>
            <td width="130" valign="top"><label>Slideshow:</label></td>
            <td valign="top">
                {$slideshow_view}
            </td>
        </tr>
        <tr>
            <td valign="top"><label>Photo:</label></td>
            <td>
                <input name="photo" type="text" id="photo" value="$photo" style="margin-right:5px;width:300px;height:25px;float:left;" />
                <input type="button" onclick="openFileBrowser('photo')" style="height:25px;padding:1px 5px;" value="Browse">
                <input type="button" value="clear" onclick="clearValue('photo')" style="height:25px;"><br>
            </td>
            <td width="150"><label for="show_on_home_page">Show on home page:</label></td>
            <td><input name="show_on_home_page" type="checkbox" id="show_on_home_page" value="Y"{$hchecked} /></td> 
        </tr>
        <tr>
            <td width="130" valign="top"><label for="introduction">Introduction:</label></td>
            <td valign="top" colspan="3">
                <textarea name="introduction" class="check-max" style="width:100%;height:70px;resize:none;">$introduction</textarea>
                <br/><span class="text-muted"><small>Introduction (including spaces) <em></em></small></span>
                <small class="text-muted"><br>(Showing on service single page)</small>
            </td>
        </tr>
        <tr>
            <td width="130" valign="top"><label for="short_description">Short Description:</label></td>
            <td valign="top" colspan="3">
                <textarea name="short_description" class="check-max" maxlength="180" style="width:100%;height:70px;resize:none;">$short_description</textarea>
                <br/><span class="text-muted"><small>Short Description should be between 100-180 characters (including spaces) <em></em></small></span><small class="text-muted"><br>(Showing on service options quicklinks) </small>
            </td>
        </tr>
</table>
HTML;
?>