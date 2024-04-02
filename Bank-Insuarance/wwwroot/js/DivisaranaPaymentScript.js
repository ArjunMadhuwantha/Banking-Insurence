
document.addEventListener('keypress', function (event) {
    if (event.key === 'Enter') {
        const rows = document.querySelectorAll('tbody tr');

        rows.forEach(function (row) {
            const paymentInput = row.querySelector('.tableinput');
            if (paymentInput && paymentInput.value.trim() !== '') {
                const submitButton = row.querySelector('.PaymentEnter');
                submitButton.click();
            }
        });
    }
});
document.addEventListener('keydown', function (event) {
    // Check if the pressed key is the "Escape" key (code 27)
    if (event.key === 'Escape' || event.keyCode === 27) {
        // Redirect to the home page (change the URL accordingly)
        window.location.href = '/Home/Index';
    }
});











