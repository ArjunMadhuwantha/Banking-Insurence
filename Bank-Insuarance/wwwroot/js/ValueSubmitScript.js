
const branchInput = document.getElementById("branchInput");


branchInput.addEventListener("keydown", function (event) {
    
    if (event.keyCode === 13 || event.key === 'Enter') {
        
        submitValue(branchInput.value);
        
    }
});


function submitValue(value) {

    console.log("Submitted value:", value);
}



const fullname = document.getElementById("fullname");

fullname.addEventListener("keydown", function (event) {

    if (event.keyCode === 13 || event.key === 'Enter') {

        
        submitValue2(fullname.value);
    }
});


function submitValue2(value) {

    console.log("Submitted value:", value);
}


document.addEventListener('keydown', function (event) {
    // Check if the pressed key is the "Escape" key (code 27)
    if (event.key === 'Escape' || event.keyCode === 27) {
        // Redirect to the home page (change the URL accordingly)
        window.location.href = '../Home/Index';
    }
});



