<?php

##------------------------------------------------------------------------------------------------------
## Photos

$sql = "SELECT
					`id`,
			    `full_path`,
			    `caption_heading`,
			    `description`,
			    `rank`
				FROM
				  `service_options`
				WHERE
				  `service_id` = '{$id}'
				ORDER BY
				  `rank`";

$result = fetch_all($sql);
$photocount = 1;
$photolist="";

$photolist .= '<ul class="slides">';
if(!empty($result)) {     

    foreach ($result as $row)
    {

        $service_option_id       = $row['id'];
        $full_path               = $row['full_path'];
        $caption_heading         = $row['caption_heading'];
        $description             = $row['description'];
        $rank                    = $row['rank'];

        // Get new dimensions
        $width  = 150;
        $height = 150;
        
        $photolist .= <<< HTML
                    
           <li id="photo_$photocount">
                <div class="to-left">
                    <div class="img-wrap">
                        <img src="$full_path" alt="Slide Image $photocount">
                        <input type="hidden" value="$full_path" name="full_path[]">
                    </div>
                </div>
                <div class="to-left padded">
                    <ul>
                      	<li>
                            <label for="rank-$photocount">Rank:</label>
                            <input type="text" id="rank-$photocount" name="photo_rank[]" value="$rank" class="input-small">
                            <a href="javascript:;" onClick="removePhoto($photocount);">remove</a>
                        </li>
                        <li>
                            <label for="caption-$photocount">Heading:</label>
                            <input type="text" maxlength="150" id="caption-heading-$photocount" name="photo_caption_heading[]" value="$caption_heading" class="input-xxlrg">
                        </li>
                        <li>
                            <label for="description-$photocount" style="margin-bottom:20px;">Description:</label>
                            <textarea id="description-$photocount" name="photo_description[]" value="$description" style="width:100%;height:150px;resize:none;">$description</textarea>
															<script>
																CKEDITOR.replace( 'description-{$photocount}', {
																	toolbar : 'MyToolbar',
																	forcePasteAsPlainText : true,
																	resize_enabled : false,
																	height : 250,
																	width: 800,
																	filebrowserBrowseUrl : jsVars.dataManagerUrl
																});               
															</script>
                        </li>
                    </ul>
                </div>
                <div class="clearfix clear"></div>
           </li>
HTML;
					$photocount++;
        }
        
    }
   
//}
$photolist .= '</ul>';
$photocount = $photocount - 1;
    
$service_content = <<< HTML
	<p><strong>Recommend size: 1920x1080px and format: jpg</strong></p>
	<table width="100%" cellpadding="0" cellspacing="0">
	  <tr>
	      <td><div style="margin-bottom:10px;"><a href="javascript:;" onClick="addPhoto();" class="btn btn-primary" style="color:#fff"><i class="glyphicon glyphicon-plus-sign" style="vertical-align:text-top;margin:0px 4px 0 0"></i> add new service option</a></div>$photolist
	          <div id="newPhotos"></div>
	          <input type="hidden" value="$photocount" id="lineValue" />
	          <input type="hidden" id="tempPhoto" name="tempPhoto" value="">
	      </td>
	  </tr>
	</table>

	<script type="text/javascript">


	function unSelectVal(elm)
	{
	  var jElm = $(elm);

	  if(jElm.length)
	  {
	      jElm.on('change', function(){

	          var self = $(this),
	          targetElm = $(self.data('set-default-of')),
	          opts = targetElm.find('option');
	          opts.attr('selected', false);
	          opts.first().attr('selected', true);


	targetElm = $(self.data('set-default-for')),
	          opts = targetElm.find('option');
	          opts.attr('selected', false);
	          opts.first().attr('selected', true);
	      });
	  }
	}

	unSelectVal('.trigger-default');

	  function removePhoto(id) {
	      var id;
	      id = "photo_" + id;
	      $('#'+id).remove();
	  }

	  function addPhoto() {

	      var winl = (screen.width - 1000) / 2;
	      var wint = (screen.height - 700) / 2;
	      var mypage = jsVars.dataManagerUrl+"&NetZone=tempPhoto";
	      var myname = "imageSelector";
	      winprops = 'status=yes,height=700,width=1000,top='+wint+',left='+winl+',scrollbars=auto,resizable'
	      win = window.open(mypage, myname, winprops)
	      if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
	  }

	  function SetUrl(p,w,h) {
	      var p;
	      var w;
	      var h;
	      document.getElementById('tempPhoto').value=p;
	      setNewPhoto();
	  }

	  function setNewPhoto() {

	      var ni = $('.slides');
	      var numi = parseInt(ni.find('[id^="photo_"]').size(), 10);
	      
	      var num = (numi+1);
	      
	      var newdiv = document.createElement('div');

	      document.getElementById('lineValue').value = num;

	      var divIdName = 'photo_'+num;
	      newdiv.setAttribute('id',divIdName);
	      newdiv.setAttribute('style','float:left; width:160px; height:180px; margin-right:10px; margin-bottom:10px;');
	      var newPhotoUrl = document.getElementById('tempPhoto').value;

var newSlide = '<li id="photo_'+num+'">\
			<div class="to-left">\
			    <div class="img-wrap">\
			        <img src="'+newPhotoUrl+'" alt="Slide Image '+num+'">\
			        <input type="hidden" value="'+document.getElementById('tempPhoto').value + '" name="full_path[]">\
			    </div>\
			</div>\
			<div class="to-left padded">\
			    <ul>\
				    <li>\
					    <label for="rank-'+num+'" >Rank:</label>\
					    <input type="text" id="rank-'+num+'" name="photo_rank[]" value="" class="input-small">\
					    <a href="javascript:;" onClick="removePhoto('+num+');">remove</a>\
			      </li>\
			     	<li>\
				      <label for="caption-'+num+'">Heading:</label>\
				      <input type="text" id="caption-heading-'+num+'" maxlength="150" name="photo_caption_heading[]" value="" class="input-xxlrg">\
			 			</li>\
			      <li>\
				        <label for="description-'+num+'">Description:</label>\
				        <textarea id="description-'+num+'" name="photo_description[]" style="width:100%;height:150px;resize:none;"></textarea>\
				    </li>\
			    </ul>\
			</div>\
			<div class="clearfix clear"></div>\
			</li>';

                              

  ni.append(newSlide);
  

  CKEDITOR.replace( 'description-'+num, {
  	toolbar : 'MyToolbar',
  	forcePasteAsPlainText : true,
  	resize_enabled : false,
  	height : 250,
  	width: 800,
  	filebrowserBrowseUrl : jsVars.dataManagerUrl
  });
  unSelectVal('.trigger-default');
 }

</script>
HTML;
?>