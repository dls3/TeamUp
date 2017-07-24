document.addEventListener('DOMContentLoaded', function(){

   var signIn = document.querySelector('#loginbutton');

   signIn.addEventListener('click', function(e){

     document.querySelector('.loginform_container').style.display = 'block'

   });

   var exitForm = document.querySelector('#exit-form');

   exitForm.addEventListener('click', function(e) {

     document.querySelector('.loginform_container').style.display = 'none'
   });

 })
