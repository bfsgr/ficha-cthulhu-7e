fase2 = function(){
    input = document.getElementById('character_name')
    
    if (input.checkValidity() == false) {
        input.classList.add("is-invalid");
    } else {
        $('#newchar-name').fadeOut(400, function() {
            document.getElementById('newchar-ocupation').style.display = 'grid';
        });
        document.getElementById('fase-3').addEventListener('click', fase3 );
    }
}

function fase3(){
    input = document.getElementById('character_ocupation');
    
    if (input.checkValidity() == false) {
        input.classList.add("is-invalid");
    } else {
        $('#newchar-ocupation').fadeOut(400, function() {
            document.getElementById('newchar-bp').style.display = 'grid';
        });
        document.getElementById('fase-4').addEventListener('click', fase4 );
    }
}

function fase4(){
    input = document.getElementById('character_birth_place');
    
    if (input.checkValidity() == false) {
        input.classList.add("is-invalid");
    } else {
        $('#newchar-bp').fadeOut(400, function() {
            document.getElementById('newchar-age').style.display = 'grid';
        });
        document.getElementById('fase-5').addEventListener('click', fase5 );
    }
}

function fase5(){
    input = document.getElementById('character_age');
    
    if (input.checkValidity() == false) {
        input.classList.add("is-invalid");
    } else {
        $('#newchar-age').fadeOut(400, function() {
            document.getElementById('newchar-mental').style.display = 'grid';
        });
        document.getElementById('fase-6').addEventListener('click', fase6 );
    }
}

function fase6(){
    $('#newchar-mental').fadeOut(400, function() {
        document.getElementById('newchar-sex').style.display = 'grid';
    });
}


handleKey = function(ev){
    if(ev.key == "Enter"){
        ev.preventDefault();
        ev.stopPropagation();

        let el = document.getElementsByClassName('wrapper-newchar');

        for(let i = 0; i < el.length; i++){
            if(el[i].offsetParent !== null){
                if(el[i].children[1].checkValidity()){
                    el[i].children[2].click()
                } else {
                    el[i].children[1].classList += ' is-invalid'
                }
            }
        }
    }
}


window.onload = function(){
    if(document.getElementsByClassName('wrapper-newchar').length > 0){
        document.onkeydown = handleKey
    }
}