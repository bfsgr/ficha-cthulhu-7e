import 'bootstrap'

var inputs = document.getElementsByClassName("setstat-card");

var update_points = function(ev){
    const POINTS = 460;

    let changed = ev.target;
    let newv = Number(changed.value);

    if(changed.checkValidity()){
        changed.parentElement.style.boxShadow = 'none'
    }

    let index = changed.dataset.index;

    let ac = 0;
    for(let i = 0; i < 8; i++){
        if( i != index){
            ac += Number(inputs[i].value)
        }
    }

    let av = POINTS - ac;

    if( av - newv >= 0){
        $('#points').text(av - newv);
    } else if ( (av - newv) == 0 ) {
        $('#points').text(0);
    } else {
        changed.value = av;
        $('#points').text(0)
    }
}

window.onload = function(){
    for(let i = 0; i < 8; i++) {
        inputs[i].onchange = update_points;
        inputs[i].addEventListener('invalid', function(ev){
            ev.target.parentElement.style.boxShadow = '0px 0px 8px red'
        })
    }
}