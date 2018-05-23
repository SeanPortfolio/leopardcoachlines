<?php

$mapPinsView = '<div class="container intro-container">
       <div class="row">
        <div class="col-xs-12 col-md-7">
          <!-- description -->
          <p class="text-blue text-huge intro-heading">
            '.$heading.'
          </p>
          <p class="text-grey-medium">
              '.$introduction.'
          </p>
        </div>
        <div class="col-xs-12 col-md-4 col-md-offset-1">
          <!-- map -->
          <div class="map-location">
          <img src="/graphics/nz-map.png" alt="map">
          <p class="map__text map__text--akl">Auckland</p>
          <div class="map-icon map-icon--akl">
          <a href="/locations/auckland"><i class="fa fa-bus"></i></a>
          </div>
          <p class="map__text map__text--chch">Christchurch</p>
          <div class="map-icon map-icon--chch">
          <a href="/locations/christchurch"><i class="fa fa-bus"></i></a>
          </div>
          </div>
        </div>
        <img class="hidden-xs hidden-sm intro-container__pattern" src="/graphics/pattern-left.png" alt="">
       </div>
     </div>';

$tags_arr['map_pins_view'] = $mapPinsView;


