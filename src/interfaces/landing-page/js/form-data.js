const btCadastro = document.getElementById("bt-modal-cadastro");
const btEntrar = document.getElementById("bt-modal-entrar");
const btConfirmarCadastro = document.getElementById("bt-confirmar");
const btConfirmarEntrada = document.getElementById("bt-confirma-entrada");
const btsLanding = document.querySelectorAll("#bts-landing button");
var resultado = "";

for (var i = 0; i < btsLanding.length; i++) {
  btsLanding[i].addEventListener("click", function (e) {
    resultado = this.innerHTML;
    return resultado;
  })
}    

const getForm = () => {
  var form = resultado;

  if(form == "ENTRAR"){
    form = document.getElementById("form-entrar");
    return form;
  }else{
    form = document.getElementById("form-cadastro");
    return form;
  }
}

const getFormData = () => {
  const form = getForm();
  return new FormData(form);
}

const toJson = function(event) {
  const formData = getFormData();
  event.preventDefault();

  let object = {};
  formData.forEach((value, key) => {
    if (!Reflect.has(object, key)){
      object[key] = value;
      return;
    }
    if (!Array.isArray(object[key])){
      object[key] = [object[key]];
    }
    object[key].push(value);
  });

  let json = JSON.stringify(Object.fromEntries(formData));
  console.log(json);
};

btConfirmarCadastro.addEventListener("click", toJson);
btConfirmarEntrada.addEventListener("click", toJson);

// var request = new XMLHttpRequest();
// request.open("POST", "http://localhost:5500");
// request.send(toJson);