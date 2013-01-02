// initialise plugins for Superfish Top Menu
jQuery(function(){
    jQuery('ul.sf-menu').superfish();
});


// initialise custom font settings
/*
Cufon.replace('h1', {
    fontFamily: 'GeosansLight'
});
Cufon.replace('h2', {
    fontFamily: 'GeosansLight'
});
Cufon.replace('h3', {
    fontFamily: 'GeosansLight'
});
Cufon.replace('.portfolio .h4', {
    fontFamily: 'GeosansLight'
});
//Cufon.replace('.portfolio p', { fontFamily: 'ftra' });
Cufon.replace('h4', {
    fontFamily: 'myriad'
});
Cufon.replace('.inquire-button', {
    fontFamily: 'myriad'
});
Cufon.replace('.button-1', {
    fontFamily: 'myriad'
});
Cufon.replace('.button-2', {
    fontFamily: 'myriad'
});

//Cufon.replace('.sf-menu a', { fontFamily: 'myriad' });
// Gallery image hover	
function portfolio_img_hover($hover_class){
    jQuery('.' + $hover_class).hover(function(){
        jQuery(this).find('.hover_fade').stop().animate({
            opacity: 0.4
        }, 400);
    }, function(){
        jQuery(this).find('.hover_fade').stop().animate({
            opacity: 1
        }, 400);
    });
}
*/

 var myMap = null;

function LoadMap()
{
myMap = new VEMap("mapDiv");
myMap.LoadMap();
myMap.SetZoomLevel(15);
myMap.SetBirdseyeOrientation(VEOrientation.South);
StartGeocoding("HSM Pacific Realty, 612 SW Idaho St # 2, Portland, OR 97239-3562");

}
 function UnloadMap()
 {
    if (myMap != null) {
       myMap.Dispose();
    }
 }

 function StartGeocoding( address )
 {
   myMap.Find(null,    // what
      address, // where
      null,    // VEFindType (always VEFindType.Businesses)
      null,    // VEShapeLayer (base by default)
      null,    // start index for results (0 by default)
      null,    // max number of results (default is 10)
      null,    // show results? (default is true)
      null,    // create pushpin for what results? (ignored since what is null)
      null,    // use default disambiguation? (default is true)
      null,    // set best map view? (default is true)
      GeocodeCallback);  // call back function
 }


function GeocodeCallback (shapeLayer, findResults, places, moreResults, errorMsg)
{
   // if there are no results, display any error message and return
   if(places == null)
   {
      alert( (errorMsg == null) ? "There were no results" : errorMsg );
      return;
   }

   var bestPlace = places[0];

   // Add pushpin to the *best* place
   var location = bestPlace.LatLong;

   var newShape = new VEShape(VEShapeType.Pushpin, location);

   var desc = "Latitude: " + location.Latitude + "<br>Longitude:" + location.Longitude;
   newShape.SetDescription(desc);
   newShape.SetTitle(bestPlace.Name);
   myMap.AddShape(newShape);
}

//HOME GLIDESLIDER BEGINS HERE
$(document).ready(function(){
    //Show the paging and activate its first link
    $(".paging").show();
    $(".paging a:first").addClass("active");
    
    //Get size of the image, how many images there are, then determin the size of the image reel.
    var imageWidth = $(".window").width();
    var imageSum = $(".image_reel img").size();
    var imageReelWidth = imageWidth * imageSum;
    
    //Adjust the image reel to its new size
    $(".image_reel").css({
        'width': imageReelWidth
    });
    
    //Paging  and Slider Function
    rotate = function(){
        var triggerID = $active.attr("rel") - 1; //Get number of times to slide
        var image_reelPosition = triggerID * imageWidth; //Determines the distance the image reel needs to slide
        $(".paging a").removeClass('active'); //Remove all active class
        $active.addClass('active'); //Add active class (the $active is declared in the rotateSwitch function)
        //Slider Animation
        $(".image_reel").animate({
            left: -image_reelPosition
        }, 500);
        
    };
    
    //Rotation  and Timing Event
    rotateSwitch = function(){
        play = setInterval(function(){ //Set timer - this will repeat itself every 7 seconds
            $active = $('.paging a.active').next(); //Move to the next paging
            if ($active.length === 0) { //If paging reaches the end...
                $active = $('.paging a:first'); //go back to first
            }
            rotate(); //Trigger the paging and slider function
        }, 8000); //Timer speed in milliseconds (8 seconds)
    };
    
    rotateSwitch(); //Run function on launch
    //On Hover
    $(".image_reel a").hover(function(){
        clearInterval(play); //Stop the rotation
    }, function(){
        rotateSwitch(); //Resume rotation timer
    });
    
    //On Click
    $(".paging a").click(function(){
        $active = $(this); //Activate the clicked paging
        //Reset Timer
        clearInterval(play); //Stop the rotation
        rotate(); //Trigger rotation immediately
        rotateSwitch(); // Resume rotation timer
        return false; //Prevent browser jump to link anchor
    });
    //HOME SLIDER ENDS HERE
});














