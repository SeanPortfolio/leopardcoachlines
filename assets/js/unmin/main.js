// General App
(function(w){

  w.App = function(){
    this.config = {
      serviceUrl:'/requests/service',
      loadedGalleries:{}
    };
  };

  w.App.prototype.init = function() {
    var ths = this;

    this.config = $.extend(true, this.config, jsVars);

    this.toggleNav('.toggle-snav');
    this.toggleElm('.toggle-elm');
    this.initNewsletterSignup('#news-signup-form');
    this.initCarousel('.gallery-carousel');
    this.initPhotoswipe('.gallery-carousel .img.ps-item');
    this.initShuffle('#shuffle');
    this.initMap();

    this.initSlideshow('.banner__slider');


        // Scroll Top Trigger

        $('.scroll-trigger').on('click', function(e){
          e.preventDefault();

          var scrollTo = $('.banner__slider-icon').offset().top;
          scrollPoint = $(window).scrollTop();

          if( scrollPoint < scrollTo ) {
            $('html, body').delay(200).animate({ scrollTop: scrollTo }, { duration: 350 });
          }

        });

        
      };

      w.App.prototype.getVar = function(property, obj){
        if(obj.hasOwnProperty(property)) return obj[property];

        for(var prop in obj)
        {
          if(obj[prop].hasOwnProperty(property))
          {
            return obj[prop][property];
          }
        }
        
        return false;
      };


      w.App.prototype.getConfigItem = function(prop)
      {
        return this.getVar(prop, this.config);

      };

      w.App.prototype.toggleNav = function(elm){
        var jElm = $(elm);

        if( jElm.length )
        {
          jElm.on('click', function(e){
            e.preventDefault();

            var self = $(this),
            target = self.next('.sub-menu');

            if( target.length )
            {
              target.toggle();
              self.toggleClass('active');

            }

          });

        }
      };


      w.App.prototype.toggleElm = function(elm){
        var jElm = $(elm);

        if( jElm.length ) {
          jElm.on('click', function(e){
            e.preventDefault();

                var self = $(this),
                    targetSel = $('header nav'),
                    target = $(targetSel),
                    activeCls = 'active';

            if(!self.hasClass(activeCls)) {

              target.addClass(activeCls);
              self.addClass(activeCls);
              $('[href="'+targetSel+'"]').addClass(activeCls);
            } else {
              target.removeClass(activeCls);
              self.removeClass(activeCls);
            }
        }
                
            );


        }
      };


      w.App.prototype.matchElmHeight = function(elm) {
        var jElm = (typeof elm == 'string') ? $(elm) : elm;

        if( jElm )
        {
          jElm.css('height','auto');

          var height = 0;

          jElm.each(function(i, el) {
            var jEl = $(el),
            elHeight = jEl.height();

            if( elHeight > height ) height = elHeight;
          });

          jElm.css('height', height);
        }
      };

      w.App.prototype.initSlideshow = function(selector, options){

        /*var jElm = $(elm);

        if( jElm.length )
        {
            var ths = this;

            var defaults = {
                animation: 'fade',
                directionNav: false,
                controlNav: false,
                slideshowSpeed:ths.getConfigItem('slideshowSpeed'),
                prevText:'',
                nextText:''
            };

            opts = $.extend(true, defaults, opts);

            jElm.slick();

        }*/
        var defaultOptions = {
          dots: false,
          arrows: true,
          autoplay: true,
          infinite: true,
          speed: 500,
          autoplaySpeed: (app.getConfigItem('slideshow_speed') * 1000),
          fade: true,
          cssEase: 'linear',
          prevArrow: '<a href="javascript:;" class="slider__nav slider__nav--prev">'+
          '<i class="fa fa-angle-left"></i>'+
          '</a>',
          nextArrow: '<a href="javascript:;" class="slider__nav slider__nav--next">'+
          '<i class="fa fa-angle-right"></i>'+
          '</a>'
        };
        
        options = $.extend(true, defaultOptions, options);
        
        var slider = $(selector).slick(options);
        
        return slider;

    };


      w.App.prototype.initNewsletterSignup = function(elm)
      {
        var jElm = $(elm);

        if(jElm.length)
        {

          var triggerBtn = jElm.find('#newsletter-submit');

          if(triggerBtn.length)
          {
            triggerBtn.on('click', function(e){
              e.preventDefault();

              var emailAddress =  $.trim(jElm.find('#signup-email').val()),
              msg = '',
              msgType = 'text-dange';

              var msgHodler = jElm.find('.msg');

              if(emailAddress)
              {
                var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

                if(emailRegex.test(emailAddress))
                {

                  $.post(app.getConfigItem('serviceUrl'), 'action=sign-up&email='+emailAddress, function(response){

                    if(response.msg)
                    {
                      msgHodler.removeAttr('class').addClass('msg '+response.type).html(response.msg);
                    }

                    if(response.isValid)
                    {
                      setTimeout(function(){
                        msgHodler.removeClass(response.type).html('');
                        jElm.find('#full-name').val('');
                        jElm.find('#signup-email').val('');

                      }, 5000);
                    }

                    return false;

                  }, 'json');
                }
                else
                {
                  msg = 'Invalid email address provided.';
                }
              }
              else
              {
                msg = 'Your email address is required.';
              }

              if(msg)
              {
                msgHodler.removeAttr('class').addClass('msg '+msgType).html(msg);
              }

            });
          }
        }
      };

    w.onYouTubeIframeAPIReady = function () {

      var elm         = $('.video_player').get(0),
          parentElm   = $('.video__wrapper'),
          id          = elm.getAttribute("data-youtube-id"),
          frameWidth  = screen.width,
          frameHeight = screen.height,
          newFrameWidth,
          newFrameHeight;

      console.log(id);

      parentElm.css('overflow', 'hidden');
      
      var player = new YT.Player(elm, {
          videoId: id,
          width: frameWidth,
          height: frameHeight,
          playerVars: {
              start: 0,
              autoplay: true,
              controls: false,
              rel: 0,
              showinfo: false,
              modestbranding: true,
              loop: 1,
              fs: false,
              cc_load_policy: true,
              iv_load_policy: 3,
              autohide: false,
              modestbranding: 1,
              playlist: id
          },
          events: {
              onReady: function(e) {
                  e.target.mute();

                  // Make video element full screen

                  newFrameWidth = frameHeight*1.77;

                  if (newFrameWidth < frameWidth) {

                      newFrameWidth   = frameWidth;

                      newFrameHeight = ( frameWidth*0.565 );

                  } else { 

                      newFrameHeight = frameHeight;
                  }

                  //alert(newFrameWidth);

                  $('.video_player').css({
                      'height': newFrameHeight,
                      'width': newFrameWidth
                  }).attr({
                      'height': newFrameHeight,
                      'width': newFrameWidth
                  });

                  $('.page__photo__caption--ghost').delay(2000).animate({"opacity": "1"}, 1500).delay(7500).animate({"opacity": "0"}, 1500);
              }
          }
      });

  };
  function appendYouTubeAPI() {

    var jElm    = $('.video_player'),
        videoId = jElm.data('youtube-id');

    if (jElm.length == 1 && videoId) {

        var apiUrl = 'https://www.youtube.com/iframe_api?callback=onYouTubeIframeAPIReady';

        var tag     = document.createElement('script');
            tag.src = apiUrl;

        $('head').append(tag);

    };
}

appendYouTubeAPI();

    w.App.prototype.initMap = function() {

      if($('#map-canvas').length){

      var mapStyles = [];

      var locations = [
         ['Leopard Coachlines', '81 Buchanans Road, Hei Hei PO Box 7353 Christchurch, New Zealand', -43.533707, 172.536877, 2],
         ['Leopard Coachlines', '182 Jervois Rd Herne Bay 1011 Auckland', -36.8456028, 174.73634830000003, 1]
      ];

      var map = new google.maps.Map(document.getElementById('map-canvas'), {
        zoom: 6,
        center: {lat: -39.733707, lng: 172.536877},
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        scrollwheel:false,
        draggable:(( $(window).width() > 991 ) ? true : false) 
      });

      var infowindow = new google.maps.InfoWindow();

      var markerIcon = new google.maps.MarkerImage(
                           '/graphics/sprite.png', null, null, null,
                           new google.maps.Size(21,32),
                           new google.maps.Point(80,0)
                  );

      var marker, i;

      for (i = 0; i < locations.length; i++) {  

      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][2], locations[i][3]),
        map: map,
        icon: markerIcon,
        title: locations[i][0]
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent('<h5>'+locations[i][0]+'</h5><p>'+locations[i][1]+'</p>');
          infowindow.open(map, marker);
        }
      })(marker, i));
    } 
  }
};

    w.App.prototype.initCarousel = function (elm) {

      var slick = $(elm);

      slickInst = slick.slick({
        dots: false,
        infinite: true,
        speed: 300,
        slidesToShow: 1,
        slidesToScroll: 1,
        prevArrow:'<div class="carousel__gallery__prev"><i class="fa fa-caret-left"></i></div>',
        nextArrow:'<div class="carousel__gallery__next"><i class="fa fa-caret-right"></i></div>',
        mobileFirst:true,
        adaptiveHeight:false,
        responsive: [
        {
            breakpoint: 230,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
            }
        },{
            breakpoint: 767,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 1,
            }
        },{
            breakpoint: 991,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1,
            }
        },{
            breakpoint: 1200,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1,
            }
          }
        ]
      });
    };

    w.App.prototype.initPhotoswipe = function(elm){

      var jElm = $(elm);

      if(jElm.length)
      {
         var options = {
                 index:0,
                 shareEl:false,
                 preload:[1,2],
                 history:false,
                 bgOpacity:0.8
             };

         jElm.on('click', function(e){
             e.preventDefault();

             var groupId = $(this).data('groups');
             options.index = $(this).data('key');
             
             var slides    = app.getConfigItem(groupId);
             $.each(slides, function(i, item){
                 slides[i].src   = item.full_path;
             });
           
            console.log(groupId);
             var gallery = new PhotoSwipe( $('.pswp').get(0), PhotoSwipeUI_Default, slides, options);
             gallery.init();
         });            
       }
    };

    w.App.prototype.initShuffle = function(elm){
        var jElm = $(elm),
        ths = this;

        if(jElm.length)
        {
            jElm.shuffle({
                group:'all',
                itemSelector:'figure',
                speed:450
            });

            $('.shuffle-trigger').on('click', function(e) {

                e.preventDefault();

                jElm.shuffle( 'shuffle', $(this).attr('data-group') );

                $('.shuffle-trigger').removeClass('active');
                $(this).addClass('active');
                
            });

            jElm.on('done.shuffle', function(){
                ths.initPhotoswipeShuffle(elm+' .img.ps-item');
            });
        }
    };

    w.App.prototype.initPhotoswipeShuffle = function(elm){

        var jElm = $(elm);
        
        if(jElm.length)
        {         
            var template = app.getConfigItem('templates').psGallery;

            if( $('.pswp').length == 0 )
            {
                $('body').append(template);
            }

            var options = {
                index:0,
                shareEl:false,
                preload:[1,2],
                history:false,
                bgOpacity:0.8
            };

            jElm.on('click', function(e){
                e.preventDefault();

                var self = $(this),
                group = self.data('gp'),
                siblings = $(elm).siblings('.filtered'),
                href = self.data('fpath'),
                photos = [];

                if( siblings.length )
                {
                    siblings.each(function(i, e){
                        var jE = $(e);
                        var src = jE.attr('data-fpath'),
                        title = jE.attr('title'),
                        size = jE.data('size').split('x');

                        photos.push({src:src, w:size[0], h:size[1], title:title});
                    });
                }


                if( photos.length )
                {
                   
                    var srcs = $.map(photos, function(photo, i) {
                       return photo.src;
                    });
                    
                    options.index = srcs.indexOf(href);
                   
                    var gallery = new PhotoSwipe( $('.pswp').get(0), PhotoSwipeUI_Default, photos, options);
                    
                    gallery.init();

                }
            });            
        }
    };


}(window));
var app = new App();