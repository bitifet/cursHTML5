
(function(){

    $("a[href^='/setslide/']")
      .addClass("slidesetter")
      .on("click", function(ev){
          ev.preventDefault();
          let url = $(this).attr("href");
          $.ajax({
              url,
              success: ()=>console.log("Done!!"),
          });

      })
    ;

})();
