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
        if (n == "_reload") {
            return window.location.reload();
        };
        if (n == "+") {
            let nextStep = $(".step:not(.done)", slides[current]).first();
            if (nextStep.length) {
                nextStep.addClass("done");
            } else {
                $(".step", slides[current]).removeClass("done");
                n = current + 1;
            };
        } else {
            // Auto-stepping by re-calling same slide.
            if (slides[current].data("name") == n) {
                if (! $(".step:not(.done)", slides[current]).length) return;
                return change("+");
            };
            // Stepping reset:
            $(".step", slides[current]).removeClass("done");
        };
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
        n = Number(n);
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
