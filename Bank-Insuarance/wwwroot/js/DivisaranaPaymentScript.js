document.addEventListener('keypress', function (event) {
    if (event.key === 'Enter') {
        const target = event.target;
        if (target.classList.contains('tableinput')) {
            event.preventDefault(); // Prevent default behavior of Enter key
            const row = target.closest('tr');
            const submitButton = row.querySelector('.PaymentEnter');
            if (submitButton) {
                submitButton.click();
            }
        }
    }
});

document.addEventListener('keydown', function (event) {
    // Check if the pressed key is the "Escape" key (code 27)
    if (event.key === 'Escape' || event.keyCode === 27) {
        // Redirect to the home page (change the URL accordingly)
        window.location.href = '../Home/Index';
    }
});