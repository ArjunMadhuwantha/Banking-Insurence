

function togglePasswordVisibility() {
    const passwordInput = document.getElementById("password");
    if (passwordInput.type === "password") {
      passwordInput.type = "text";
    } else {
      passwordInput.type = "password";
    }
  }

  function togglePasswordVisibility2() {
    const passwordInput = document.getElementById("password2");
    if (passwordInput.type === "password") {
      passwordInput.type = "text";
    } else {
      passwordInput.type = "password";
    }
  }

  function togglePasswordVisibility3() {
    const passwordInput = document.getElementById("password3");
    if (passwordInput.type === "password") {
      passwordInput.type = "text";
    } else {
      passwordInput.type = "password";
    }
  }





document.addEventListener("DOMContentLoaded", function () {
    let textboxes = document.querySelectorAll('.textbox, .dropdown');

    // Add an event listener to each textbox
    textboxes.forEach(function (textbox, index, textboxesArray) {
        textbox.addEventListener('keydown', function (event) {
            if (event.key === 'Enter') {

                if (document.activeElement.classList.contains('textbox') || document.activeElement.classList.contains('dropdown')) {

                    
                        event.preventDefault();

                        // Focus on the next textbox in the array
                        let nextIndex = index + 1;
                        if (nextIndex < textboxesArray.length) {
                            textboxesArray[nextIndex].focus();
                        }
                    }

                }


            }
        );
    });

});



    document.addEventListener('keydown', function (event) {
        // Check if the pressed key is the "Escape" key (code 27)
        if (event.key === 'Escape' || event.keyCode === 27) {
            // Redirect to the home page (change the URL accordingly)
            window.location.href = '/Home/Home';
        }
    });



    
    