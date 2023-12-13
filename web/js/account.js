
document.addEventListener("DOMContentLoaded", function(e) {
let form = document.getElementById('form');
let email = document.getElementById('email');
let password = document.getElementById('password');
let confrmPassword = document.getElementById('confrm-password');
let newPassword = document.getElementById('newPassword');
let confirmPassword = document.getElementById('confirmPassword');

function check(){
    form.addEventListener('submit', function(event){
    event.preventDefault();
    
    isValidInput();
    
});
}

function Password(){
    form.addEventListener('submit', function(event){
    event.preventDefault();
    
    isValidPassword();
    
});
}


function setError(element, message){
    let inputControl = element.parentElement;
    let errorDisplay = inputControl.querySelector('small');

    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('success');
    
}
function setSuccess(element, message){
    let inputControl = element.parentElement;
    let errorDisplay = inputControl.querySelector('small');

    errorDisplay.innerText = message;
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
    
}
function isValidEmail(email){
    let re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}
function checkPassword(password) {
    let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    return regex.test(password);
}


function isValidInput(){
    let emailValue = email.value.trim();
    let passwordValue = password.value.trim();
    let confrmPasswordValue = confrmPassword.value.trim();
    
    if(emailValue === '' || !isValidEmail(emailValue) || passwordValue === '' || passwordValue.length < 8 || !checkPassword(passwordValue) || confrmPasswordValue === '' || confrmPasswordValue !== passwordValue){
        if(emailValue === '') {
        setError(email, "Email is required");
        } else if (!isValidEmail(emailValue)) {
            setError(email, "Provide a valid email address");
        } else {
            setSuccess(email, "");
        }

        if(passwordValue === '') {
            setError(password, "Password is required");
        }
        else if(passwordValue.length < 8){
            setError(password, "Password must be at least 8 character.");
        }
        else if(!checkPassword(passwordValue)){
            setError(password, "Password must be at least 1 uppercase letter, 1 lowercase letter, 1 special character, and 1 number.");
        }
        else {
            setSuccess(password, "");
        }

        if(confrmPasswordValue === '') {
            setError(confrmPassword, "Please confirm your password");
        } else if (confrmPasswordValue !== passwordValue) {
            setError(confrmPassword, "Passwords doesn't match");
        } else {
            setSuccess(confrmPassword, "");       
        }    
    }
    else{        
        form.submit();
    }      
}

function isValidPassword(){
    let newPasswordValue = newPassword.value.trim();
    let confirmPasswordValue = confirmPassword.value.trim();
    
    if(newPasswordValue === '' || !checkPassword(newPasswordValue) || newPasswordValue.length < 8 || confirmPasswordValue === '' || confirmPasswordValue !== newPasswordValue){
        if(newPasswordValue === '') {
            setError(newPassword, "Password is required");
        }
        else if(newPasswordValue.length < 8){
            setError(newPassword, "Password must be at least 8 character.");
        }
        else if(!checkPassword(newPasswordValue)){
            setError(newPassword, "Password must be at least 1 uppercase letter, 1 lowercase letter, 1 special character, and 1 number.");
        }
        else {
            setSuccess(newPassword, "");
        }

        if(confirmPasswordValue === '') {
            setError(confirmPassword, "Please confirm your password");
        } else if (confirmPasswordValue !== newPasswordValue) {
            setError(confirmPassword, "Passwords doesn't match");
        } else {
            setSuccess(confirmPassword, "");       
        }  
    }
    else{
        form.submit();
    }
}
});
        
