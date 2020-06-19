function fase2(){
    name = document.getElementById('name-input').value;
    form = document.getElementById('character_name');

    form.value = name;

    $('#newchar-name').fadeOut()
}

window.onload = function(ev){
    document.getElementById('fase-2').addEventListener('click', fase2 )
}

