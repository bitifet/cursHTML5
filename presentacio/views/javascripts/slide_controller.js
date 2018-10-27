// javascripts/slide_controller.js
// ===============================

(function(){

    const $app = $("body");
    const slides = $(".slide")
        .toArray()
        .map(s=>$(s))
    ;

    let current = 0;

    function change(n) {
        if (n >= slides.length) n = slides.length - 1;
        if (n < 0) n = 0;
        slides[current].removeClass("current");
        current = n;
        slides[current].addClass("current");
    }
    const next = ()=>change(current+1);
    const prev = ()=>change(current-1);


    $app.on("keyup", function(ev) {
        let key = ev.originalEvent.code;
        switch (key) {
            case "ArrowUp":
            case "ArrowLeft":
            case "Backspace":
                prev();
                break;
            case "ArrowDown":
            case "ArrowRight":
            case "Enter":
            case "Space":
                next();
                break;
            default:
                // console.log (key);
        };

    });





})();
