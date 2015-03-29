var parsed_response;

window.onload = function(){
  var parsed_response = document.getElementById("parsed_response");
  
  document.getElementById("slide_show").onclick = loadSlide
  function loadSlide() {
    var js_req = new XMLHttpRequest;
    js_req.addEventListener("load", function() {
      parsed_response = JSON.parse(js_req.response);
      document.getElementById("result_title").innerHTML = parsed_response[0].title;
      document.getElementById("result_body").innerHTML = parsed_response[0].body;

    });
    js_req.open("get", "http://localhost:4567/allslides");
    js_req.send();
  }

  var i = 0;
  
  document.getElementById("next_slide").onclick = function() {
    if (i < parsed_response.length - 1) {
  i++; 
  console.log(parsed_response)
  document.getElementById("result_title").innerHTML = parsed_response[i].title;
  document.getElementById("result_body").innerHTML = parsed_response[i].body;
  }
}
  
  document.getElementById("last_slide").onclick = function() {
    if (i > 0) {
  i--; 
  console.log(parsed_response)
  document.getElementById("result_title").innerHTML = parsed_response[i].title;
  document.getElementById("result_body").innerHTML = parsed_response[i].body;
  } 
}
};


 
