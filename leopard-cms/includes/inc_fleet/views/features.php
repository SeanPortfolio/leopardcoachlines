<?php

$feat_content = <<< HTML
<table width="100%" border="0" cellspacing="0" cellpadding="8">
    <tr>
        <td>
	        <textarea id="features" name="features" value="$features" style="width:100%;height:150px;resize:none;">$features</textarea>
						<script>
							CKEDITOR.replace( 'features', {
								toolbar : 'MyToolbar',
								forcePasteAsPlainText : true,
								resize_enabled : false,
								height : 450,
								filebrowserBrowseUrl : jsVars.dataManagerUrl
							});               
						</script>
        </td>
    </tr>
</table>
HTML;

?>