// javascripts/slide_controller.js
// ===============================

(function(){

    const primus = Primus.connect();

    const $app = $("body");
    const slides = $(".slide")
        .toArray()
        .map(s=>$(s))
    ;

    let current = 0;

    function change(n) {
        if (n == "+") n = current + 1;
        if (n == "-") n = current - 1;
        if (isNaN(n)) { // Find by data-name:{{{
            for (let i=0; i<slides.length; i++) {
                if (slides[i].data("name") == n) {
                    n = i;
                    break;
                };
            };
            if (isNaN(n)) return;
        };//}}}
        if (n >= slides.length) n = slides.length - 1;
        if (n < 0) n = 0;
        slides[current].removeClass("current");
        current = n;
        slides[current].addClass("current");
    }


    $app.on("keyup", function(ev) {
        let key = ev.originalEvent.code;
        switch (key) {
            case "ArrowUp":
            case "ArrowLeft":
            case "Backspace":
                change("-");
                break;
            case "ArrowDown":
            case "ArrowRight":
            case "Enter":
            case "Space":
                change("+");
                break;
            default:
                // console.log (key);
        };

    });


    primus.on("data", change);


})();
