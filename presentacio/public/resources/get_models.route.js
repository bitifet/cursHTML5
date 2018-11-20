
/* GET models client side */
router.get('/model/:model_id.json', function(req, res, next) {

    var model = models[req.params.model_id];

    if (model !== undefined) {
        res
            .status(200)
            .set('Content-Type', 'application/json')
            .send(model)
        ;
    } else {
        next();
    };

});
