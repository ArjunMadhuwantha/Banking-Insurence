function togglePopup() {
    var popup = document.getElementById('popup');
    if (popup.style.display === 'block') {
        popup.style.display = 'none';
    } else {
        popup.style.display = 'block';
    }
}
function togglePasswordVisibility() {
    const passwordInput = document.getElementById("passwordInput");
    if (passwordInput.type === "password") {
        passwordInput.type = "text";
    } else {
        passwordInput.type = "password";
    }
}

function checkPassword() {
    var passwordInput = document.getElementById("passwordInput");
    var password = passwordInput.value;

    if (password.trim() === "") {
        alert("Please enter a password");
        return;
    }
    else if (password.length < 8 || password.length > 8) {
        alert("Please enter 8 digit password");
        return;
    } else {
        window.location.href = "Home/Index";
    }

}