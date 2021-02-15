$(document).ready(function() {
  var image, imageCounter = 0, imageCache = [];
  var myTimer, thisSlide, thisCaption;

  $("img").filter("#slide").click(
    function(){
      clearInterval(myTimer);
    }
  );
  /*
  $("img").filter("#slide").dblclick(
    function(){
      clearInterval(myTimer);
    }
  );
  */
  $("img").filter("#slide").hover(
    function(){
      thisSlide = $(this);
      thisCaption = $(this).prev("#caption");
      imageCache = [];
      imageCounter=0;
      $(this).filter("#slide").next().find("img").each(
        function(){
          image = new Image();
          image.src = $(this).attr("src");
          image.title = $(this).attr("alt");
          image.href = $(this).attr("href");
          imageCache[imageCounter] = image;
          imageCounter++;
        }
      );
      console.log(imageCache);
      imageCounter = 0;
      var nextImage;
      myTimer = setInterval(
        function () {
          thisCaption.fadeOut(550);
          thisSlide.fadeOut(550,
            function() {
              imageCounter = (imageCounter + 1) % imageCache.length;
              nextImage = imageCache[imageCounter];
              $(this).attr("href",nextImage.href);
              $(this).attr("src", nextImage.src).fadeIn(500);
              $(this).prev("#caption").text(nextImage.title).fadeIn(500); 
            } 
          ); 
        },
        2000); 
    },
    function(){
      clearInterval(myTimer);
      nextImage = imageCache[0];
      $(this).prev("#caption").text(nextImage.title);
      $(this).attr("href",nextImage.href);
      $(this).attr("src", nextImage.src);
      //$(this).prev("#caption").text(thisCaption.text());
      
    }
  );
});
