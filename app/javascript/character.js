function fase2(){
    let name = document.getElementById('name-input');
    let form = document.getElementById('character_name');

    if (name.checkValidity() == false) {
        name.classList.add("is-invalid");
    } else {
        form.value = name.value;
    
        $('#newchar-name').fadeOut(400, function() {
            document.getElementById('newchar-ocupation').style.display = 'grid';
        });
        document.getElementById('fase-3').addEventListener('click', fase3 );
    }

}

function fase3(){
    let ocupation_id = document.getElementById('ocupations');
    let form = document.getElementById('character_ocupation');
    
    if (ocupation_id.checkValidity() == false) {
        ocupation_id.classList.add("is-invalid");
    } else {
        form.value = ocupation_id.value;
    
        $('#newchar-ocupation').fadeOut(400, function() {
            document.getElementById('newchar-bp').style.display = 'grid';
        });
        document.getElementById('fase-4').addEventListener('click', fase4 );
    }
}

function fase4(){
    let bp = document.getElementById('bp').value;
    let form = document.getElementById('character_birth_place');

    form.value = bp;

    $('#newchar-bp').fadeOut(400, function() {
        document.getElementById('newchar-age').style.display = 'grid';
    });
    document.getElementById('fase-5').addEventListener('click', fase5 );
}

function fase5(){
    let val = document.getElementById('age').value;
    let form = document.getElementById('character_age');

    form.value = val;

    $('#newchar-age').fadeOut(400, function() {
        document.getElementById('newchar-sex').style.display = 'grid';
    });
    document.getElementById('fase-6').addEventListener('click', fase6 );
}

function fase6(){

}

window.onload = function(){
    document.getElementById('fase-2').addEventListener('click', fase2 );
}

