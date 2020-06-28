fase2 = function(){
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
    let val = document.getElementById('bp');
    let form = document.getElementById('character_birth_place');
    
    if (val.checkValidity() == false) {
        val.classList.add("is-invalid");
    } else {
        form.value = val.value;
    
        $('#newchar-bp').fadeOut(400, function() {
            document.getElementById('newchar-age').style.display = 'grid';
        });
        document.getElementById('fase-5').addEventListener('click', fase5 );
    }
}

function fase5(){
    let val = document.getElementById('age');
    let form = document.getElementById('character_age');
    
    if (val.checkValidity() == false) {
        val.classList.add("is-invalid");
    } else {
        form.value = val.value;
    
        $('#newchar-age').fadeOut(400, function() {
            document.getElementById('newchar-mental').style.display = 'grid';
        });
        document.getElementById('fase-6').addEventListener('click', fase6 );
    }
}

function fase6(){
    let val = document.getElementById('mental');
    let form = document.getElementById('character_mental_illnesses');
    
    form.value = val.value;
    
    $('#newchar-mental').fadeOut(400, function() {
        document.getElementById('newchar-sex').style.display = 'grid';
    });
    document.getElementById('fase-7').addEventListener('click', fase7 );
}

function fase7(){
    let val = document.getElementById('sex');
    let form = document.getElementById('character_sex');
    
    if (val.checkValidity() == false) {
        val.classList.add("is-invalid");
    } else {
        form.value = val.value;
    
        $('#newchar-sex').fadeOut(400, function() {
            document.getElementById('sendchar').click()
        });
    }
}

