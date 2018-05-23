<?php

$tags_arr['script-ext'] .= <<<H
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCqeRCfbUFp9cDWpnZPu1B8AnNnLCT9ZjQ"></script>
H;

	$map = <<<H
	<div class="map-wrappper">
		<div id="map-canvas" class="map--canvas"></div>
	</div>
H;

$tags_arr['map_view'] = $map;

?>