
document.addEventListener("DOMContentLoaded", function () {
    let textboxes = document.querySelectorAll('.textbox');

    // Add an event listener to each textbox
    textboxes.forEach(function (textbox, index, textboxesArray) {
        textbox.addEventListener('keydown', function (event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                if (document.activeElement.classList.contains('textbox')) {


                    event.preventDefault();

                    // Focus on the next textbox in the array
                    let nextIndex = index + 1;
                    if (nextIndex < textboxesArray.length) {
                        textboxesArray[nextIndex].focus();

                    }

                }


            }
        });
    });
});


document.addEventListener('keydown', function (event) {
    // Check if the pressed key is the "Escape" key (code 27)
    if (event.key === 'Escape' || event.keyCode === 27) {
        // Redirect to the home page (change the URL accordingly)
        window.location.href = '../Home/Index';
    }
});













