var inputs = document.getElementsByClassName("setstat-card");

update_points = function(){
    const POINTS = 460;

    let ac = 0;

    for(let i = 0; i < 8; i++) {
        if (inputs[i] != undefined) {
            ac += Number(inputs[i].value)
        }
    }

    let av = POINTS - ac;

    $('#points').text(av);
}


window.onload = function(){
    for(let i = 0; i < 8; i++) {
        inputs[i].onchange = update_points;
    }
}