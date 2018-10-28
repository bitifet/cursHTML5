
(function(){


    let $ctrl = $("<div></div>")
        .addClass("controlButtons")
        .appendTo($("body"))
    ;

    function button(text, command) {
        $("<a></a>")
            .attr("href", "/setslide/"+command)
            .text(text)
            .addClass("button")
            .appendTo($ctrl)
        ;
    };

    //button("^", "0");
    button("↞", "_reload"); // Reloading also goes top
    button("←", "-");
    $ctrl.append($("<span></span>"));
    button("→", "+");
    button("↠", "100000");







    // Enhance slide setters:{{{
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
    ;//}}}

})();
